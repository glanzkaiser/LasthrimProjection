function newton(f::Function,fprime::Function,pin,eps,N)
	n=1
	p=0. # to ensure the value of p carries out of the while loop
	while n<=N
		p=pin-f(pin)/fprime(pin)
		if f(p)==0 || abs(p-pin)<eps
			return println("p is $p and the iteration number is $n")
		end
		pin=p
		n=n+1
	 end
	 y=f(p)
	 println("Method did not converge. The last iteration gives $p with function value $y")
end

using Plots, LaTeXStrings
gr()

f(x) = x^5+2x^3-5x-2
               
plot(f, -10, 10, ylims=(-5,10),
    label=L"f(x)", framestyle=:zerolines,
     legend=:outerright)

# Put it like this newton(x -> f(x) -> f'(x), error tolerated, max number of iteration)
newton(x -> x^5+2x^3-5x-2,x->5x^4+6x^2-5,1,10^(-4),20)

#type at terminal: plot(f)