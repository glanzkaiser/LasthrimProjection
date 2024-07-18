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

a, b = a, b = -2π, 2π

h(x) = pi*x/cos(x)

plot(h, a, b; 
	legend=:outerright, label=L"\frac{π \ \theta}{cos \ \theta}", 
	framestyle=:zerolines, 
	xlims = (-30,30), xtick=pitick(a, b, 2; mode=:latex), 
	ylims = (-30,30), yticks = -30:10:30, 
	size=(720, 360))
