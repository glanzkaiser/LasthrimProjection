# env -u LD_LIBRARY_PATH julia --project="."
using Plots, SpecialFunctions, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia
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

a, b = -2π, 2π

y(x) = erf(x)
Dy(x)=y'(x)
DDy(x)=Dy'(x)

xs = range(-2π, 2π, length=150)
xs1 = range(a, b, length=150)
ys1 = Dy.(xs1)
ys2 = DDy.(xs1)

plot(xs, y, color=:red, xtick=pitick(-π, π, 2; mode=:latex), 
	xlims=(-4,4), ylims=(-π,π),framestyle=:zerolines,
	linestyle=:solid,  linecolor=:blue2,
	legend=:topleft, label=L"erf(x) = \frac{2}{\sqrt{\pi}} \int_{0}^{x} e^{-t^{2}} \ dt", 
	bottom_margin=3mm,
	size=(800, 460), tickfontsize=10)
plot!(xs1, y, color=:blue2, label="")

# First Derivative plot
plot!(xs1, ys1, label=L"D_{x} erf (x) = \frac{2}{\sqrt{\pi}}  e^{-x^{2}}  ",
	color=:green2)
plot!(xs, ys1, label="",color=:green2)

#using SymPy
#x = symbols("x")
#f_erf = erf(x)
#Df_erf = diff(erf(x), x)

#println("f(x) = ", f_erf)
#println("f'(x) = ", Df_erf)

