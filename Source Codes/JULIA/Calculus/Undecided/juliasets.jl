# How to plot the fractal:
# include("juliasets.jl")
# plotJulia(−0.20509091+0.71591*im)

using Plots, LinearAlgebra
gr()

"""
    plotIterates
Plots iteratations of the Julia function from in initial point z₀ ∈ ℂ and parameter c
    
Parameters
    z₀: Starting point
    c:  Control parameter
    n:  Number of iteratations
    
Returns
    Plot of n iteratations
"""
function plotIterates(z₀,c,n)
    # Initialize trajectory
    zₙ = length(z₀)
    traj = zeros(ComplexF64,n,zₙ)
    traj[1,:] .= z₀
    
    # Generate trajectory
    for k = 1:zₙ
        for j = 2:n
            traj[j,k] = traj[j-1,k]^2 + c
        end
    end  

    # Plot trajectory. The display function is needed inside a function.
    crvLabel = Array{String}(undef,zₙ)
    for k = 1:zₙ
        crvLabel[k] = string("z₀ = ", z₀[k])
    end
    # Note permation of label string. 
    # Ref: https://discourse.julialang.org/t/transpose-of-an-array-of-strings/40431/8
    crvPlot = plot(traj,
                   linewidth = 3,
                   aspect_ratio = 1,
                   xlabel = "Real axis",
                   ylabel = "Imag axis",
                   title = "Julia Iterates",
                   arrow = :arrow)
                   #label = permutedims(crvLabel)
                   #legend = :outertopright)
    display(crvPlot)

    # Return trajectory
    return traj

end

"""
    plotJulia
Plots points in a Julia set
Parameters
    c: Constant added to each iterate
"""
function plotJulia(c,xRng = [-1.6,1.6], yRng = [-1.6, 1.6])
    # Array of iteration counts
    nx = 1281
    ny = 1281
    iterCounts = zeros(nx,ny)
    # Locations 
    xLocs = range(minimum(xRng),stop = maximum(xRng),length = nx)
    yLocs = range(minimum(yRng),stop = maximum(yRng),length = ny)
    # Loop over x,y locations iterating until maxIter reached, or |z|² > 4
    maxIters = 1000
    for j = 1:nx
        for k = 1:ny
            z = xLocs[j] + yLocs[k]im
            while iterCounts[j,k] < maxIters && norm(z) < 2
                z = z^2 + c
                iterCounts[j,k] += 1
            end
        end
    end

    # Display Julia set as a heatmap
    display(heatmap(iterCounts'))

    # Return array of iterations
    return iterCounts
   
end
