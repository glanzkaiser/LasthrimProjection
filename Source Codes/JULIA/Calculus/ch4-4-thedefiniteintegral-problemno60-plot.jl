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

a, b = 0, 1.97π

f(x) = 0.5(cos.(3x) + 1/exp(0.3x^2) -sin(0.1x) + 2)

plot(f, a, b; ylims= (-1,3), xtick=false, ytick=true, framestyle=:zerolines,
	legend=:outerright, bottom_margin=5mm, 
	label=L"f(x) = \frac{1}{2} (\cos(3x) + \frac{1}{e^{0.3x^{2}}} - \sin(0.1x) + 2)", 
	size=(720, 360), tickfontsize=10)

# fill d with the position of the x-axis 
# to create tangent line at the (x,f(x)) 
d = 4.107

plot!(tangent(f, d), -1,6.5 , label="tangent line for f(4.107)",
	linestyle=:dash, color = "green3")

scatter!([4.107], [f(4.107)], color = "green2", label="", markersize = 3)
scatter!([0.373π], [0], color = "green2", label="", markersize = 3)
scatter!([0], [2], color = "green2", label="", markersize = 3)

plot!([0,1.2],[2,0], label="", linecolor=:green, linestyle=:dash)

annotate!([(4.107,1.5, (L"(4,1)", 10, :black))])
annotate!([(0.37π,-0.2, (L"(1,0)", 10, :black))])
