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

a, b = -1, 1

y(x) = atanh(x)
Dy(x)=y'(x)
DDy(x)=Dy'(x)

xs1 = range(a, b, length=150)
ys1 = Dy.(xs1)
ys2 = DDy.(xs1)

plot(xs1, y, color=:red, 
	xlims=(-1.2,1.2), ylims=(-π/2,π/2),framestyle=:zerolines,
	linestyle=:solid,  linecolor=:red2,
	legend=:topleft, label=L"\tanh^{-1} \ x", 
	bottom_margin=3mm,
	size=(800, 460), tickfontsize=10)

# First Derivative plot
plot!(xs1, ys1, label=L"D_{x} \tanh^{-1} \ x ",
	color=:blue2)

# Second Derivative plot
plot!(xs1, ys2, label=L"D^{2}_{x} \tanh^{-1} \ x ", color=:green3)
