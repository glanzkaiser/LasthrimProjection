# For a given vector I would like to find the orthogonal basis around it

x = [1; 2; 3; 4; 5] #randn(5)
x⊥ = nullspace(x');
x'x⊥