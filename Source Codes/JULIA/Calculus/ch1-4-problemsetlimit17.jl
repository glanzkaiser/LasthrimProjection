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

h(x) = (1-cos.(x)^2)/x
i(x) = abs(x)
j(x) = -abs(x)

plot(i, a, b; xtick=pitick(a, b, 4; mode=:latex), label=L"|x|", size=(720, 360), tickfontsize=10)
plot!(j, a, b; xtick=pitick(a, b, 4; mode=:latex), label=L"-|x|", size=(720, 360), tickfontsize=10)
plot!(h, a, b; xtick=pitick(a, b, 4; mode=:latex), label=L"\frac{1-cos^{2} x}{x}", size=(720, 360), tickfontsize=10)
