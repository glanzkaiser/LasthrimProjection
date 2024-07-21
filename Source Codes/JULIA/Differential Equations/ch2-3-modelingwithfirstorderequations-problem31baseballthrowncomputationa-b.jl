using SymPy, Plots
@syms t, g, r, A, u, h
@syms v()
@syms w()
@syms x()
@syms y()

# Computing IVP with SymPy
diffeqv = Eq(v(t).diff(t), -r*v(t)); string(diffeqv)
diffeqw = Eq(w(t).diff(t), -g -r*w(t)); string(diffeqw)

# To solve the ODE, pass it and the function to solve with dsolve.
vt = dsolve(diffeqv, v(t))
wt = dsolve(diffeqw, w(t))

sol_vt = rhs(vt)
sol_wt = rhs(wt)

# To solve the Initial Value Problem, initial condition v(0) = u cos (A)
ivp_vt = dsolve(diffeqv, v(t), ics = Dict(v(0) => u*cos(A) ))
ivp_wt = dsolve(diffeqw, w(t), ics = Dict(w(0) => u*sin(A) ))

# Manual way
# Find the constant C₁
c1 = free_symbols(vt)[1]
# To solve the Initial Value Problem, initial condition v(0) = u cos (A)
C1 = solve(sol_vt(t=>0) ~ u*cos(A), c1)
#ivp_vt = sol_vt(c1=>C1[1])

# Part (b)
diffeqx = Eq(x(t).diff(t), rhs(ivp_vt));
diffeqy = Eq(y(t).diff(t), rhs(ivp_wt));

# To solve the ODE, pass it and the function to solve with dsolve.
xt = dsolve(diffeqx, x(t))
yt = dsolve(diffeqy, y(t))

sol_xt = rhs(xt)
sol_yt = rhs(yt)
ivp_xt = dsolve(diffeqx, x(t), ics = Dict(x(0) => 0 ))
ivp_yt = dsolve(diffeqy, y(t), ics = Dict(y(0) => h ))

println("Modeling with First Order Equations with Julia")
println("A baseball is thrown with the initial speed of u and initial angle of elevation is A")
println("v(t) is the horizontal component of the velocity of the thrown baseball")
println("w(t) is the vertical component of the velocity of the thrown baseball")
println("x(t) is the horizontal coordinate of the thrown baseball at time t")
println("y(t) is the vertical coordinate of the thrown baseball at time t")

sympy.pretty_print(ivp_vt)
sympy.pretty_print(ivp_wt)
println("")
println("The horizontal and vertical coordinates : ")
sympy.pretty_print(ivp_xt)
sympy.pretty_print(ivp_yt)


#=
f = ivp_xt(u => 125, r => 1/5, A=>45)
g = ivp_yt(u => 125, r => 1/5, A => 45, g => 32, h => 3)

=#