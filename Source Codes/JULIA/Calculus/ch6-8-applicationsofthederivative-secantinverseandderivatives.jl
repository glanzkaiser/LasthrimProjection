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

a, b = 1, 2π

y(x) = asec(x)
Dy(x)=y'(x)
DDy(x)=Dy'(x)

xs = range(-4, -1, length=150)
xs1 = range(a, b, length=150)
ys1 = Dy.(xs1)
ys2 = DDy.(xs1)

plot(xs, y, color=:red, ytick=pitick(0, b, 2; mode=:latex), 
	xlims=(-3,3), ylims=(-π/2,π),framestyle=:zerolines,
	linestyle=:solid,  linecolor=:red2,
	legend=:outerbottom, label=L"\sec^{-1} \ x", 
	bottom_margin=3mm,
	size=(800, 460), tickfontsize=10)# the inverse function
plot!(xs1, y, color=:red, label="")

# First Derivative plot
plot!(xs1, ys1, label=L"D_{x} \sec^{-1} \ x = \frac{1}{|x| \sqrt{x^{2}-1}}",
	color=:blue2)
plot!(xs, ys1, label="",color=:blue2)

# Second Derivative plot
plot!(xs1, ys2, label=L"D^{2}_{x} \sec^{-1} \ x", color=:green3)
plot!(xs, ys2, label="", color=:green3)
