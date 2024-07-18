# https://natelemoine.com/using-sympy-for-biological-odes/

import sympy as sm
import numpy as np
import matplotlib.pyplot as plt

from sympy.abc import L, k, t
y = sm.Function('y')(t)

# The differential equation: y' = ky(L-y)
# Define the derivative of y with respect to t (the left-hand side of the ODE),
# and then define the right-hand side of the ODE.
dy = y.diff(t)
rhs = k*y*(L - y)

# Define the equality
eq = sm.Eq(dy, rhs)
print('the Differential equation is:')
sm.pretty_print(eq)

print('the Differential equation solution is:')
sol = sm.dsolve(eq)
sm.pretty_print(sol)

print('the solution of the Differential equation for initial value of y(0) = 800:')

t0 = sol.args[1].subs({'t': 0})
n0 = 800
eq_init = sm.Eq(n0, t0)

C1 = t0.args[2].args[0].args[0]
t0_sol = sm.solve(eq_init, C1)
# substitute the expression for C1 back into the equation
final = sol.args[1].subs(C1, t0_sol[0])
final_eq = final.simplify()
sm.pretty_print(final_eq.subs([(L,2000),(k,0.0003)]))

f_num = sm.lambdify([k, L, t], final_eq)
t_coords = np.linspace(0, 10, 100)
y_coords = f_num(0.0003, 2000, t_coords)

# Plot with SymPy Plotting Backends module:
sm.plot(final_eq.subs([(L,2000),(k,0.0003)]), (t, 0, 10),
	xlabel='$t$ (year)', ylabel='$y(t)$ (population)', title='Logistic Differential Equation Plot')

# Plot with matplotlib
plt.figure()
plt.plot(t_coords, y_coords)
plt.title('Logistic Differential Equation Plot')
plt.xlabel("$t$ (year)")
plt.ylabel("$y(t)$ (population)")

plt.show()
