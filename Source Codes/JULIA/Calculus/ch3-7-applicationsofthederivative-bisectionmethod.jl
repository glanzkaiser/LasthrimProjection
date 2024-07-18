# Julia for Bisection method 
# For the equation f(x)=x^2−2, in the interval (x∈[-10,10]) (the initial points chosen)
# This method depends on the initial points chosen or the interval 
function bisection(f::Function, a::Number, b::Number;
                   tol::AbstractFloat=1e-8, maxiter::Integer=100)
    fa = f(a)
    fa*f(b) <= 0 || error("No real root in [a,b]")
    i = 0
    local c
    while b-a > tol
        i += 1
        i != maxiter || error("Max iteration exceeded")
        c = (a+b)/2
        fc = f(c)
        if fc == 0
            break
        elseif fa*fc > 0
            a = c  # Root is in the right half of [a,b].
            fa = fc
        else
            b = c  # Root is in the left half of [a,b].
        end
    end
    return c
end

bisection(x -> x^3-3x-5,-10,10)