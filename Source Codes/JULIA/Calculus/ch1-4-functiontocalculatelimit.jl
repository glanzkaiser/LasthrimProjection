function lim(f::Function, c::Real; n::Int=6, dir="+")
    hs =  [(1/10)^i for i in 1:n]
     if dir == "+"
       xs = c .+ hs
     else
       xs = c .- hs
     end
     ys = f.(xs)
     [xs ys]
end

f(x) = x^x
c = 0
f(c)

println("c \t lim(x → c) f(x)")
lim(f, c; dir="+")
