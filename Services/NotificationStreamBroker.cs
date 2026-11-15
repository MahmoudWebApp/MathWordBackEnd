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
    private readonly ConcurrentDictionary<int, ConcurrentDictionary<Guid, Channel<bool>>> _listeners = new();

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

    public Subscription Subscribe(int userId)
    {
        if (userId <= 0) throw new ArgumentOutOfRangeException(nameof(userId));
        var key = Guid.NewGuid();
        var channel = Channel.CreateBounded<bool>(new BoundedChannelOptions(4)
        {
            FullMode = BoundedChannelFullMode.DropOldest,
            SingleReader = true,
            SingleWriter = false
        });
        var userListeners = _listeners.GetOrAdd(userId,
            _ => new ConcurrentDictionary<Guid, Channel<bool>>());
        userListeners[key] = channel;

        return new Subscription(channel.Reader, () =>
        {
            if (userListeners.TryRemove(key, out var removed))
                removed.Writer.TryComplete();
            if (userListeners.IsEmpty)
                _listeners.TryRemove(
                    new KeyValuePair<int, ConcurrentDictionary<Guid, Channel<bool>>>(
                        userId, userListeners));
        });
    }

    public void Notify(int userId)
    {
        if (_listeners.TryGetValue(userId, out var listeners))
        {
            foreach (var channel in listeners.Values)
                channel.Writer.TryWrite(true);
        }
    }
}
