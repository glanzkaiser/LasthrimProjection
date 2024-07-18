using Plots, LaTeXStrings, PrettyTables, Plots.PlotMeasures, SymPy
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

a, b = -π/2, π/2

f(x) = log(cos(x)) + log(sec(x))

plot(f, a, b; ylims= (-1,1), xtick=pitick(a, b, 4; mode=:latex), framestyle=:zerolines,
	legend=:topright, label=L" y = \ln \ \cos \ x + \ln \ \sec \ x ", 
	left_margin=5mm, size=(720, 360), tickfontsize=10)

# Uncomment this to see the table
# Alternative 1: Pretty Tables
#=
println(pretty_table(String, 
 	 vcat([[string(t)*"π" cospi(t) 1/cospi(t) log(cospi(t)) log(1/cospi(t)) log(cospi(t))+log(1/cospi(t)) ] for t in -0.5:0.05:0.5]...); 
  	header=["x", "cos(x)", "sec(x)", "ln(cos(x))", "ln(sec(x))", "ln(cos(x)) + ln(sec(x))" ]))
=#
