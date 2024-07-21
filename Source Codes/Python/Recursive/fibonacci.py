# https://inventwithpython.com/recursion/chapter2.html

def iterativefibonacci(nthNumber):
  ❶ a, b = 1, 1
    print('a = %s, b = %s' % (a, b))
    for i in range(2, nthNumber):
      ❷ a, b = b, a + b # Get the next Fibonacci number.
        print('a = %s, b = %s' % (a, b))
    return a

print('Iterative Fibonacci: ')
print(iterativefibonacci(10))

def recursivefibonacci(nthNumber):
    print('fibonacci(%s) called.' % (nthNumber))
    if nthNumber == 1 or nthNumber == 2: ❶
        # BASE CASE
        print('Call to fibonacci(%s) returning 1.' % (nthNumber))
        return 1
    else:
        # RECURSIVE CASE
        print('Calling fibonacci(%s) and fibonacci(%s).' % (nthNumber - 1, nthNumber - 2))
        result = fibonacci(nthNumber - 1) + fibonacci(nthNumber - 2)
        print('Call to fibonacci(%s) returning %s.' % (nthNumber, result))
        return result
print('Recursive Fibonacci: ')
print(recursivefibonacci(10))
# If you want to calculate the factorial of 1,001, 
# the recursive factorial() function must make 1,001 recursive function calls. 
# However, your program is likely to cause a stack overflow before it can finish, 
# because making so many function calls without returning would exceed 
# the maximum call stack size of the interpreter. 
# This is terrible; you would never want to use a 
# recursive factorial function in real-world code. 
