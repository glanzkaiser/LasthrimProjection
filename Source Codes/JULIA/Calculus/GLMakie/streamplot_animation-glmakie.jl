using GLMakie # or CairoMakie

v(x::Point2{T}, t) where T = Point2{T}(one(T) * x[2] * t, 4 * x[1])

sf = Observable(Base.Fix2(v, 0e0))

title_str = Observable("t = 0.00")

fig, ax, sp = Makie.streamplot(
               sf,
               -2..2, -2..2;
               linewidth = 2,
               figure=(padding = (0, 0),),
               axis=(title=title_str,),
               arrow_size = 0.09,
               colormap =:magma
           )

record(fig, "output.mp4", LinRange(0, 20, 5*30)) do i
  sf[] = Base.Fix2(v, i)
  title_str[] = "t = $(round(i; sigdigits = 2))"
end