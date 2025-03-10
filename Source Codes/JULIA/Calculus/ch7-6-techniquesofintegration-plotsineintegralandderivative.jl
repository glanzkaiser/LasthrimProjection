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

a, b = -5π, 5π

y(x) = sinint(x)
xs = range(-5π, 5π, length=150)

Dy(x)=y'(x)

xs1 = range(a, b, length=150)
ys1 = Dy.(xs1)

plot(xs, y, color=:red, xtick=pitick(-b, b, 2; mode=:latex), 
	xlims=(-5π,5π), ylims=(-π,π),framestyle=:zerolines,
	linestyle=:solid,  linecolor=:red2,
	legend=:topleft, label=L"Si(x) = \int_{0}^{x} \frac{\sin \ t}{t} \ dt", 
	bottom_margin=3mm,
	size=(800, 460), tickfontsize=10)

# First Derivative plot
plot!(xs1, ys1, label=L"D_{x} Si (x) = \frac{\sin \ x}{x}",
	color=:blue2)

#using SymPy
#x, t = symbols("x t")

#f_sineintegral = integrate(sin(t)/t, (t,0,x))

#println("the sine integral = ", f_sineintegral)