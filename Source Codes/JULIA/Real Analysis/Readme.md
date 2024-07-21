# About
Compilation of Julia code for Real Analysis learning for Undergraduate and Graduate degree.

# Structure

1. RealAnalysis (Basic level)
2. IntroductoryRealAnalysis

# Why Learn Real Analysis
As one of the hardest course in Mathematics, This topic is your introduction to proof-based mathematics. It is a sophisticated math course, and you can learn a lot of things that you can later apply to Finance, as Glanz in her undergraduate degree learned that the lecturer in the "Introduction to the Theory of Interest" class talked about "Real analysis". Not only finance, Electrical Engineering uses Real Analysis too. The future of electricity (either wireless or can transforming energy) will depends on strong background in Mathematics especially in Real Analysis.

## Packages for Real Analysis (5 November 2022)

```
Status `~/LasthrimProjection/JupyterLab/RealAnalysis/Project.toml`
  [a2e0e22d] CalculusWithJulia v0.1.0
  [ebaf19f5] MTH229 v0.2.11
  [91a5bcdd] Plots v1.35.3
  [24249f21] SymPy v1.1.7

```

# Setup
(Assuming you are using LinuxOS or GFreya OS and already installed Julia and IJulia)

1. First create an empty directory, I name it "RealAnalysis" then inside the directory open terminal and type

```
julia --project="."

julia> using IJulia
julia> notebook()
```

![Julia](https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Real%20Analysis/images/LPrealanalysis-setup-1.png)

2. Afterwards, download the notebook from this: 

`https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Real%20Analysis/IntroductoryRealAnalysis.ipynb`

3. Open the notebook with IJulia/Jupyter Notebook and then hover / scrolldownward to the end of the page and run the cell containing this:

```
import Pkg
Pkg.activate("RealAnalysis")
```
![Julia](https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Real%20Analysis/images/LPrealanalysis-setup-2.png)

#### Make sure the path is correct with the folder designated for this project.


## Lasthrim' Galleries for Julia-RealAnalysis
| Chapter 1: Logic and Proofs | Chapter 2: Quantifiers | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Real%20Analysis/images/LPrealanalysis-1-1.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Real%20Analysis/images/LPrealanalysis-2-1.png" width="83%"> | 
| <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Real%20Analysis/RealAnalysis.ipynb">RealAnalysis.ipynb</a> | | 

| Chapter 3: Rational Numbers | Chapter 4: Trigonometric Functions | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Real%20Analysis/images/LPrealanalysis-3-1.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Real%20Analysis/images/LPrealanalysis-4-1.png" width="83%"> | 
| <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Real%20Analysis/RealAnalysis.ipynb">RealAnalysis.ipynb</a> | |

| Chapter 5: Complex Numbers | Chapter 6: Sequences | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Real%20Analysis/images/LPrealanalysis-5-1.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Real%20Analysis/images/LPrealanalysis-6-1.png" width="83%"> | 
| <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Real%20Analysis/RealAnalysis.ipynb">RealAnalysis.ipynb</a> | |
