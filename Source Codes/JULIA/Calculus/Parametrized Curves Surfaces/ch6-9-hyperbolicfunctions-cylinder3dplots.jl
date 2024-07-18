# https://stackoverflow.com/questions/74927607/how-to-plot-a-cylinder-with-glmakie-or-plotlyjs-in-julia
using Plots, LaTeXStrings, Plots.PlotMeasures, SymPy
gr()

function cylinder(r)   
    m = 200
    n = 130
    h = 3
    θ = range(0, 2π; length = n)
    t = range(0, h; length = m)
    x = r*cos.(ones(m)*θ')
    y = r*sin.(ones(m)*θ')
    z = t * ones(n)' # ones(size(u)) is a 100-element vector all entries are 1
    return x, y, z
end
my_cg = cgrad([:green,:blue])
surface(cylinder(3),  label="cylinder")