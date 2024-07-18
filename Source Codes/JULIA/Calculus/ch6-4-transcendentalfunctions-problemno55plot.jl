using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
gr()

f(x) = x^(sin(x))


plot(f, xlims=(0,80),ylims=(0,100),
	label=L"y = x^{\sin \ x}", left_margin=5mm, bottom_margin=5mm,
	framestyle=:zerolines,
	legend=:topleft)
plot!(f,0,4*pi, label=L"\int_{0}^{4 \pi} x^{\sin \ x} \ dx ", fill=(0, 0.15, :blue))