using Plots
gr()

function circumference_polygon(sides, radius=1.0)
	# inner angle
	α = 2π / sides
	# angle between side and vertex-center line
	β = (π - α) / 2
	
	# using law of sines
	side_length = radius * sin(α) / sin(β)

	return side_length * sides
end

function estimate_pi(sides)
	circumference = circumference_polygon(sides, 1.0)
	# as the circumference of the circle is 2rπ 
	return circumference / 2
end

function rotate_vector(v, α)
	x, y = v
	x2 = x * cos(α) - y * sin(α)
	y2 = x * sin(α) + y * cos(α)
	return (x2, y2)
end

function polygon_points(n)
	start_point = (0.0, 1.0)
	points = [start_point]
	internal_degree = 2π/n

	for i in 2:n
		last_point = points[end]
		new_point = rotate_vector(last_point, internal_degree)
		push!(points, new_point)
	end

	return points
end

#change the n_sides to any number you desire
n_sides = 33

pi_estimate = round(estimate_pi(n_sides), digits=5)

# plot a unit circle
plot(x -> sqrt(1 - x^2); color=:blue, aspect_ratio=1.0, legend=false)
plot!(x -> -sqrt(1 - x^2), color=:blue)
	
# plot the polygon
plot!(Shape(polygon_points(n_sides)), fillcolor=:green)
	
# annotate with sides and pi estimate
annotate!([(0, 0, ("n=$n_sides \n π̂=$pi_estimate", 20, :white, :center))])
