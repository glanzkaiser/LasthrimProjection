Hopalong attractors (also known as Martin attractors after their discoverer Barry Martin based at Aston University, Birmingham, UK. They were later popularised by A. K. Dewdney in a 1986 Scientific American article). A point is started at (0, 0) and subsequently hops between elliptic orbits. The system is a 2D, non-linear iterative type as follows:



x(n+1) = y(n) - SIGN(x(n)) * SQRT(ABS(b * x(n) - c))

y(n+1) = a - x(n)



x(0) = 0.0

y(0) = 0.0



The SIGN function returns 1 if its argument is greater than 0, -1 if less than 0, and 0 if equal to 0. The ABS function simply returns the absolute value of its argument. SQRT is the square root function. All are standard math library functions.

Here a,b and c are free parameters that ultimately control the characteristic features of the attractor. In the present case these were allowed to vary pseudo-randomly (there is no such thing as randomness!) between -1 and 1. 