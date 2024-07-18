using Plots; 
gr()

# Plot 3 dimensional data into surface plot
x = [1.1, 21.2, 32.8, 2.1, 24.3, 43.1, 0.8, 21.2, 28.9]; 
y = [10, 10, 10, 8, 8, 8, 4, 4, 4]; 
z = [3.2, 2.1, 0.7, 4.3, 5.2, 1.7, 2.3, 4.2, 2.0];

surface(x, y, z, size=(600,600), cbar=:none, legend=false,
	grid=false, showaxis = true)

