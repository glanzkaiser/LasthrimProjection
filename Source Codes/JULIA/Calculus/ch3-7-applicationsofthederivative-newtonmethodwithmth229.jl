# Julia for Newton's method : Plot the function and show the iterations table
# For the equation f(x)=sin(x) - x/4

using MTH229, Plots, LaTeXStrings, SymPy
gr()
@vars x

f(x) = sin(x) - x/4
fp(x) = diff(f(x),x)
# or write
# fp(x) = f'(x)

plot(f, -10, 10, ylims=(-5,10),
    label=L"f(x)", framestyle=:zerolines,
     legend=:outerright)

#choose initial value 2pi
newton(f, fp, 2pi, verbose=true)

#type at terminal: 
# plot(f, -10, 10, ylims=(-5,10), label=L"f(x)", framestyle=:zerolines, legend=:outerright)
