# https://stackoverflow.com/questions/77051260/how-to-highlight-a-3d-surface-plot-slice/77052356#77052356

from sympy import *
from spb import *
var("t, omega, s, alpha")
expr = exp(-t) * sin(t) #* exp(-t / 2)
res = laplace_transform(expr, t, s, noconds=True)
func = abs(res.subs(s, alpha + I*omega))

print('The surface plot:')
p1 = plot3d(
    func, (alpha, -2, 2), (omega, -2, 2), {"cmap": "winter", "vmax": 2},
    zlim=(0, 2.5), use_cm=True, colorbar=False
)

# Next, plot the slice, which is nothing more than a parametric curve in 3D space. 
# For example, plotting a slice at alpha=-0.5:

print('The slice plot:')

p2 = plot3d_parametric_line((-0.5, omega, func.subs(alpha, -0.5)), (omega, -2, 2), {"color": "r"}, use_cm=False)

print('The combined plot:')
# Cut a line first so that the slice can look nice
eps = 0.01
p1 = plot3d(
    (func, (alpha, -2, -0.5-eps), (omega, -2, 2), {"cmap": "winter", "vmax": 2}),
    (func, (alpha, -0.5+eps, 2), (omega, -2, 2), {"cmap": "winter", "vmax": 2}),
    zlim=(0, 2.5), use_cm=True, colorbar=False
)

(p1 + p2).show()

#  the limitations of Matplotlib: it doesn't know that the line 
# should be rendered on top of the surface.

