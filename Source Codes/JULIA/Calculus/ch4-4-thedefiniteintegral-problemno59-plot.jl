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

a, b = -0.3, 0.5π

f(x) = cos.(2x) +0.7

plot(f, a, b; ylims= (-1,3), xtick=false, ytick=false, framestyle=:zerolines,
	legend=:outerright, bottom_margin=5mm, 
	label=L"f(x) = \cos(2x) + 0.7", 
	size=(720, 360), tickfontsize=10)

d = 0.6
 
plot!(tangent(f, d), -1.2,2.2 , label="tangent line for f(3)",
	linestyle=:dash, color = "green3")

scatter!([0.085π], [1.682], color = "green2", label="", markersize = 3)
scatter!([0.373π], [0], color = "green2", label="", markersize = 3)
scatter!([0], [1.682], color = "green2", label="", markersize = 3)

plot!([0.085π,-0.2],[1.682,1.682], label="", linecolor=:green, linestyle=:dash)

annotate!([(0.15π,1.8, (L"(1,2)", 10, :black))])
annotate!([(0.37π,-0.2, (L"(3,0)", 10, :black))])
annotate!([(-0.08,1.8, (L"(0,2)", 10, :black))])
