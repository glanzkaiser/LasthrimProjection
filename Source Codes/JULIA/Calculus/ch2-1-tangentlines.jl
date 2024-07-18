using Plots,  LaTeXStrings
gr()

f(x) =  -x^2 - 2
f'

gradient_line(f, x₀) = (x -> f(x₀) + f'(x₀)*(x-x₀))

default(markerstrokecolor = "white", linewidth = 2);


#Plot f
plot(f, -3:0.1:3, label = "f(x) = -x² - 1", xlabel = "x", ylabel = "f(x)");

# Plot tangent lines
scatter!([1], [f(1)], label = "", markersize = 10);
plot!(gradient_line(f, 1), 0:0.1:3, label = "f'(1)", color = 2);

scatter!([-2], [f(-2)], label = "", markersize = 10, color = 3);
plot!(gradient_line(f, -2), -3:0.1:0, label = "f'(-2)", color = 3)
