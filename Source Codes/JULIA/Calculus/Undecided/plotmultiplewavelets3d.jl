using Plots
pyplot()

H(n, m) = 0.54 .- 0.46 .* cos.((2 .* pi .* n) ./ (m - 1)); # hamming window

x_axis = (1:0.1:20) .* 10; # frequency bins
y_axis = (1:20:100) .* 1e-3; # time vector in ms
z_axis = H(x_axis, x_axis[end]) .* sin.(2 .* π .* x_axis .* transpose(y_axis)); # amplitude values
plot(repeat(x_axis, 1, length(y_axis)), repeat(y_axis', length(x_axis), 1), z_axis, st=:path3d)
