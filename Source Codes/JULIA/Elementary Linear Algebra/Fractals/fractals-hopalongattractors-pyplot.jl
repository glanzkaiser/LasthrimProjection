using PyPlot; pygui(false)                  # pygui open plot in seperate interactive window if true

function hopalong(num,a,b,c)                # e.g.hopalong(1e6,-1.7,0.5,1.1)   
    
    x::Float64,y::Float64 = 0,0             # origin point
    u,v,d = Float64[],Float64[],Float64[]   # point vectors (x,y) and distance vector(d), color c of scatter = f(d)
    markerstyle="."; markersize = 0.1
    
    for i=1:num
        xx = y-sign(x)*sqrt(abs(b*x-c)); yy = a-x; x = xx; y = yy; push!(u,x); push!(v,y); push!(d,sqrt(x^2+y^2))
    end
    
    figure=PyPlot.gcf()
    figure.set_size_inches(10,8)
    #scatter(u,v,s=markersize,marker=markerstyle,c="black")
    scatter(u,v,s=markersize,marker=markerstyle,c=d,cmap="gnuplot")
    title("Orbit of Martin's Map(Hopalong attractor). Parameters: num=$num, a=$a, b=$b, c=$c,markerszie=$markersize",fontsize=10)
    #savefig("Martins_Pics/hopalong@num = $num , a = $a , b = $b , c = $c.png",dpi=300) 

end

hopalong(1e6,2.0,0.3,0.7)