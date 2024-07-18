using Plots;
gr()
#plotlyjs()

X(r,theta) = r * cos(theta)
Y(r,theta) = r * sin(theta)
Z(r,theta) = r

rs = range(0, 2, length=50)
ts = range(0, 2pi, length=50)

surface(X.(rs',ts), Y.(rs', ts), Z.(rs', ts))