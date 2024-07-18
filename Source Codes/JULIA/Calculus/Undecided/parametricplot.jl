using SymPy, Plots, LaTeXStrings, Plots.PlotMeasures

i=0.2;
r=25.1; 

f(a) =  (1/2)*(pi*a*i/r + 2r)cos(a)
g(a) = (1/2)*(pi*a*i/r + 2r)*sin(a)

plot(f,g,0,2π)

#plot(f,g,0,248π)

#plot(f,g,0,248π,1000)

#plot(f,g,0,248π,10_000)