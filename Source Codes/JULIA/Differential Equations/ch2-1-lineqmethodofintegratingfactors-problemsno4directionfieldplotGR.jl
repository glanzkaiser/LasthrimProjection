using Plots
gr()
#gr(size=(600,400))

function example()
  X = range(-2, stop=20, length=50)
  Y = range(-2, stop=5, length=50)
  f(x, y) = x*y - (3/2)*x*sin(2x) - (3/4)*cos(2x)
  contour(X, Y, f)

  x = range(-2, stop=20, length=15)
  y = range(-2, stop=5, length=15)

  dydx_norm(x, y) = [1; (3*cos(2x) - (y/x))] / 5

  quiver!(repeat(x,11), vec(repeat(y',11)), quiver=dydx_norm, c=:blue)

  xlims!(-2, 20)
  ylims!(-2, 5)
    
  # to save as png uncomment the code below and gr(size=(600,400))
  #png("example")
end

example()