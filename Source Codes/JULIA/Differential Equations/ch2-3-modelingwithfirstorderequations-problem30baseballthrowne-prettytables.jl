using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures, PrettyTables

gr()
ua = 125
ub = 135
uc = 110

r = 1/5
h = 3
Au = pi/4 
Ag = pi/6
g = 32

yu1(u) = -(g*( 350/(u*cos(Au)) )^2)/2 + h + u*( 350/(u*cos(Au)) )*sin(Au)
yu2(u) = -(g*( 350/(u*cos(Ag)) )^2)/2 + h + u*( 350/(u*cos(Ag)) )*sin(Ag)

ya1(A) = -(g*( 350/(ua*cos(A)) )^2)/2 + h + ua*( 350/(ua*cos(A)) )*sin(A)
ya2(A) = -(g*( 350/(ub*cos(A)) )^2)/2 + h + ub*( 350/(ub*cos(A)) )*sin(A)
ya3(A) = -(g*( 350/(uc*cos(A)) )^2)/2 + h + uc*( 350/(uc*cos(A)) )*sin(A)

println("For A=45")
println(pretty_table(String, 
 	 vcat([[string(u) yu1(u)] for u in 100:10:300]...); 
  	header=["u", "y(u)"]))

println("For A=30")
println(pretty_table(String, 
 	 vcat([[string(u) yu2(u)] for u in 220:10:330]...); 
  	header=["u", "y(u)"]))

println("")
println("For u=110")
println(pretty_table(String, 
 	 vcat([[rad2deg(float(A)) ya3(A)] for A in 0:pi/18:pi/2]...); 
  	header=["A", "y(A)"]))

println("For u=125")
println(pretty_table(String, 
 	 vcat([[rad2deg(float(A)) ya1(A)] for A in 0:pi/18:pi/2]...); 
  	header=["A", "y(A)"]))

println("For u=135")
println(pretty_table(String, 
 	 vcat([[rad2deg(float(A)) ya2(A)] for A in 0:pi/18:pi/2]...); 
  	header=["A", "y(A)"]))

