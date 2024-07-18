using Dierckx, LaTeXStrings, Plots; gr()

x, y = 0:6,  [0, -1, -0.8, 0.3, 0.6, 0.7, 0.4]

n = length(x)
δ = 0.05
x2 = [x[1]; (1-δ)*x[1] + δ*x[2]; x[2:end-1]; δ*x[end-1] + (1-δ)*x[end]; x[end]]
y2 = [y[1]; (1-δ)*y[1] + δ*y[2]; y[2:end-1]; δ*y[end-1] + (1-δ)*y[end]; y[end]]
l = [1; 1+δ; 2:n-1; n-δ; n]
w = ones(n+2)
w[1] = w[2]  = w[end-1] = w[end] = 100
spl = ParametricSpline(l, [x2 y2]', w=w, s=1.5) 
xy  = evaluate(spl, range(1, n, 100))
plot(x, y, marker=:circle, ms=3, c=:green, mc=:red, frame=:none)
plot!(xy[1,:], xy[2,:], c=:blue1)

annotate!([(0,0.1, (L"Q_{0}", 10, :black))])
annotate!([(1,-1.1, (L"Q_{1}", 10, :black))])
annotate!([(2,-0.88, (L"Q_{2}", 10, :black))])
annotate!([(5,0.78, (L"Q_{n-1}", 10, :black))])
annotate!([(6,0.55, (L"Q_{n}", 10, :black))])