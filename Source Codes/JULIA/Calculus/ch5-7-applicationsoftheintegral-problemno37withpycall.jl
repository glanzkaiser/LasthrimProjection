using PyCall

ENV["PYTHON"] = "/home/browni/.julia/conda/3/bin/python3"
# the path is from the command 'which python3'

py"""
from sympy import symbols, Integral, Interval
from sympy.stats import ContinuousRV, Expectation, Variance, Probability

mu = symbols("μ", positive=True)
sigma = symbols("σ", positive=True)

pdf = (15/512)*(x**2)*((4-x)**2)
X = ContinuousRV(x, pdf, Interval(0, 4)) 

print('Distribution with pdf: (15/512)*(x**2)*((4-x)**2)')
print('Var(X) =',Variance(X).evaluate_integral())
print('E(X) =',Expectation(X).doit())
print('E(X^2) =',Expectation(X**2).doit())


"""