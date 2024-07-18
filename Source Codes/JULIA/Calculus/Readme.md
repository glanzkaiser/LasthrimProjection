# About
Compilation of Julia code for Calculus part of Lasthrim Projection book.

# Example to Plot with Julia (Using Julia file and Type directly at REPL)

To try Julia file (.jl) open Julia REPL first:
```
julia --project="."
(open new environment)

julia> ]

pkg> add <package-name>
(install new package)
```

Check if the current working directory contains the file you want to try then type
```
include("ch0-5-plotimaginary.jl")
```
![Julia](https://raw.githubusercontent.com/glanzkaiser/LasthrimProjection/main/Source%20Codes/JULIA/Calculus/images/plotimaginary.png)

If you want to try to plot any kind of function then type
```
Using Plots
pyplot()
f(x) = log(x^3)
plot(f, -51, 51)
```
![Julia](https://raw.githubusercontent.com/glanzkaiser/LasthrimProjection/main/Source%20Codes/JULIA/Calculus/images/Logfunction.png)

For plotting multiple plots at once (translations example):
```
using Plots, LaTeXStrings
pyplot()

f(x) = sqrt(x)
g(x) = sqrt(x-3)
h(x) = sqrt(x)+2
i(x) = sqrt(x-3)+2

p1 = plot(f, -8, 8)
p2 = plot(g, -8, 8)
p3 = plot(h, -8, 8)
p4 = plot(i, -8, 8)

s1 = L"y = \sqrt{x}";
s2 = L"y = \sqrt{x-3}";
s3 = L"y = \sqrt{x}+2";
s4 = L"y = \sqrt{x-3}+2";

plot(p1, p2, p3, p4, layout = (2, 2), xaxis = "x", yaxis = s1, label=[s1 s2 s3 s4], 
title=["Original function" "Translated 3 units to the right" "Translated upward by 2 units" "Translated 3 units to the right then 2 units upward"],
titleloc = :bottom, titlefont = font(8))
```

## Lasthrim' Galleries for Julia-Calculus

| Modified Axes | Complex Plot | Translations (Multiple Plots) | Right Side Triangle |
| ------------- | ------------- | ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/sin18x.png?raw=true" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/Complex.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/sqrtx.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/rightsidetriangle.png" width="83%"> | 
| <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/Undecided/plotmodifiedaxes.jl">plotmodifiedaxes.jl</a> | <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/ch0-5-plotimaginary2.jl">ch0-5-plotimaginary2.jl</a> | <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/ch0-6-plottranslations2.jl">ch0-6-plottranslations2.jl</a> | <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/ch0-7-plotrighttriangle.jl">ch0-7-plotrighttriangle.jl</a> |

| Chapter 0: Preliminaries | Chapter 1: Limits | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/LPcalculus-0.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/LPcalculus-1.png" width="83%"> | 
| <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/ch0-7-plotsincoswithpi.jl">ch0-7-plotsincoswithpi.jl</a> | <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/ch1-1-plotlimitfunctions.jl">ch1-1-plotlimitfunctions.jl</a> | 

| Chapter 2: The Derivative | Chapter 3: Applications of the Derivative | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/LPcalculus-2.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/LPcalculus-3.png" width="83%"> | 
| <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/ch2-2-thederivative-leibniznotation.jl">ch2-2-thederivative-leibniznotation.jl</a> | <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/ch3-5-applicationsofthederivative-example1-f(x).jl">ch3-5-applicationsofthederivative-example1-f(x).jl</a> | 

| Chapter 4: The Definite Integral | Chapter 5: Applications of the Integral | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/LPcalculus-4.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/LPcalculus-5.png" width="83%"> | 
| <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/ch4-6-thedefiniteintegral-numericalintegral-trapezoidalruleplot.jl">ch4-6-trapezoidalruleplot</a> | <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/ch5-2-applicationsoftheintegral-problemno19.jl">ch5-2-solidofrevolution</a> | 


| Unit Circle | Rosenbrock Function | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/unitcirclewitharrow.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/rosenbrock2.png" width="83%"> | 
| <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/ch0-7-plotunitcircle4witharrow.jl">ch0-7-plotunitcircle4witharrow.jl</a> | <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/Undecided/rosenbrockfunction2.jl">rosenbrockfunction2.jl</a> | 

| Riemann Sums | Parametric Equations | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/riemannsums1.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/parametricfunctions.png" width="83%"> | 
| <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/ch4-1-riemannsums.jl">ch4-1-riemannsums.jl</a> | <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/ch5-4-parametricequations.jl">ch5-4-parametricequations.jl</a> | 

| Surface Plot | Julia Sets | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/surfaceplot-plotlyjs.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/juliasets1.png" width="83%"> | 
| <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/PlotlyJS/surfaceplot-plotlyjs.jl">surfaceplot-plotlyjs.jl</a> | <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/Undecided/juliasets.jl">juliasets.jl</a> | 

## Lasthrim' Galleries for Julia-Calculus with CairoMakie and GLMakie

I will update this Jupyter Notebook frequently. I just tested it on July 16th 2022, and know how the backend of Makie works. Will adjust it with Calculus plotting.

* CairoMakie needs IDE / Jupyter Notebook to show the figure, or if you still using Julia REPL you can save the image (in SVG/PNG/PDF format) with this code for example

```
using CairoMakie

fig = Figure()
ax = Axis(fig[1,1])

X = range(-2, stop=2, length=50)
Y = range(-2, stop=2, length=50)
f(x, y) = -x^3 + 3y - y^3

contour!(X, Y, f, color = :blue, linewidth=2)

dydx(x,y) = Point2f(1, x^2/(1 - y^2))

streamplot!(dydx, -2.0..2.0, -2.0..2.0, colormap=:blues)

fig

save("/home/browni/LasthrimProjection/JupyterLab/CairoMakie/example.svg",fig)
```
| CairoMakie (needs IDE / Jupyter Notebook to show figure) | GLMakie (able to use terminal directly / better to use terminal) | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/CairoMakie.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/GLMakie.png" width="83%"> | 
| <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/CairoMakie.ipynb">CairoMakie.ipynb</a> | <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/GLMakie.ipynb">GLMakie.ipynb</a> | 


#### (More details on how to set up and install Julia can be seen at the glanzhamzs/Julia directory)

# Basic Plotting with Julia
The most basic usage for plotting a function follows this pattern:
```
plot(function_object, from, to)
```

example
```
Using Plots
pyplot()
plot(sin, 0, 2pi)
```
### Root(im)

![Julia](https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Calculus/images/root(im).png)

#### Julia Learning Source

https://jverzani.github.io/CalculusWithJuliaNotes.jl/limits/limits.html

#### Makie + GLMakie

https://docs.juliahub.com/CalculusWithJulia/AZHbv/0.0.3/differentiable_vector_calculus/makie-plotting.html

#### Unicode and html for Latex Symbol
https://unicode-table.com/en/2229/

# Source of summarization
1. Calculus 9th Edition, Varberg-Purcell-Rigdon, Pearson Education International

2. https://www.thphys.uni-heidelberg.de/~hefft/vk1/#510e
