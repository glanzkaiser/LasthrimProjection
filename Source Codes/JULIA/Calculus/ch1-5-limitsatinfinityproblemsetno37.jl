using Plots, LaTeXStrings
pyplot(fmt=:svg)

#step(x, a=0) = x ≥ a
saw_blade(x) = floor(x) / x
xspan = -1.0:0.1:5
plot(xspan, step.(xspan), legend = :none)
