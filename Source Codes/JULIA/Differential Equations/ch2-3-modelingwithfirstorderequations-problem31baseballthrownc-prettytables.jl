using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures, PrettyTables

gr()
u = 125
r = 1/5
h = 3
A = pi/4 
g = 32

#int = range(0, stop=10, length=300)
int = -3π:1:0.2π
x(t) = (u/r)*cos(A) - (u/r)*exp(-r*t)*cos(A)
# 625*cos(A)-625*exp(-r*t)*cos(A)
y(t) = -(g*t/r) + (g + h*r^2 + r*u*sin(A))/(r^2) - (u*sin(A)/r + (g/r^2))*exp(-r*t)

println(pretty_table(String, 
 	 vcat([[string(t) x(t) y(t)] for t in 0:0.5:20]...); 
  	header=["t", "x(t)", "y(t)"]))