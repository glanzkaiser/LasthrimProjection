# https://inventwithpython.com/recursion/chapter2.html

def iterativefactorial(number):
    product = 1
    for i in range(1, number + 1):
        product = product * i
    return product
print('Iterative factorial: ')
print(iterativefactorial(5))

def recursivefactorial(number):
    if number == 1:
        # BASE CASE
        return 1
    else:
        # RECURSIVE CASE
      ❶ return number * factorial(number - 1)
print(factorial(5))
print('Recursive factorial: ')
print(recursivefactorial(5))


# If you want to calculate the factorial of 1,001, 
# the recursive factorial() function must make 1,001 recursive function calls. 
# However, your program is likely to cause a stack overflow before it can finish, 
# because making so many function calls without returning would exceed 
# the maximum call stack size of the interpreter. 
# This is terrible; you would never want to use a 
# recursive factorial function in real-world code. 
