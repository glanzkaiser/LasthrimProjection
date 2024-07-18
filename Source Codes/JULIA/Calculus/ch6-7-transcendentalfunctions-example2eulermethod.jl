using SymPy, CalculusWithJulia, LaTeXStrings,Plots,PrettyTables
@syms x,y

F(y,x) = y # The differential equation is y' = y
x0, y0 = 0, 1 # The initial condition is y(0)=1

# For calculation that will be shown with Pretty Table below
n = 100
h = 0.2
xs = zeros(n+1)
ys = zeros(n+1)
xs[1] = x0   # index is off by 1
ys[1] = y0
for i in 1:n
  xs[i + 1] = xs[i] + h
  ys[i + 1] = ys[i] + h * F(ys[i], xs[i])
end

println("Euler's Method:")
println("The differential equation: y' = y")
println("Initial condition: y(0) = 1")
println("interval [0,1]")
println("")

println(pretty_table(String, 
 	 vcat([[(j*0.2)-0.2 ys[j] exp((j*0.2)-0.2)] for j in 1:1:6]...); 
  	header=["x_{n}", "y_{n}", "e^{x_{n}}"]))
