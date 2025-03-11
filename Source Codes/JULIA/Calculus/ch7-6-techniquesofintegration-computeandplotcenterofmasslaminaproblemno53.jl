using Plots, LaTeXStrings, Plots.PlotMeasures, MTH229

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

using SymPy

@syms x
@syms c

f(x) = 6*exp(-x/3)
g(x) = 0

a, b = 0, c

# To calculate the integral between interval [a,b]
m = integrate(f(x)-g(x), (x, a,b))
My = integrate(x*(f(x)-g(x)), (x, a,b))

x_bar = My/m

println("m = ", m.simplify())
println("M_{y} = ", My.simplify())
println("x_{bar} = ", x_bar.simplify())

h(c) = x_bar.simplify() - 2
h_derivative = diff(h(c),c)

# We use newton() from MTH229 to help computing Newton's method
println("Function to be computed with Newton's method")
println("h(c) = ", h(c))
println("h'(c) = ", h_derivative)

println("h(x) = ", h(c).subs(c,x))
l(x) = h(c).subs(c,x)
ld(x) = diff(l(x),x)

println()
# Compute the root with Newton' method with initial guess = 2
newton(l(x), ld(x), 2, verbose=true)

cstar = newton(l(x),ld(x),2)

xs = range(a, b, length=150)

plot(f, color=:green3,
	xlims=(0, 3π), ylims=(0, 3π), framestyle=:zerolines,
	linestyle=:solid,  linecolor=:green4,
	legend=:topright, label=L"f(x) = 6 e^{- \frac{x}{3}}", 
	bottom_margin=3mm,
	size=(1200, 800), tickfontsize=10)

plot!([cstar], seriestype = :vline, label=L"c")

t = collect(range(0, cstar, length= 100))
# Fill the area between f(x) and f(x) = 0 with range of t
plot!(t, f, fillrange = 0, fillalpha = 0.35, c = 1, label = "Area")