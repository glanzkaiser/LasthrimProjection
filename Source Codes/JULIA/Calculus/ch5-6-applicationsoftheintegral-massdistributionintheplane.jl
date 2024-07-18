using Plots, LaTeXStrings; gr()

x = [-1, -0.7, 0.3, 1, 1.7]
y = [0.6, -0.7, -1.3, 1.5, 1.1]
scatter(x, y, xlims=(-2,2), ylims=(-2,3), 
	framestyle=:zerolines, label="", linecolor=:blue2)

annotate!([(-1,0.4, (L"(x_{n},y_{n})", 10, :black))])
annotate!([(-0.7,-1, (L"(x_{4},y_{4})", 10, :black))])
annotate!([(0.3,-1.5, (L"(x_{3},y_{3})", 10, :black))])
annotate!([(1,1.3, (L"(x_{1},y_{1})", 10, :black))])
annotate!([(1.7,0.9, (L"(x_{2},y_{2})", 10, :black))])

annotate!([(-1,0.8, (L"m_{n}", 10, :black))])
annotate!([(-0.7,-0.6, (L"m_{4}", 10, :black))])
annotate!([(0.3,-1.1, (L"m_{3}", 10, :black))])
annotate!([(1,1.7, (L"m_{1}", 10, :black))])
annotate!([(1.7,1.4, (L"m_{2}", 10, :black))])
