# https://inventwithpython.com/recursion/chapter2.html

def exponentByIteration(a, n):
    result = 1
    for i in range(n):
        result *= a
    return result

print('By Iteration')
print(exponentByIteration(3, 6))
print(exponentByIteration(10, 3))
print(exponentByIteration(17, 10))

def exponentByRecursion(a, n):
    if n == 1:
        # BASE CASE
        return a
    elif n % 2 == 0:
        # RECURSIVE CASE (When n is even.)
        result = exponentByRecursion(a, n // 2)
        return result * result
    elif n % 2 == 1:
        # RECURSIVE CASE (When n is odd.)
        result = exponentByRecursion(a, n // 2)
        return result * result * a

print('By Recursive')
print(exponentByRecursion(3, 6))
print(exponentByRecursion(10, 3))
print(exponentByRecursion(17, 10))

# If you want to calculate the factorial of 1,001, 
# the recursive factorial() function must make 1,001 recursive function calls. 
# However, your program is likely to cause a stack overflow before it can finish, 
# because making so many function calls without returning would exceed 
# the maximum call stack size of the interpreter. 
# This is terrible; you would never want to use a 
# recursive factorial function in real-world code. 
