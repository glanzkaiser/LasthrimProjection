x = 0.:0.05:3;
y = 0.:0.05:3;
z = @. sin(x^2) * exp(-(x+y))

using Gnuplot
@gsp xlab="X" ylab="Y" linetypes(:Set1_5, lw=3) :-
@gsp :- "set style fill transparent solid 0.3" :-
@gsp :- "set xyplane at 0" "set grid" :-
@gsp :- x y z z.*0 z "w zerror t 'Data'" :-
@gsp :- x.*0 y z "w l notit" :-  # projection on x=0
@gsp :- x y.*0 z "w l notit"     # projection on y=0
save(term="pngcairo", output="output.png")
