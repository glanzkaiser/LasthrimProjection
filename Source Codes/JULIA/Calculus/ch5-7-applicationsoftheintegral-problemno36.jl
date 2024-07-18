using SymPy
@syms z

function F(z)
	if z<0
	  return 0

	elseif 0 ≤ z ≤ 3
	  return (z^2)/9

	elseif z > 3
	  return 1

	end
end

f(z) = diff((z^2)/9,z)
e1(z) = z*f(z)

# with direct method
Ey = integrate((e1(z)), (z, 0, 3))

println("a. P(Z > 1) = ", 1 - F(1))
println("b. P(1 < Z < 2) = ", F(2) - F(1))
println("c. f(z) = F'(z) = ", simplify(f(z)))
println("d. E(y) = ", simplify(Ey))