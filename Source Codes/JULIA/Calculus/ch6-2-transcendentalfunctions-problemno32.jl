# To find the inverse of f(x) = x^2 - 3x + 1
# Find the factor of f(x) by manipulating f(x) till we get term in x with power of 2
# Then adjust the left side and cancel the power of 2 by giving square root to the left side
using SymPy, PrettyTables
@syms x

f(x) = x^2 - 3x + 1
println(pretty_table(String, 
 	 vcat([[string(t) factor(t*f(x)) ] for t in 1:1:10]...); 
  	header=["i", "factor of i * f(x)"]))

println(pretty_table(String, 
 	 vcat([[string(t) factor(f(x)+t) ] for t in 1:1:10]...); 
  	header=["i", "factor of f(x)+i"]))

println(pretty_table(String, 
 	 vcat([[string(t) factor(2f(x)+t) ] for t in 1:1:10]...); 
  	header=["i", "factor of 2f(x)+i"]))

println(pretty_table(String, 
 	 vcat([[string(t) factor(3f(x)+t) ] for t in 1:1:10]...); 
  	header=["i", "factor of 3f(x)+i"]))

println(pretty_table(String, 
 	 vcat([[string(t) factor(4f(x)+t) ] for t in 1:1:10]...); 
  	header=["i", "factor of 4f(x)+i"]))

println(pretty_table(String, 
 	 vcat([[string(t) factor(5f(x)+t) ] for t in 1:1:10]...); 
  	header=["i", "factor of 5f(x)+i"]))

println(pretty_table(String, 
 	 vcat([[string(t) factor(6f(x)+t) ] for t in 1:1:10]...); 
  	header=["i", "factor of 6f(x)+i"]))

println(pretty_table(String, 
 	 vcat([[string(t) factor(7f(x)+t) ] for t in 1:1:10]...); 
  	header=["i", "factor of 7f(x)+i"]))

println(pretty_table(String, 
 	 vcat([[string(t) factor(8f(x)+t) ] for t in 1:1:10]...); 
  	header=["i", "factor of 8f(x)+i"]))

println(pretty_table(String, 
 	 vcat([[string(t) factor(9f(x)+t) ] for t in 1:1:10]...); 
  	header=["i", "factor of 9f(x)+i"]))

println(pretty_table(String, 
 	 vcat([[string(t) factor(10f(x)+t) ] for t in 1:1:10]...); 
  	header=["i", "factor of 10f(x)+i"]))
