# About
Compilation of Julia code for Elementary Linear Algebra learning for Undergraduate degree.

We are using Jupyter Notebook for creating the code to help us with matrix computations.

## To download and setup

Open terminal (use Linux OS or any kind of OS with Python 3 installed)
```
pip3 install jupyterlab
python3 -m pip install webio_jupyter_extension

```

Now you must have Julia installed, from a directory targeted to become an environment for this Linear Algebra open Julia REPL:

```
julia --project="."

julia> ]

pkg> add IJulia

julia> using IJulia
julia> notebook()
```

After that your browser will be opened and you can load the .ipynb file here and test it out.

For those having 500 internal server error / kernel error type this at terminal:

```
pip3 install --upgrade nbconvert
```

Adjust your path as user at `~/.bashrc`, this is my path at CAELinux:

```
export JULIA_DIR="/home/browni/julia-1.7.3"
export CUDA_DIR="/usr/local/cuda-11.7"
export PATH="$PATH:$JULIA_DIR/bin:$CUDA_DIR/bin:/home/browni/.local/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$CUDA_DIR/lib64"

```

#### based on Lasthrim Projection book 

## Lasthrim' Galleries for Julia-ElementaryLinearAlgebra
| Chapter 1: Systems of Linear Equations and Matrices | Gaussian Elimination | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Elementary%20Linear%20Algebraimages/LPelementarylinalg-1-1.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Elementary%20Linear%20Algebraimages/LPelementarylinalg-1-2.png" width="83%"> | 
| <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Elementary%20Linear%20AlgebraElementaryLinearAlgebra.ipynb">ElementaryLinearAlgebra.ipynb</a> |  | 

| Chapter 1: Row Reduction with Variables | Chapter 2: Cramer's Rule | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Elementary%20Linear%20Algebraimages/LPelementarylinalg-1-3.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Elementary%20Linear%20Algebraimages/LPelementarylinalg-2-1.png" width="83%"> | 
|  |  | 

| Chapter 3: Euclidean Vector Spaces | Chapter 3: Norm of a Vector in 3-D | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Elementary%20Linear%20Algebraimages/LPelementarylinalg-3-1.png" width="83%"> | <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Elementary%20Linear%20Algebraimages/LPelementarylinalg-3-2.png" width="83%"> | 
|  |  | 

| Chapter 10: Fractals-Sierpinski Triangle | Coming soon | 
| ------------- | ------------- | 
| <img src="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Elementary%20Linear%20Algebraimages/LPelementarylinalg-10-13-sierpinski.gif" width="83%"> |  | 
| <a href="https://github.com/glanzkaiser/LasthrimProjection/blob/main/Source%20Codes/JULIA/Elementary%20Linear%20Algebrach10-13-fractals-sierpinskitriangle1.jl">ch10-13-fractals-sierpinskitriangle1.jl</a> |  | 

# Source

1. Rorres, Chris, Anton, Howard. Elementary Linear Algebra with Supplemental Applications 10th Edition

2. https://docs.juliahub.com/CalculusWithJulia/AZHbv/0.0.5/differentiable_vector_calculus/vectors.html#

3. https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/

4. https://julia.quantecon.org/tools_and_techniques/linear_algebra.html
