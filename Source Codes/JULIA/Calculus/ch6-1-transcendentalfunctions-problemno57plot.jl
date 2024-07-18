using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

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

a, b = -2π, 3π

f(x) = log(1.5 + sin(x))
g(x) = cos(x)/(1.5 + sin(x))
h(x) = -((sin(x))/(sin(x)+1.5)) - (0.4444 * cos(x)^2)/((2/3*sin(x) + 1)^2)

p1 = plot(f, a, b; ylims= (-1,1), xtick=pitick(a, b, 2; mode=:latex), framestyle=:zerolines,
	legend=:topright, label=L" f(x) = \ln(1.5 + \sin(x)) ", 
	left_margin=5mm, bottom_margin=2mm, size=(720, 360), tickfontsize=10)
p2 = plot(g, a, b; ylims= (-1,1), xtick=pitick(a, b, 2; mode=:latex), framestyle=:zerolines,
	legend=:topright, label=L" f'(x) = \frac{\cos(x)}{1.5 + \sin(x)} ", 
	left_margin=5mm, bottom_margin=2mm, size=(720, 360), tickfontsize=10)
p3 = plot(h, a, b; ylims= (-1,1), xtick=pitick(a, b, 2; mode=:latex), framestyle=:zerolines,
	legend=:topright, label=L" f''(x) ",
	left_margin=5mm, bottom_margin=3mm, size=(720, 360), tickfontsize=10)

plot(p1, p2, p3, layout = (3, 1), legend=:outerright,
     xaxis = "x", yaxis = "y")