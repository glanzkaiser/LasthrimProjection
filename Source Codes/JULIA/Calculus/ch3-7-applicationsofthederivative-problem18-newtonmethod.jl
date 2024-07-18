using MTH229, Plots, LaTeXStrings, SymPy
gr()
@vars x

f(x) = (x^3 + 1)/(x^4 + 1)
fp(x) = f'(x)

function nm(f, fp, x)
     xnew, xold = x, Inf
     fn, fo = f(xnew), Inf

     tol = 1e-8
     ctr = 1

     while (ctr < 100) && (abs(xnew - xold) > tol) && ( abs(fn - fo) > tol )
       x = xnew - f(xnew)/fp(xnew) # update step
       xnew, xold = x, xnew
           fn, fo = f(xnew), fn
       ctr = ctr + 1
     end

     if ctr == 100
        error("Did not converge in 100 steps")
         else
       xnew, ctr
         end
end

# To obtain the stationary point of f(x)
# Find root of f'(x) near x=0.8, then change it to x=-1.5
# newton will use automatic differentiation for the derivative

xstar = newton(fp, -1.5, verbose=true)
  
# copy / type this manually at REPL to show the plot
# plot(f, -4, 4, ylims=(-0.51,1.5), label=L"f(x)", framestyle=:zerolines,legend=:outerright)
# plot!(fp, -4, 4, ylims=(-0.51,1.5), label=L"f'(x)", framestyle=:zerolines,legend=:outerright)