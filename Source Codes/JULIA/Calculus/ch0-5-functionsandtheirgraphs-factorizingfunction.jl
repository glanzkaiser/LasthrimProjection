using Plots, SymPy
gr()

x, y, z, h = symbols("x, y, z, h")

q(x) = 19x^2 - 114x + 152	

factor(q(x))  
