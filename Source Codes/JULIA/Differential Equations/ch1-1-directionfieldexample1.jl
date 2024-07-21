using LinearAlgebra, Plots

# If you change parameters in ys into other number the number of the arrows will change
xs = 0:1:10
ys = -1.2:1.97:3

# dx/dy = f(y,x)
df(x, y) = normalize([9.8-(300y), 9.8-(300y)])  

xxs = [x for x in xs for y in ys]
yys = [y for x in xs for y in ys]

Plots.quiver(xxs, yys, quiver=df)
plot!([9.8/300], seriestype="hline", linestyle=:dash, color=:green, label="v(t)=9.8/300", legend=:outerright)