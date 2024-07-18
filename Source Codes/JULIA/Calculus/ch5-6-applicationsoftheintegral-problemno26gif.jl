using Meshes
using MeshViz
using LinearAlgebra
using GLMakie
using Makie
using Printf

function revolutionTorus(R, r, alpha; n1=30, n2=90)
  theta_ = LinRange(0, 2, n1+1)[1:n1]
  x = [R + r*cospi(theta) for theta in theta_]
  y = [r*sinpi(theta) for theta in theta_]
  full = alpha == 2
  u_ = LinRange(0, alpha, n2 + full)[1:n2]
  function f(u, j)
    return [x[j] * sinpi(u), x[j] * cospi(u), y[j]]
  end
  points = [f(u, j) for u in u_ for j in 1:n1]
  topo = GridTopology((n1, n2 - !full), (true, full))
  return SimpleMesh(Meshes.Point.(points), topo)
end

# generates `nframes` meshes for alpha = 0 -> 2 (alpha is a multiple of pi)
R = 3
r = 1
nframes = 10
alpha_ = LinRange(0, 2, nframes+1)[2:(nframes+1)]
meshes = [revolutionTorus(R, r, alpha) for alpha in alpha_]

# draw and save the frames in a loop
for i in 1:nframes
  # make a bounding box in order that all frames have the same aspect
  fig, ax, plt = 
    viz(Meshes.Box(Meshes.Point(-4.5, -4.5, -2.5), Meshes.Point(4.5, 4.5, 2.5)); alpha = 0)
  ax.show_axis = false
  viz!(meshes[i])
  scale!(ax.scene, 1.8, 1.8, 1.8)
  png = @sprintf "revolutionTorus%02d.png" i
  Makie.save(png, fig)
end

# make GIF with ImageMagick
comm = @cmd "convert -delay 1x2 'revolutionTorus*.png' revolutionTorus.gif"
run(comm)