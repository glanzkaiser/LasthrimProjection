using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures
gr()

k = 2.193
k2 = 2.3

int = 0:0.1:23.3π
x1(θ) = (k^2)*(θ - sin(θ))/2
y1(θ) = (k^2)*(1 - cos(θ))/2

x2(θ) = (k2^2)*(θ - sin(θ))/2
y2(θ) = (k2^2)*(1 - cos(θ))/2

# note the dot, which means compute x for all values in the int range
plot(x1.(int),y1.(int), xlims=(0,37),ylims=(0,8),
	label=L"k=2.193", left_margin=5mm, bottom_margin=5mm,
	framestyle=:zerolines,
	legend=:topright)
plot!(x2.(int),y2.(int), xlims=(0,37),ylims=(0,8),
	label=L"k=2.3",framestyle=:zerolines,
	legend=:topright)
xlabel!(L"x(\theta) = \frac{k^2 (\theta - \sin \ \theta)}{2}")
ylabel!(L"y(\theta) = \frac{k^2 (1 - \cos \ \theta)}{2}")