using Plots, LaTeXStrings
gr()
import Base: isequal, ==


abstract type GeoObject end
abstract type GeoShape <: GeoObject end

struct Point <: GeoObject
    x::Number
    y::Number
end
(==)(p1::Point, p2::Point) = p1.x==p2.x && p1.y==p2.y

struct Triangle <: GeoShape
    A::Point
    B::Point
    C::Point
end
Triangle(ax, ay, bx, by, cx, cy) = Triangle(Point(ax, ay), Point(bx, by), Point(cx, cy))
(==)(t1::Triangle, t2::Triangle) = vertices(t1) == vertices(t2)

function vertices(tri::Triangle) 
    [tri.A, tri.B, tri.C]
end

struct Edge <: GeoShape
    src::Point
    dst::Point
end

function edges(tri::Triangle)
    elist = Edge[]
    pts = vertices(tri)
    for i in 1:length(pts)-1
        push!(elist, Edge(pts[i], pts[i+1]))
    end
    push!(elist, Edge(pts[length(pts)], pts[1]))
    elist
end

struct Circle
    center::Point
    radius::Number
end
(==)(c1::Circle, c2::Circle) = c1.center == c2.center && c1.radius == c2.radius

ccenter(c::Circle) = c.center

A = Point(2,2); B = Point(6, 2); C = Point(6,5);
tri = Triangle(A, B, C)

D = Point(2,6); E = Point(6, 6); F = Point(6,9);
tri2 = Triangle(D, E, F)

G = Point(8,2); H = Point(12, 2); I = Point(12,5);
tri3 = Triangle(G, H, I)

J = Point(8,6); K = Point(12, 6); L = Point(12,9);
tri4 = Triangle(J, K, L)

function shape(ptlist::Vector{Point})
    xlist = [pt.x for pt in ptlist]
    ylist = [pt.y for pt in ptlist]
    shape = Shape(xlist, ylist)
end;
shape(tri::Triangle) = shape(vertices(tri));

trishape=shape(tri)
trishape2=shape(tri2)
trishape3=shape(tri3)
trishape4=shape(tri4)
    
s1 = L"\cos^{-1} \ x";
s2 = L"\sin^{-1} \ x";
s3 = L"\tan^{-1} \ x";
s4 = L"\sec^{-1} \ x";
s5 = L"1";
s6 = L"\sqrt{1-x^{2}}";
s7 = L"\sqrt{1+x^{2}}";
s8 = L"\sqrt{x^{2}-1}";
s9 = L"x";

plot(trishape,xaxis=:false,
	leg=false, fill=(0, :green), aspect_ratio=:equal, fillalpha= 0.2)
annotate!([(3.8, 7.8, (s5, 8, :black)), 
	   (3.8, 3.7, (s5, 8, :black)), 
	   (10.1, 5.6, (s5, 8, :black)), 
	   (10.1, 1.7, (s5, 8, :black)), 
           (2.8, 6.3, (s1, 8, :black)), 
           (2.9, 2.3, (s2, 8, :black)), 
           (8.8, 6.25, (s3, 8, :black)),
           (8.9, 2.3, (s4, 8, :black)),
	   (6.6, 7.3, (s6, 8, :black)),
	   (4.1, 1.7, (s6, 8, :black)),
	   (9.7, 7.7, (s7, 8, :black)),
	   (12.5, 3.6, (s8, 8, :black)),
	   (3.8, 5.8, (s9, 8, :black)),
	   (6.3, 3.4, (s9, 8, :black)),
	   (12.3, 7.5, (s9, 8, :black)),
	   (10.1, 3.8, (s9, 8, :black))])

plot!(trishape2, leg=false, fill=(0, :green), aspect_ratio=:equal, fillalpha= 0.2)
plot!(trishape3, leg=false, fill=(0, :green), aspect_ratio=:equal, fillalpha= 0.2)
plot!(trishape4, leg=false, fill=(0, :green), aspect_ratio=:equal, fillalpha= 0.2)