using Plots, PrettyTables, LaTeXStrings; gr()
#=
# To plot a curve starting at (0, 0) 
θ = 0:0.1:4.1π
x = θ .- sin.(θ)
y = 1 .- cos.(θ)
plot(x, y, xlims=(0,15), ylims=(0,4),
	label=L"(x,y) = (t - \sin \ t , 1 - \cos \ t)",
	framestyle=:zerolines)
=#

# Uncomment this to see the table
# Alternative 1: Pretty Tables
#=
println(pretty_table(String, 
 	 vcat([[string(t)*"π" t*π-sinpi(t) 1-cospi(t)] for t in 0:0.5:4]...); 
  	header=["t", "x(t)", "y(t)"]))

=#

#=
# Alternative 2: Raw looks
println("t \t x \t \t y")
for N in 0:pi/2:4*pi
    x1 = (N) - sin.(N) 
    y1 = 1 - cos.(N) 
    println("$N \t $x1 \t $y1")
end
=#
