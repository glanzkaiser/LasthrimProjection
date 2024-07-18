using Plots, LaTeXStrings, Plots.PlotMeasures
gr()

# Create an approximation based on Least Squares:
# Insert your choice of basis functions in vector function below
ϕ(x) = [1,x,x^2,x^3,sin(x),cos(x),sin(x/2),cos(x/2)]
#
# Standard linear regression
Φ = ϕ.(x) |> x-> reduce(hcat,x) |> permutedims
b = Φ\y
# Approximating function
f(x) = sum(ϕ(x).*b)

x = [10/60, 20/60, 30/60, 40/60, 50/60, 60/60, 70/60, 80/60, 80/60, 90/60, 100/60, 
	110/60, 120/60, 130/60, 140/60, 150/60, 160/60, 170/60, 180/60, 190/60, 200/60, 210/60]
y = [0, 55, 57, 60, 70, 70, 70, 70, 19, 0, 59, 63, 65, 62, 0, 0, 0, 22, 38, 35, 25, 0]

scatter(x,y)
plot(x,y; marker=(:circle,5), legend=:topright, label=" f(x)", 
	left_margin=5mm, size=(720, 360), tickfontsize=10)

plot!(x,f.(x), legend=:topright,
	label="Least Square approximation")