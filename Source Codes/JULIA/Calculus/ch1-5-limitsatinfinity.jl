using Plots, LaTeXStrings
pyplot(fmt=:svg)

a, b = -20, 20

h(x) = x/(1+x^(2))

plot(h, a, b; label=L"\frac{x}{1+x^{2}}", framestyle = :zerolines, size=(720, 360))
