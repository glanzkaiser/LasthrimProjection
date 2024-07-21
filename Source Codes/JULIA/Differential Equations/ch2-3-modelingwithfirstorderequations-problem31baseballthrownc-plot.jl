using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures

gr()
u = 125
r = 1/5
h = 3
A1 = pi/9  
A2 = pi/4  
A3 = pi/3
g = 32

#int = range(0, stop=10, length=300)
int = 0:0.1:2π
x1(t) = (u/r)*cos(A1) - (u/r)*exp(-r*t)*cos(A1)
x2(t) = (u/r)*cos(A2) - (u/r)*exp(-r*t)*cos(A2)
x3(t) = (u/r)*cos(A3) - (u/r)*exp(-r*t)*cos(A3)

y1(t) = -(g*t/r) + (g + h*r^2 + r*u*sin(A1))/(r^2) - (u*sin(A1)/r + (g/r^2))*exp(-r*t)
y2(t) = -(g*t/r) + (g + h*r^2 + r*u*sin(A2))/(r^2) - (u*sin(A2)/r + (g/r^2))*exp(-r*t)
y3(t) = -(g*t/r) + (g + h*r^2 + r*u*sin(A3))/(r^2) - (u*sin(A3)/r + (g/r^2))*exp(-r*t)

# note the dot, which means compute x for all values in the int range
plot(x1.(int),y1.(int), ylims=(0,200),
	label=L"A=20",
	legend=:topright)
plot!(x2.(int),y2.(int), ylims=(0,200),
	label=L"A=45",
	legend=:topright)
plot!(x3.(int),y3.(int), ylims=(0,200),
	label=L"A=60", top_margin=5mm, bottom_margin=5mm, left_margin=5mm,
	legend=:topright)
xlabel!(L"x(t) = \frac{u}{r} \cos \ A (1 - e^{-rt}) ")
ylabel!(L"y(t) = - \frac{gt}{r} + \frac{g + ur \ \sin \ A + hr^{2}}{r^{2}} - (\frac{u \ \sin \ A}{r} + \frac{g}{r^{2}}) e^{-rt}",yguidefontsize=8)

#=
@syms t
solve(diff(y(t),t)) # to find extreme point

# For A = 20, extreme value at t=2.691927
# For A = 45, extreme value at t=2.54843

=#
