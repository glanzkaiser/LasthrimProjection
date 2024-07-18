# https://discourse.julialang.org/t/prime-numbers-between-given-two-numbers-in-julia-and-python/73626/11

using Primes, CSV, Tables

primes(1,1000000)

# Alternative

function isitprime(num)
    for j = 2:num-1
        if (num % j) == 0
            return false
        end
    end
    return true
end

function primesbetween(lower, upper)
    println("Prime numbers between $lower and $upper are:")
    for n in lower:upper
        if isitprime(n)
            println(n)
        end
    end
end

# type and it will print it one by one... you have to wait for a long time..
# primesbetween(1,1000000)

# to save time you can save the output as CSV
# CSV.write("./out.csv", Tables.table(primes(1,1000000)))
# CSV.write("./out.csv", (p = primes(1_000_000), ))