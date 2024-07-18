using Plots,  LaTeXStrings
gr()

f(x) =  -x^2 + 2x + 2
f'

# gradient_line(f, x₀) is a tangent line with an intercept at point x₀ 
# in other words it will pass x₀ 
# and a slope of f'(x₀) - essentially your usual y = a + bx 
# where a is the value of the actual function at the point x₀ through 
# which we want the line to pass, 
# b is the derivative of the function at that point, 
# and the "x" in y=a+bx is replaced by x-x₀ 
# because our "origin" is the point at which we're taking the tangent. 

gradient_line(f, x₀) = (x -> f(x₀) + f'(x₀)*(x-x₀))

default(markerstrokecolor = "white", linewidth = 2);

#Plot f
plot(f, -3:0.1:5, label = "f(x) = -x² + 2x + 2", xlabel = "x", ylabel = "f(x)");

# Plot tangent lines
scatter!([-1], [f(-1)], label = "", markersize = 5);
plot!(gradient_line(f, -1), -3:0.1:0.5, label = "f'(-1)", color = 2);

scatter!([1/2], [f(1/2)], label = "", markersize = 5, color = 3);
plot!(gradient_line(f, 1/2), -1:0.1:2, label = "f'(1/2)", color = 3)

scatter!([2], [f(2)], label = "", markersize = 5, color = 4);
plot!(gradient_line(f, 2), 0.2:0.1:3, label = "f'(2)", color = 4)

scatter!([3], [f(3)], label = "", markersize = 5, color = 5);
plot!(gradient_line(f, 3), 0.8:0.1:4, label = "f'(3)", color = 5)
