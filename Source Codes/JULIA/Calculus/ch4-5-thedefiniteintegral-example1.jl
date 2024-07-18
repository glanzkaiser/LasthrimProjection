using Plots, LaTeXStrings, Plots.PlotMeasures, MTH229
gr()

# tangent in MTH229 package
tangent(f, c) = x -> f(c) + f'(c)*(x-c)

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

a, b = 0, 0.566π

f(x) = x*(sin(x^(2)))

plot(f, a, b; ylims= (-1,3), xtick=true, ytick=true, framestyle=:zerolines,
	legend=:topleft, bottom_margin=5mm, 
	label=L"f(x) = x \ \sin(x^{2})", 
	size=(720, 360), tickfontsize=10)

annotate!([(sqrt(π),-0.2, (L"\sqrt{\pi}", 10, :black))])
