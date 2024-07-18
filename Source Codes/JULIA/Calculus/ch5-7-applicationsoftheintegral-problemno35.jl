using SymPy
@syms y

function F(y)
	if y<0
	  return 0

	elseif 0 ≤ y ≤ 1
	  return 2y/(y+1)

	elseif y > 1
	  return 1

	end
end

a, b = 0, 1

function riemann(f::Function, a::Real, b::Real, n::Int; method="right")
    if method == "right"
        meth = f -> (lr -> begin l,r = lr; f(r) * (r-l) end)
	xs = range(a, b, n+1)
        pairs = zip(xs[begin:end-1], xs[begin+1:end]) # (x₀,x₁), …, (xₙ₋₁,xₙ)
        sum(meth(f), pairs)
    elseif method == "left"
        meth = f -> (lr -> begin l,r = lr; f(l) * (r-l) end)
	xs = range(a, b, n+1)
        pairs = zip(xs[begin:end-1], xs[begin+1:end]) # (x₀,x₁), …, (xₙ₋₁,xₙ)
        sum(meth(f), pairs)
    elseif method == "trapezoid"
        meth = f -> (lr -> begin l,r = lr; (1/2) * (f(l) + f(r)) * (r-l) end)
	xs = range(a, b, n+1)
        pairs = zip(xs[begin:end-1], xs[begin+1:end]) # (x₀,x₁), …, (xₙ₋₁,xₙ)
        sum(meth(f), pairs)
    elseif method == "simpsons"
        meth = f -> (lr -> begin l,r = lr; (1/6) * (f(l) + 4*(f((l+r)/2)) + f(r)) * (r-l) end)
	xs = range(a, b, n+1)
        pairs = zip(xs[begin:end-1], xs[begin+1:end]) # (x₀,x₁), …, (xₙ₋₁,xₙ)
        sum(meth(f), pairs)
    elseif method == "midpoint"
	xs = a:(b-a)/n:b
        deltas = diff(xs)      # forms x2-x1, x3-x2, ..., xn-xn-1
        cs = [(xs[i] + xs[i+1])/2 for i in 1:length(deltas)]
        sum(f(cs[i]) * deltas[i] for i in 1:length(deltas))
    end
end

f(y) = diff(2y/(y+1),y)
e1(y) = y*f(y)

# with direct method
Ey = integrate((e1(y)), (y, 0, 1))

#with Riemann Simpsons / Parabolic Rule:
eg(y) = y*(2/(y+1)^2)
Eyp = riemann(eg, 0, 1, 8, method="simpsons")

println("a. P(Y < 2) = ", F(2))
println("b. P(0.5 < Y < 0.6) = ", F(0.6) - F(0.5))
println("c. f(y) = F'(y) = ", simplify(f(y)))
println("d. E(y) = ", simplify(Eyp))


