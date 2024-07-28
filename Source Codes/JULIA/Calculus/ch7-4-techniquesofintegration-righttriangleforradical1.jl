using Plots, LaTeXStrings, Plots.PlotMeasures
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

function shape(ptlist::Vector{Point})
    xlist = [pt.x for pt in ptlist]
    ylist = [pt.y for pt in ptlist]
    shape = Shape(xlist, ylist)
end;
shape(tri::Triangle) = shape(vertices(tri));

trishape=shape(tri)

s2 = L"t";
s5 = L"a";
s6 = L"\sqrt{a^{2}-x^{2}}";
s9 = L"x";

plot(trishape,xaxis=:false, yaxis=:false,
	leg=false, fill=(0, :green), aspect_ratio=:equal, bottom_margin=10mm, fillalpha= 0.2)
annotate!([(3.8, 3.6, (s5, 10, :black)), 
	   (2.5, 2.2, (s2, 10, :black)), 
           (4.2, 1.7, (s6, 10, :black)),
	   (6.3, 3.5, (s9, 10, :black))])
