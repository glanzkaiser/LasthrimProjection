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

f(x) = 0.5+sin(x+π)
h(x) = sin(x+π)
# pick any kind of function for k which is in [0,1] 
#k(x) = 0.5 + 0.5*cos(x)
k(x) = 0.5 + 0.5*cos(x + sin(4*x))

g(x) = f(x) * k(x) + h(x) * (1-k(x))

plot(f, a, b; xtick=pitick(a, b, 4; mode=:latex), legend=:outerright, label=L"\frac{1}{2}+  \sin \ (x + π)", size=(720, 360), tickfontsize=10)
plot!(g, a, b; xtick=pitick(a, b, 4; mode=:latex), label=L"\frac{1}{2} + \frac{1}{2} \cos(x + \sin(4x))", size=(720, 360), tickfontsize=10)
plot!(h, a, b; xtick=pitick(a, b, 4; mode=:latex), label=L"\sin \ (x + π)", size=(720, 360), tickfontsize=10)

