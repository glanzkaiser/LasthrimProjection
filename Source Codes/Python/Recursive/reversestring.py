# https://inventwithpython.com/recursion/chapter3.html

def rev(theString):
  ❶ if len(theString) == 0 or len(theString) == 1:
        # BASE CASE
        return theString
    else:
        # RECURSIVE CASE
      ❷ head = theString[0]
      ❸ tail = theString[1:]
      ❹ return rev(tail) + head

print(rev('abcdef'))
print(rev('Hello, world!'))
print(rev(''))
print(rev('X'))