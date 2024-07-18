using SymPy

@vars x
f(x) = (x^3 + 1)/(x^4 + 1)
diff(f(x),x)
