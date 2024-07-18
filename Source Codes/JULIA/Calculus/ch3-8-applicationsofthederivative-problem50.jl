using SymPy
@syms x dx v dv
constant(ex) = prod(x for x in ex.as_ordered_factors() if x.is_constant())
ex = sin((x^(2) + 1)^(4))^(3)*(cos((x^(2) + 1)^(4))*((x^(2)+1)^(3)))*x * dx

u = (x^2 + 1)^4
du = diff(u, x) * dx
c = constant(du)
duₑ = du/c
ex1 = subs(ex, duₑ => dv/c, u=>v, dv=>1)
integrate(ex1, v)(v => u)