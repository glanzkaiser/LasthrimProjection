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

F(y,x) = sin(x*y)
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
𝐅(y,x) = sin(x*y)
𝐞qn = D(u)(x) - 𝐅(u(x), x)
# Looking at the available methods with: sympy.classify_ode(𝐞qn, u(x)) 
# shows a power series method which can return a power series approximation 
# (a Taylor polynomial).

# sympy.classify_ode(𝐞qn, u(x))
𝐨ut = dsolve(𝐞qn, hint="1st_power_series")

𝐨ut1 = dsolve(𝐞qn, u(x), ics=Dict(u(0) => 1), hint="1st_power_series")

𝐱0, 𝐱n, 𝐲0 = 0, 2, 1

plot(legend=:topleft)
vectorfieldplot!((x,y) -> [1, 𝐅(y,x)], xlims=(𝐱0, 𝐱n), ylims=(0,5))
plot!(rhs(𝐨ut1).removeO(), linecolor=:orange, label=L"y(x) \ exact", linewidth=3)

𝐮 = euler(𝐅, 𝐱0, 𝐱n, 𝐲0, 10)
plot!(𝐮, linecolor=:blue2, label=L"y(x) \ Euler", linewidth=3)
