# https://discourse.julialang.org/t/region-bounded-between-sin-x-and-cos-x/101008

using Plots, LaTeXStrings, Plots.PlotMeasures, CalculusWithJulia
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

a, b = 0, 6π

y(x) = x*sin(x)
xs1 = range(a, b, length=150)


plot(xs1, y, color=:red, xtick=pitick(a, b, 4; mode=:latex), 
	xlims=(0, 6π), ylims=(-20,20),framestyle=:zerolines,
	linestyle=:solid,  linecolor=:blue2,
	legend=:topleft, label=L"y = x \ \sin \ x", 
	bottom_margin=3mm,
	size=(800, 460), tickfontsize=10)

plot!(y,2π,3π, label="", fill=(0, 0.15, :green))
annotate!([(π/2+0.2,2.5, ("First arch", 6, :black))])
annotate!([(5π/2+0.2,9.5, ("Second arch", 6, :black))])

# Compute the volume
# To compute an indefinite integral
using SymPy
x = symbols("x")
n = symbols("n")
int_y = integrate(x*sin(x),(x,2π*(n-1),π*(2n-1)))
volume = integrate(2π*(x^2)*sin(x),(x,2π,3π))

print("Surface area =")
print(int_y)
println()
print("\nVolume for the second arch revolving about y-axis = ")
print(volume)