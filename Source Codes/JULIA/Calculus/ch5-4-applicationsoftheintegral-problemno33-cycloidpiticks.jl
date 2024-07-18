using Plots, LaTeXStrings, Plots.PlotMeasures
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

a, b = 0, 4π

# To plot a cycloid
θ = 0:0.1:2π
x = 2*(θ .- sin.(θ))
y = 2*(1 .- cos.(θ))
plot(x,y; xtick=pitick(a, b, 1; mode=:latex), 
	label=L"(x,y) = (a(t - \sin \ t ), a(1 - \cos \ t))", size=(720, 360), 
	bottom_margin=5mm,tickfontsize=10)

annotate!([(3.14,-0.5, (L"\frac{\pi a}{2}", 10, :blue))])
annotate!([(6.28,-0.5, (L"\pi a", 10, :blue))])
annotate!([(9.42,-0.5, (L"\frac{3 \pi a}{2}", 10, :blue))])
annotate!([(12.56,-0.5, (L"2 \pi a", 10, :blue))])
