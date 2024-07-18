using Plots, SymPy
gr()

# To solve for p=0 
x, y, z, h = symbols("x, y, z, h")

p = 19x^2 - 114x + 152	

solve(p,x)  
