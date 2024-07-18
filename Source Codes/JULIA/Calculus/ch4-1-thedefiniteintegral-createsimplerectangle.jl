using Plots
gr()

square = Shape([(1, 1), (-1, 1), (-1, -1), (1, -1)])
plot(square, fillcolor = :green, aspect_ratio=1.0)

function rotate_vector(v, α)
	x, y = v
	x2 = x * cos(α) - y * sin(α)
	y2 = x * sin(α) + y * cos(α)
	return (x2, y2)
end

# check if our function works by rotating our initial point by 90 degrees clockwise 
# (we expect this to land at (1.0, 0.0)
# Type at terminal REPL:
# rotate_vector((0,1), -pi/2)
# the answer should be (1.0,0.0) 
# the point at (0,1) will rotate 90 degrees counterclockwise to (1,0)
