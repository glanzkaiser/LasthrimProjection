using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures

gr()
u = 125
h = 3
A1 = pi/9  
A2 = pi/4  
A3 = pi/3  
g = 32

#int = range(0, stop=10, length=300)
int = 0:0.1:2.3π
x1(t) = t*u*cos(A1)
x2(t) = t*u*cos(A2)
x3(t) = t*u*cos(A3)

y1(t) = -(g*(t^2)/2) + h + t*u*sin(A1)
y2(t) = -(g*(t^2)/2) + h + t*u*sin(A2)
y3(t) = -(g*(t^2)/2) + h + t*u*sin(A3)

# note the dot, which means compute x for all values in the int range
plot(x1.(int),y1.(int), ylims=(0,250),
	label=L"A=20",framestyle=:zerolines,
	legend=:topright)
plot!(x2.(int),y2.(int), ylims=(0,250),
	label=L"A=45",
	legend=:topright)
plot!(x3.(int),y3.(int), ylims=(0,250),
	label=L"A=60", left_margin=10mm,
	legend=:topright)
xlabel!(L"x(t) = tu \ \cos (A)")
ylabel!(L"y(t) = - \frac{gt^{2}}{r} + h + tu \ \sin (A) ")

#=
@syms t
solve(diff(y(t),t)) # to find extreme point

# For A = 20, extreme value at t=2.691927
# For A = 45, extreme value at t=2.54843
# For A = 70, extreme value at t=2.364379

=#
