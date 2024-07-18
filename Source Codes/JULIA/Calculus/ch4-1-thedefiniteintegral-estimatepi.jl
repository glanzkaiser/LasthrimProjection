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

x = 3:100
y = estimate_pi.(x)

# plotting our estimates
plot(x ,y, label="π̂",
	xlabel="Number of sides",
	ylabel="Estimates",
	title="Estimating π using regular polygons"
)
hline!([π], label="π")