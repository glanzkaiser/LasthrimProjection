using Plots, LaTeXStrings
pyplot(fmt=:svg)

function pitick(start, stop, denom; mode=:text)
    a = Int(cld(start, π/denom))
    b = Int(fld(stop, π/denom))
    tick = range(a*π/denom, b*π/denom; step=π/denom)
    ticklabel = piticklabel.((a:b) .// denom, Val(mode))
    tick, ticklabel
end

function piticklabel(x::Rational, ::Val{:text})
    iszero(x) && return "0"
    S = x < 0 ? "-" : ""
    n, d = abs(numerator(x)), denominator(x)
    N = n == 1 ? "" : repr(n)
    d == 1 && return S * N * "π"
    S * N * "π/" * repr(d)
end

function piticklabel(x::Rational, ::Val{:latex})
    iszero(x) && return L"0"
    S = x < 0 ? "-" : ""
    n, d = abs(numerator(x)), denominator(x)
    N = n == 1 ? "" : repr(n)
    d == 1 && return L"%$S%$N\pi"
    L"%$S\frac{%$N\pi}{%$d}"
end

a, b = -2π, 2π

f(x) = tan.(2x)/(sin.((2x) - 1))
g(x) = sin.((3x) + 4x)/(x*sec.(x))
h(x) = sin.(x)*sin.(x)/(x^(2))

p1 = plot(f, a, b)
p2 = plot(g, a, b)
p3 = plot(h, a, b)

s1 = L"\frac{tan(2t/5)}{\sin \ 2t - 1}";
s2 = L"\frac{\sin3t + 4t}{t \ \sec \ t}";
s3 = L"\frac{\sin^{2} \ \theta}{\theta^{2}}";

plot(p1, p2, p3, layout = (3, 1), xaxis = "", yaxis = "y", label=[s1 s2 s3])
