using SymPy, LaTeXStrings,Plots,PrettyTables
@syms t,c,cf,A,T
@syms x()
@syms y()

println("First-Order Linear Differential Equations with Julia")
println("Tank 1 initially contains 100 gallons full of pure alcohol")
println("The flow rate of the drain pipe is 5 gallons per minute")
println("An unlimited amount of 25% alcohol solution can be brought in through the filler pipe")
println("The flow rate of the filler pipe can be adjusted to cf gallons per minute")
println("Reduce the amount of alcohol in the tank so it will contain 100 gallons of 50% alcohol")
println("")

p1(t) = (5/100)t^0
g1(t) = 0.25cf
μ1(t) = exp(integrate(p1(t),t))
y1(t) = (1/μ1(t))*( integrate((μ1(t)*g1(t)),t) + c)

println("The general solution for tank with alcohol solution:  ")
sympy.pretty_print(y1(t))
println("")

# Computing IVP with SymPy
diffeqy = Eq(y(t).diff(t) + (5/100)*y(t), g1(t)); string(diffeqy)

# To solve the Initial Value Problem,
# Tank initial condition y(0) = 100
ivp_yt = dsolve(diffeqy, y(t), ics = Dict(y(0) => 100))

println("the particular solution for tank with alcohol solution:  ")
sympy.pretty_print(ivp_yt)
println("")

println("a. For cf=5, evaluate T with both pipes opened.")
yt1 = ivp_yt(cf => 5)
yt2 = ivp_yt(cf => 3)
yt3 = ivp_yt(cf => 8)

sympy.pretty_print(yt1)

sol_yt = rhs(yt1)
ysol = solve(sol_yt~50,t)
println("")
println("T = ", ysol[1])
println("")

println("b. Evaluate T if cf=5 and we first drain away a sufficient amount")
println("then close the drain and open the filler pipe")
# A is the number of gallons of pure alcohol drained away
cd = 5

yb = (100-A) + 0.25A
yb_sol = solve(yb~50,A)
println("Draining time = ", yb_sol[1]/cd)
println("Refill time = ", yb_sol[1]/5)
println("")
println("T = ", yb_sol[1]/cd + yb_sol[1]/5)

println("")

println("c. For what values of cf would strategy (b) give a faster time than (a)")
g = LessThan(yb_sol[1]/rd + yb_sol[1]/cf,  20*log(3))
g_sol = solve(g,cf)
sympy.pretty_print(g_sol)
println("")

println(pretty_table(String, 
 	 vcat([[8 solve(rhs(yt3)~50,t) yb_sol[1]/8 + yb_sol[1]/5] ]...); 
  	header=["cf", "T for (a)", "T for (b)"]))

println("")

println("d. Determine the equation for T")
println("If we initially open both pipes and then close the drain with cf = 4")
yt4 = ivp_yt(cf => 4)
yt4d = rhs(yt4) + 4*0.25*(t/4)
yt4f = yt4d(t => 0.8T)
sympy.pretty_print(yt4f)
println(yt4f," = 50")
println("")
println("T = ", solve(yt4f~50,T)[1])

#=

plot(yt1,0,300,label=L"y(t), \ cf=5")
plot!(yt2,0,300,label=L"y(t), \ cf=3")
plot!(yt3,0,300,label=L"y(t), \ cf=8")

plot(yt4f-50,0,300,label=L"y(T), \ cf = 4") # Part d

=#