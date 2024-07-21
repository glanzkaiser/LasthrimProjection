using GLMakie
using ColorSchemes

function hopalong(num,a,b,c)               # e.g.hopalong(1e6,-1.7,-0.3,0.7)     

    x,y=Float64(0),Float64(0)              # origin point
    u,v,d = Float64[],Float64[],Float64[]  # point vectors and distance vector, color c of scatter = f(distance)                  
    ms = 0.000001                          # marker size
    
    for i=1:num
        push!(u,x); push!(v,y); push!(d,sqrt(x^2+y^2)); xx = y-sign(x)*sqrt(abs(b*x-c)); yy = a-x; x = xx; y = yy        
    end

    scatter(u, v, color=d, colormap=:inferno, markersize=ms)

end

# hopalong(1_000_000, 17.0, 0.314, 0.7773)