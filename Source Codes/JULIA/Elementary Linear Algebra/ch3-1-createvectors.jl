using Plots
gr()       # better arrows than plotly()

quiver([0],[0], quiver=([1],[2])) # initial at (0,0) and terminal at (1,2)
quiver!([1],[0], quiver=([2],[1])) # initial at (1,1) and terminal at (3,1)
quiver!([1],[1], quiver=([2],[1])) # initial at (1,1) and terminal at (3,2)
quiver!([1],[1], quiver=([-2],[1])) # initial at (1,1) and terminal at (-1,2)
