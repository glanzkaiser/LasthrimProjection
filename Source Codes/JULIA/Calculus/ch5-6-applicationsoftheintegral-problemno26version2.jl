using Meshes
using MeshViz
using LinearAlgebra
using GLMakie


# revolution of the polygon defined by (x,y) around the z-axis
# x and y have the same length
function revolution(x, y, n)
  u_ = LinRange(0, 2*pi, n+1)[1:n]
  j_ = 1:(length(x) - 1)           # subtract 1 because of periodicity
  function f(u, j)
    return [x[j] * sin(u), x[j] * cos(u), y[j]]
  end
  points = [f(u, j) for u in u_ for j in j_]
  topo = GridTopology((length(j_), n), (true, true))
  return SimpleMesh(Meshes.Point.(points), topo)
end


# define the section to be rotated: a circle
R = 3 # major radius
r = 1 # minor radius
ntheta = 100
theta_ = LinRange(0, 2*pi, ntheta)
x = [R + r*cos(theta) for theta in theta_]
y = [r*sin(theta) for theta in theta_]

# make mesh
mesh = revolution(x, y, 100)
# visualize mesh
viz(mesh)