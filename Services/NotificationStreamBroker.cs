using System.Collections.Concurrent;
using System.Threading.Channels;

namespace MathWorldAPI.Services;

/// <summary>
/// Single-process, user-scoped notification invalidation. Events contain NO
/// notification text, tokens or user data; receivers re-fetch their private
/// JWT-owned inbox. A future multi-instance deployment needs a distributed
/// pub/sub backplane. Polling remains a fallback for missed events.
/// </summary>
public sealed class NotificationStreamBroker
{
    private readonly ConcurrentDictionary<Guid, (int UserId, Channel<bool> Channel)> _listeners = new();
    private readonly object _gate = new();
    private const int MaxStreamsPerAccount = 3;

    public sealed class Subscription : IDisposable
    {
        private readonly Action _remove;
        private int _disposed;

        internal Subscription(ChannelReader<bool> reader, Action remove)
        {
            Reader = reader;
            _remove = remove;
        }

        public ChannelReader<bool> Reader { get; }

        public void Dispose()
        {
            if (Interlocked.Exchange(ref _disposed, 1) == 0)
                _remove();
        }
    }

    // Backwards-compatible API for internal callers that require a stream.
    // HTTP endpoints should prefer TrySubscribe so they can return 429.
    public Subscription Subscribe(int userId) =>
        TrySubscribe(userId) ??
        throw new InvalidOperationException("Too many active notification streams.");

    /// <summary>
    /// Prevent unlimited simultaneous open HTTP streams per account.
    /// The lock makes the per-user cap atomic even with concurrent tabs.
    /// </summary>
    public Subscription? TrySubscribe(int userId)
    {
        if (userId <= 0) throw new ArgumentOutOfRangeException(nameof(userId));
        lock (_gate)
        {
            if (_listeners.Values.Count(x => x.UserId == userId) >= MaxStreamsPerAccount)
                return null;
            var key = Guid.NewGuid();
            var channel = Channel.CreateBounded<bool>(new BoundedChannelOptions(4)
            {
                FullMode = BoundedChannelFullMode.DropOldest,
                SingleReader = true,
                SingleWriter = false
            });
            _listeners[key] = (userId, channel);
            return new Subscription(channel.Reader, () =>
            {
                lock (_gate)
                {
                    if (_listeners.TryRemove(key, out var removed))
                        removed.Channel.Writer.TryComplete();
                }
            });
        }
    }

    public void Notify(int userId)
    {
        foreach (var listener in _listeners.Values)
        {
            if (listener.UserId == userId)
                listener.Channel.Writer.TryWrite(true);
        }
    }
}
