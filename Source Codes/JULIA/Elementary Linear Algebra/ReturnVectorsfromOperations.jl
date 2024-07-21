# Effect on country after a certain policy or event happens
# Effect on nature' condition after certain daily activities around

A = [1,2,3,4,5];

x1 = zeros(5); x2 = zeros(5);

function f!(Y,Z,A)
         Threads.@spawn begin
           Z .= A ./ 2;
           Y .= A .+ 2;
         end
end

f!(x1, x2, A)
# Type x1