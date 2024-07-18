function newton(f::Function,fprime::Function,pin,eps,N)
	n=1
	er=-6
	p=0. # to ensure the value of p carries out of the while loop
	while n<=N
		p=pin-f(pin)/fprime(pin)
		if f(p)==0 || abs(p-pin)<eps
			return println("p is $p and the iteration number is $n, error tolerated 10^($er)")
		end
		pin=p
		n=n+1
	 end
	 y=f(p)
	 println("Method did not converge. The last iteration gives $p with function value $y, error tolerated 10^($er)")
	 
end

using Plots, LaTeXStrings
gr()

f(x) = 4x^3+3x^2+2x+1
               
plot(f, -10, 10, ylims=(-5,10),
    label=L"f(x)", framestyle=:zerolines,
     legend=:outerright)

# Put it like this newton(x -> f(x) -> f'(x), error tolerated, max number of iteration)
newton(x -> 4x^3+3x^2+2x+1,x->12x^2+6x+2,1,10^(-6),20)

#type at terminal: plot(f)