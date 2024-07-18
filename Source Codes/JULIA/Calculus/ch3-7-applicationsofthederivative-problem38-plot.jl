using Plots, LaTeXStrings
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

a, b = 0, 75

# Since Julia assumes radians for the angles, we need to use a special function name
# instead of csc we use cscd. cscd will assumes the angles in degrees
f(x) = 8cscd(x) + 8cscd(75-x)
g(x) = f'(x)
#plot(f, a, b; xtick=pitick(a, b, 2; mode=:latex), framestyle=:zerolines,
#	legend=:outerright, label=L"L'(\theta) = 8 \ \csc \ \theta + 8 \ \csc \ (75 - \theta)", 
#	size=(720, 360), tickfontsize=10)
plot(g, a, b;ylims=(-25,25), framestyle=:zerolines,
	legend=:outerright, label=L"L'(\theta) = \frac{8(\sin^{2} \theta \cdot \cos \ (\theta - 75) - \cos \ \theta \cdot \sin^{2}(\theta-75))}{sin^{2}\theta \cdot \sin^{2} (\theta - 75)}", 
	size=(720, 360), tickfontsize=10)
