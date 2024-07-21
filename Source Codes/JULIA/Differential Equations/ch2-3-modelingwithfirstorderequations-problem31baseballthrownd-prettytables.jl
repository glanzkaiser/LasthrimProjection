using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures, PrettyTables

gr()
ua = 175
ub = 185
uc = 125
r = 1/5
h = 3
Au = pi/4 
Ag = pi/6 
g = 32

yu1(u) = -(g*(-5*log((u*cos(Au)-70)/u*cos(Au)))/r) + (g + h*r^2 + r*u*sin(Au))/(r^2) - (u*sin(Au)/r + (g/r^2))*((u*cos(Au)-70)/u*cos(Au))
yu2(u) = -(g*(-5*log((u*cos(Ag)-70)/u*cos(Ag)))/r) + (g + h*r^2 + r*u*sin(Ag))/(r^2) - (u*sin(Ag)/r + (g/r^2))*((u*cos(Ag)-70)/u*cos(Ag))

ya0(A) = -(g*(-5*log((uc*cos(A)-70)/uc*cos(A)))/r) + (g + h*r^2 + r*uc*sin(A))/(r^2) - (uc*sin(A)/r + (g/r^2))*((uc*cos(A)-70)/uc*cos(A))
ya1(A) = -(g*(-5*log((ua*cos(A)-70)/ua*cos(A)))/r) + (g + h*r^2 + r*ua*sin(A))/(r^2) - (ua*sin(A)/r + (g/r^2))*((ua*cos(A)-70)/ua*cos(A))
ya2(A) = -(g*(-5*log((ub*cos(A)-70)/ub*cos(A)))/r) + (g + h*r^2 + r*ub*sin(A))/(r^2) - (ub*sin(A)/r + (g/r^2))*((ub*cos(A)-70)/ub*cos(A))

println("For A=45")
println(pretty_table(String, 
 	 vcat([[string(u) yu1(u)] for u in 120:10:300]...); 
  	header=["u", "y(u)"]))

println("For A=30")
println(pretty_table(String, 
 	 vcat([[string(u) yu2(u)] for u in 120:10:300]...); 
  	header=["u", "y(u)"]))

println("")
println("For u=125")
println(pretty_table(String, 
 	 vcat([[rad2deg(float(A)) ya0(A)] for A in 0:pi/36:5pi/18]...); 
  	header=["A", "y(A)"]))

println("For u=175")
println(pretty_table(String, 
 	 vcat([[rad2deg(float(A)) ya1(A)] for A in 0:pi/36:5pi/18]...); 
  	header=["A", "y(A)"]))

println("For u=185")
println(pretty_table(String, 
 	 vcat([[rad2deg(float(A)) ya2(A)] for A in 0:pi/36:5pi/18]...); 
  	header=["A", "y(A)"]))

