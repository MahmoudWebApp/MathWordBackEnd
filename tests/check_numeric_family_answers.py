"""Independently solve the recurring question families in the November content batches.

With --snapshot, accept UTF-8 JSON Lines with id, q (English prompt), and
opts (ordered [latex, correct] pairs). Report unmatched prompts separately.
"""
import argparse
from collections import Counter
from fractions import Fraction
import json
from math import comb, gcd, isqrt, lcm
from pathlib import Path
import re
from statistics import median, mode


ROOT = Path(__file__).resolve().parents[1]
F = Fraction


def clean_question(text):
    return (text.replace(r"\(", "").replace(r"\)", "").replace("$", "")
            .replace(r"\begin{pmatrix}", "[").replace(r"\end{pmatrix}", "]")
            .replace(r"\\", ";"))


def canonical(value):
    if isinstance(value, (int, Fraction)):
        return F(value)
    text = str(value).strip().replace("−", "-")
    # Reviewed bilingual presentation of the same IVT condition; retain
    # the original canonical answer for archived content and recomputation.
    if text == r"\text{الدالة متصلة على [0,1] (Continuous on [0,1])}":
        return r"f\text{ is continuous on }[0,1]"
    if match := re.fullmatch(r"(-?)\\frac(?:\{(\d+)\}|(\d))(?:\{(\d+)\}|(\d))", text):
        sign, n1, n2, d1, d2 = match.groups()
        if int(d1 or d2):
            return F(int(sign + (n1 or n2)), int(d1 or d2))
    if match := re.fullmatch(r"(\d+)\^\{(-?\d+)\}", text):
        return F(int(match[1])) ** int(match[2])
    if re.fullmatch(r"[+-]?\d+(?:\.\d+)?", text):
        return F(text)
    # Factor choices can differ only in factor order.
    if match := re.fullmatch(r"\(x([+-]\d+)\)\(x([+-]\d+)\)", text):
        return tuple(sorted(map(int, match.groups())))
    return text


def triangle_leg(squared):
    root = isqrt(squared)
    if root * root != squared:
        raise ValueError("triangle does not have an integral requested side")
    return root


def factor_quadratic(linear, constant):
    for small in range(1, isqrt(constant) + 1):
        large, remainder = divmod(constant, small)
        if remainder == 0 and small + large == linear:
            return f"(x+{small})(x+{large})"
    raise ValueError("quadratic has no positive integer factor pair")


def fifth_term(a, b, c, d):
    if not b - a == c - b == d - c:
        raise ValueError("non-arithmetic progression")
    return d + (d - c)


def power_integral(coefficient, power):
    exponent = power + 1
    return f"{F(coefficient, exponent)}x^{{{exponent}}}+C"


def special_sine(degrees):
    return {0: 0, 30: F(1, 2), 45: r"\frac{\sqrt{2}}{2}",
            60: r"\frac{\sqrt{3}}{2}", 90: 1}[degrees]


# Each @ captures an integer from the complete question. Fixed exponents,
# initial values and units are literal parts of the pattern.
RULES = [
    ("Calculate (@+@)-@.", lambda a, b, c: a + b - c),
    ("Solve x+@=@.", lambda b, total: total - b),
    ("A rectangle is @ cm by @ cm. Find its area in square centimetres.", lambda a, b: a*b),
    ("Find the arithmetic mean of @, @, and @.", lambda *values: F(sum(values), len(values))),
    (r"Write 2^{@}\times2^2 as a single power of 2.", lambda exp: 2**(exp+2)),
    ("If f(x)=@x+@, find f(@).", lambda a, b, x: a*x+b),
    ("If three notebooks cost @, how much do five cost at the same price per notebook?", lambda cost: F(5*cost, 3)),
    ("A right triangle has legs @ and @. Find the hypotenuse.", lambda a, b: triangle_leg(a*a+b*b)),
    ("Find the sum of the roots of (x-@)(x-@)=0.", lambda a, b: a+b),
    (r"In a right triangle opposite θ is @, hypotenuse @, adjacent @. Find \sin\theta.", lambda opp, hyp, adj: F(opp, hyp)),
    ("Given f(x)=@x^2+@x, compute f'(@).", lambda a, b, x: 2*a*x+b),
    ("Toss a fair coin @ times. What is the probability of exactly two heads?", lambda n: F(comb(n, 2), 2**n)),
    (r"For f(x,y)=@x^2y+@y^2, evaluate \partial f/\partial x at (@,@).", lambda a, b, x, y: 2*a*x*y),
    ("Compute the determinant of [@&@;@&@].", lambda a,b,c,d: a*d-b*c),
    ("Solve y'=@y with y(0)=@.", lambda k, initial: f"{initial}e^{{{k}x}}"),
    ("Compute @ × @.", lambda a,b: a*b),
    ("Calculate @ divided by @.", F),
    ("Each pen costs @ units. What do @ pens cost?", lambda price,n: price*n),
    ("Solve @x+@=@.", lambda a,b,total: F(total-b,a)),
    ("Sequence @, @, @, @; find the fifth term.", fifth_term),
    ("If x=@, evaluate 2x-@.", lambda x,b: 2*x-b),
    ("Find the perimeter of a @ cm by @ cm rectangle.", lambda a,b: 2*(a+b)),
    ("Two angles of a triangle are @° and @°. Find the third.", lambda a,b: 180-a-b),
    ("Convert @ metres to centimetres.", lambda metres: 100*metres),
    ("Find the mode: @, @, @, @, @.", lambda *v: mode(v)),
    ("A bag has @ red and @ blue balls. Find the probability of red.", lambda red,blue: F(red,red+blue)),
    ("What is the median of ordered values @, @, @, @, @?", lambda *v: median(v)),
    ("Find gcd(@,@).", gcd),
    (r"Simplify \frac{@^{@}}{@^{@}}.", lambda a,b,c,d: F(a**b,c**d)),
    ("Find the least common multiple of @ and @.", lcm),
    ("Given f(x)=@x+@, solve f(x)=@.", lambda a,b,v: F(v-b,a)),
    ("Find the slope between (@,@) and (@,@).", lambda x,y,u,v: F(v-y,u-x)),
    ("Given g(x)=@x^2+@, find g(@).", lambda a,b,x: a*x*x+b),
    ("A store discounts @% from a price of @. Find the discount amount.", lambda rate,price: F(rate*price,100)),
    ("Map scale: 1 cm represents @ km. What distance is @ cm?", lambda scale,cm: scale*cm),
    ("If @ increases by @%, what is the new price?", lambda price,rate: F(price*(100+rate),100)),
    ("Find the sum of interior angles of a polygon with @ sides.", lambda n: 180*(n-2)),
    ("A right triangle has hypotenuse @ and one leg @. Find its other leg.", lambda h,a: triangle_leg(h*h-a*a)),
    ("Similar triangles: a side is @ with scale factor @. Find the corresponding side.", lambda side,scale: side*scale),
    ("What is the product of the roots of x^2-@x+@=0?", lambda b,c: c),
    ("Compute the discriminant of x^2+@x+@=0.", lambda b,c: b*b-4*c),
    ("Factor x^2+@x+@.", factor_quadratic),
    ("Right triangle: adjacent to θ is @, hypotenuse @. Find cos θ.", F),
    ("Right triangle: opposite θ is @, adjacent @. Find tan θ.", F),
    ("Find the exact sine of angle @°.", special_sine),
    ("Find f'(@) for f(x)=@x^{@}.", lambda x,a,n: a*n*x**(n-1)),
    (r"Compute \int @x^{@}\,dx.", power_integral),
    (r"Evaluate \int_0^{@} @t\,dt.", lambda upper,a: F(a*upper**2,2)),
    ("How many unordered pairs can be selected from @ students?", lambda n: comb(n,2)),
    ("Toss a fair coin @ times; probability of heads on all tosses?", lambda n: F(1,2**n)),
    ("Value @ appears @ times and @ appears @ times. Find the mean.", lambda a,m,b,n: F(a*m+b*n,m+n)),
    (r"Given f(x,y)=@x^2y+@y^2, evaluate \partial f/\partial y at (@,@).", lambda a,b,x,y: a*x*x+2*b*y),
    ("Find gradient of f(x,y)=x^2+y^2 at (@,@).", lambda x,y: f"({2*x},{2*y})"),
    ("For f(x,y)=x^2+3y^2, find directional derivative at (@,@) in positive x-direction.", lambda x,y: 2*x),
    ("Find trace of [@&0;0&@].", lambda a,b: a+b),
    ("Multiply vector (@,@) by scalar @.", lambda x,y,k: f"({k*x},{k*y})"),
    ("Find determinant of [@&@;0&@].", lambda a,b,d: a*d),
    ("Given y'=@, y(0)=@, find y(@).", lambda k,b,x: k*x+b),
    ("Given y''=0, y'(0)=@, y(0)=@, find y(@).", lambda k,b,x: k*x+b),
    ("Given y'=@x, y(0)=@, find y(@).", lambda k,b,x: F(k*x*x,2)+b),
    (r"Find limit of a_n=\frac{@}{n+1} as n tends to infinity.", lambda k: 0),
    (r"Find the limit of a_n=(\frac{1}{@})^n as n tends to infinity.", lambda k: 0 if k>1 else 1),
    ("For f(0)=-@ and f(1)=@, what sufficient condition guarantees a root in (0,1) by the intermediate value theorem?",
     lambda a,b: r"f\text{ is continuous on }[0,1]"),
]


def archived_rows():
    for path in sorted((ROOT / "content/batches").glob("mathworld-2026-11-20-*.json")):
        for row in json.loads(path.read_text(encoding="utf-8"))["problems"]:
            yield {"id": row["ContentKey"], "q": row["QuestionTextEn"],
                   "opts": [(o["LatexCode"], o["IsCorrect"]) for o in row["Options"]]}


COMPILED_RULES = [(re.compile(r"(\d+)".join(map(re.escape, template.split("@")))), solve)
                  for template, solve in RULES]


def audit(rows):
    count = Counter()
    skipped = 0
    failures = []
    for row in rows:
        prompt = clean_question(row["q"])
        for regex, solve in COMPILED_RULES:
            match = regex.fullmatch(prompt)
            if match:
                expected = canonical(solve(*map(int, match.groups())))
                options = row["opts"]
                matches = [i for i, (value, _) in enumerate(options) if canonical(value) == expected]
                keys = [i for i, (_, correct) in enumerate(options) if correct]
                if len(keys) != 1 or matches != keys:
                    failures.append((row["id"], str(expected), keys, matches))
                count[regex.pattern] += 1
                break
        else:
            skipped += 1
    return count, skipped, failures


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--snapshot", type=Path)
    args = parser.parse_args()
    if args.snapshot:
        with args.snapshot.open(encoding="utf-8") as stream:
            counts, unmatched, failures = audit(json.loads(line) for line in stream if line.strip())
    else:
        counts, unmatched, failures = audit(archived_rows())
        assert len(counts) == 63 and set(counts.values()) == {5} and unmatched == 5, (counts, unmatched)
    print(f"{sum(counts.values())} matched, {len(counts)} families, {unmatched} outside these rules")
    for failure in failures:
        print("Answer mismatch", failure)
    raise SystemExit(bool(failures))
