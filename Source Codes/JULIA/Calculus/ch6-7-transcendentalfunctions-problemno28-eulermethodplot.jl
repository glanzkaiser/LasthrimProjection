# https://jverzani.github.io/CalculusWithJuliaNotes.jl/ODEs/euler.html
using SymPy, CalculusWithJulia, LaTeXStrings,Plots,PrettyTables
@syms x,y, u()

function linterp(xs, ys)
    function(x)
        ((x < xs[1]) || (x > xs[end])) 
        for i in 1:(length(xs) - 1)
            if xs[i] <= x < xs[i+1]
                l = (x-xs[i]) / (xs[i+1] - xs[i])
                return (1-l) * ys[i] + l * ys[i+1]
            end
        end
        ys[end]
    end
end

F(y,x) = y
x0,y0 = 0,1 

function euler(F, x0, xn, y0, n)
  h = (xn - x0)/n
  xs = zeros(n+1)
  ys = zeros(n+1)
  xs[1] = x0
  ys[1] = y0
  for i in 1:n
    xs[i + 1] = xs[i] + h
    ys[i + 1] = ys[i] + h * F(ys[i], xs[i])
  end
  linterp(xs, ys)
end

function improvedeuler(F, x0, xn, y0, n)
  h = (xn - x0)/n
  xs = zeros(n+1)
  ys = zeros(n+1)
  yhat = zeros(n+1)
  xs[1] = x0
  ys[1] = y0
  for i in 1:n
    xs[i + 1] = xs[i] + h
    yhat[i + 1] = ys[i] + (h*F(ys[i], xs[i]))
    ys[i + 1] = ys[i] + ((h/2) * (F(ys[i], xs[i]) + F(yhat[i+1], xs[i+1])) )
  end
  linterp(xs, ys)
end

𝑭(y,x) = y
𝒙0, 𝒙n, 𝒚0 = 0, 1, 1
f1 = improvedeuler(𝑭, 𝒙0, 𝒙n, 𝒚0, 5)
f2 = improvedeuler(𝑭, 𝒙0, 𝒙n, 𝒚0, 10)
f3 = improvedeuler(𝑭, 𝒙0, 𝒙n, 𝒚0, 20)
f4 = improvedeuler(𝑭, 𝒙0, 𝒙n, 𝒚0, 100)
f5 = improvedeuler(𝑭, 𝒙0, 𝒙n, 𝒚0, 200)

g1 = euler(𝑭, 𝒙0, 𝒙n, 𝒚0, 5)
g2 = euler(𝑭, 𝒙0, 𝒙n, 𝒚0, 10)
g3 = euler(𝑭, 𝒙0, 𝒙n, 𝒚0, 20)
g4 = euler(𝑭, 𝒙0, 𝒙n, 𝒚0, 100)
g5 = euler(𝑭, 𝒙0, 𝒙n, 𝒚0, 200)

#f1(𝒙n)

println("Improved Euler's Method:")
println("The differential equation: y' = y")
println("Initial condition: y(0) = 1")
println("interval [0,1]")
println("")
println("Exact solution:")

# To calculate the analytic solution
D = Differential(x)
dsolve(D(u)(x) - F(u(x), x))
out = dsolve(D(u)(x) - F(u(x),x), u(x), ics=Dict(u(x0) => y0))
sympy.pretty_print(rhs(out))

println("")
println(pretty_table(String, 
 	 vcat([[(y0-x0)/j euler(𝑭, 𝒙0, 𝒙n, 𝒚0,j)( 𝒙n)  improvedeuler(𝑭, 𝒙0, 𝒙n, 𝒚0,j)( 𝒙n) exp(𝒙n) abs(euler(𝑭, 𝒙0, 𝒙n, 𝒚0,j)( 𝒙n)-exp(y0-x0)) abs(improvedeuler(𝑭, 𝒙0, 𝒙n, 𝒚0,j)( 𝒙n)-exp(y0-x0)) ] for j in 5:5:50]...); 
  	header=["h", "Euler y_{n}", "Improved Euler y_{n}", "e^{x_{n}}", "Error from Euler", "Error from Improved Euler"]))

println(pretty_table(String, 
 	 vcat([[(y0-x0)/j euler(𝑭, 𝒙0, 𝒙n, 𝒚0,j)( 𝒙n) improvedeuler(𝑭, 𝒙0, 𝒙n, 𝒚0,j)( 𝒙n) exp(𝒙n) abs(euler(𝑭, 𝒙0, 𝒙n, 𝒚0,j)( 𝒙n)-exp(y0-x0)) abs(improvedeuler(𝑭, 𝒙0, 𝒙n, 𝒚0,j)( 𝒙n)-exp(y0-x0)) ] for j in 100:100:200]...); 
  	header=["h", "Euler y_{n}", "Improved Euler y_{n}", "e^{x_{n}}", "Error from Euler", "Error from Improved Euler"]))


# To plot
p = plot(legend=:bottomright)
vectorfieldplot!((x,y) -> [1, F(x,y)], xlims=(0, 1.1), ylims=(0.5, 3))
plot!(rhs(out), linecolor=:green, linewidth=2, label=L"e^{x_{n}}")
plot!(g1, 𝒙0, 𝒙n, linecolor=:orange, linewidth=2, label=L"y_{n} \ h = 0.2")
plot!(g2, 𝒙0, 𝒙n, linecolor=:red3, linewidth=2, label=L"y_{n} \ h = 0.1")
plot!(g3, 𝒙0, 𝒙n, linecolor=:red1, linewidth=2, label=L"y_{n} \ h = 0.05")
plot!(g4, 𝒙0, 𝒙n, linecolor=:blue2, linewidth=2, label=L"y_{n} \ h = 0.01")
plot!(g5, 𝒙0, 𝒙n, linecolor=:purple, linewidth=2, label=L"y_{n} \ h = 0.005")
title!("Euler's Method")