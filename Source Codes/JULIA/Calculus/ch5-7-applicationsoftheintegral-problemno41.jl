using PyCall

ENV["PYTHON"] = "/home/browni/.julia/conda/3/bin/python3"
# the path is from the command 'which python3'

py"""
from sympy import symbols, Integral
from sympy.stats import Normal, Expectation, Variance, Probability

mu = symbols("μ", positive=True)
sigma = symbols("σ", positive=True)

X = Normal("X", mu, sigma)

print('Normal distribution')
print('Var(X) =',Variance(X).evaluate_integral())

print('E(X-μ) =',Expectation((X - mu)**2).expand())
print('final computation:')
print('E(X-μ) =',Expectation((X - mu)**2).doit())

"""