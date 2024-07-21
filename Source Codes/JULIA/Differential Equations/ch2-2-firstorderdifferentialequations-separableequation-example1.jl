using Plots
gr()
#gr(size=(600,400))

function example()
  X = range(-2, stop=2, length=50)
  Y = range(-2, stop=2, length=50)
  f(x, y) = -x^3 + 3y - y^3
  contour(X, Y, f)

  x = range(-2, stop=2, length=15)
  y = range(-2, stop=2, length=15)


  dydx_norm(x, y) = [1; x^2/(1 - y^2)] / 25

  quiver!(repeat(x,11), vec(repeat(y',11)), quiver=dydx_norm, c=:blue)

  xlims!(-2, 2)
  ylims!(-2, 2)
    
  # to save as png uncomment the code below and gr(size=(600,400))
  #png("example")
end

example()