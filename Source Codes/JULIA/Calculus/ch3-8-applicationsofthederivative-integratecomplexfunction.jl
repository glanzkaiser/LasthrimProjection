using SymbolicNumericIntegration, Symbolics

@variables x

expr=sin((x^(2) + 1)^(4))^(3)*(cos((x^(2) + 1)^(4))*((x^(2)+1)^(3)))*x
x*((1 + x^2)^3)*(sin((1 + x^2)^4)^3)*cos((1 + x^2)^4)

integrate(expr)
