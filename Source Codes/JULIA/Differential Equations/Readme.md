# About
To learn about Differential Equations, that can be applied in almost all fields.

# Structure
You have to start from 1 as a basic foundation

1. Elementary Differential Equation
2. Differential Equation

## Packages for Differential Equations (15 December 2022)

```
Status `~/LasthrimProjection/JupyterLab/DifferentialEquations/Project.toml`
  [13f3f980] CairoMakie v0.10.0
  [0c46a032] DifferentialEquations v7.6.0
  [ee78f7c6] Makie v0.19.0
  [eacbb407] Meshes v0.26.6
  [1dea7af3] OrdinaryDiffEq v6.29.3
  [91a5bcdd] Plots v1.35.6
  [f2b01f46] Roots v2.0.8
  [24249f21] SymPy v1.1.7
```

# Setup
(Assuming you are using LinuxOS or GFreya OS and already installed Julia and IJulia)

1. First create an empty directory, I name it "DifferentialEquations" then inside the directory open terminal and type

```
julia --project="."

julia> using IJulia
julia> notebook()
```

![Julia](https://raw.githubusercontent.com/glanzkaiser/LasthrimProjection/main/Source%20Codes/JULIA/Differential%20Equations/images/LPdifferentialequations-setup-2.png)

2. Afterwards, download the notebook from this: 

`https://github.com/glanzkaiser/glanzshamzs/blob/main/LasthrimProjection/Julia-DifferentialEquations/Differential%20Equations.ipynb`

3. Open the notebook with IJulia/Jupyter Notebook and then hover / scrolldownward to the end of the page and run the cell containing this:

```
import Pkg
Pkg.activate("DifferentialEquations")
```
![Julia](https://raw.githubusercontent.com/glanzkaiser/LasthrimProjection/main/Source%20Codes/JULIA/Differential%20Equations/images/LPdifferentialequations-setup-1.png)

#### Make sure the path is correct with the folder designated for this project.

## Lasthrim' Galleries for Julia-DifferentialEquations

| Chapter 1.1: Direction Fields| Chapter 1.2: Solutions of Some Differential Equations | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/glanzshamzs/blob/main/Julia/images/LPdifferentialequations-1-1.png" width="83%"> | <img src="https://github.com/glanzkaiser/glanzshamzs/blob/main/Julia/images/LPdifferentialequations-1-2.png" width="83%"> | 
| <a href="https://github.com/glanzkaiser/glanzshamzs/blob/main/LasthrimProjection/Julia-DifferentialEquations/Elementary%20Differential%20Equations.ipynb">ElementaryDifferentialEquations.ipynb</a> | | 

| Chapter 2.2: Direction Field and Integral Curves| Chapter 2:  | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/glanzshamzs/blob/main/Julia/images/LPdifferentialequations-2-2.png" width="83%"> | | 
| <a href="https://github.com/glanzkaiser/glanzshamzs/blob/main/LasthrimProjection/Julia-DifferentialEquations/Elementary%20Differential%20Equations.ipynb">ElementaryDifferentialEquations.ipynb</a> | | 

| MyLeo Pendulum | Wait for it | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/glanzshamzs/blob/main/Julia/images/pendulum.gif" width="73%"> |  | 
| <a href="https://github.com/glanzkaiser/glanzshamzs/blob/main/LasthrimProjection/Julia-DifferentialEquations/pendulumplot1.jl">pendulumplot1.jl</a> | | 

# Source

1. Boyce, William E., DiPrima, Richard C. Elementary Differential Equations and Boundary Value Problems 9th Edition
2. Differential Equations Foundation Pre-Master Course for RealMaths Double Degree at L'Aquila University (Prof. Michele Palladino)
3. Simmons, George F., Differential Equations With Applications and Historical Notes 3rd Edition
4. https://tutorial.math.lamar.edu/classes/de/directionfields.aspx
5. https://x-engineer.org/plot-vector-field/
6. Julia Discourse (https://discourse.julialang.org)
