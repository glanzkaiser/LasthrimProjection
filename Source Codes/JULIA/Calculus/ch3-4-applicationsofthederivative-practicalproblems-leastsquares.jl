using Plots
xs = [0.005,0.010, 0.015, 0.020, 0.025]; ys = [8,17,22,32,36];
scatter(xs, ys, label="points", xlim=[0,2])

A = hcat(xs,ones(length(xs)))

slope, intercept = A \ ys  

scatter(xs,ys,label="points")
plot!(x -> slope*x + intercept, minimum(xs)-1,maximum(xs)+1,
    	label="best-fit line", xlims=(0,0.03), ylims=(0,40),
	legend=:outerright)

