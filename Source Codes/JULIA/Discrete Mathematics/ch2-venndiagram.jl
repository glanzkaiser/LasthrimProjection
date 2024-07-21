using LaTeXStrings, Plots
plotlyjs()

# Create scatter trace of text labels
# &#8745; is the html code for \cap
p = plot(scatter(
    x=[1, 1.75, 2.5, 1.75],
    y=[1, 1, 1, 2.5],
    text=["A", "A &#8745; B", "B", "C"],
    mode="text",
    textfont=attr(
        color="black",
        size=18,
        family="Arail",
    )
))

# Update axes properties

update_xaxes!(p,
    showticklabels=false,
    showgrid=false,
    zeroline=false,
)

update_yaxes!(p,
    showticklabels=false,
    showgrid=false,
    zeroline=false,
)

relayout!(
    p,
    margin=attr(l=20, r=20, b=100),
    height=600, width=800,
    plot_bgcolor="white",
    # Add circles
    shapes=[
        circle(
            line_color="blue", fillcolor="blue",
            x0=0, y0=0, x1=2, y1=2,
            opacity=0.3, xref="x", yref="y"
        ),
        circle(
            line_color="gray", fillcolor="gray",
            x0=1.5, y0=0, x1=3.5, y1=2,
            opacity=0.3, xref="x", yref="y"
        )
	,
        circle(
            line_color="green", fillcolor="green",
            x0=0.75, y0=1.5, x1=2.75, y1=3.5,
            opacity=0.3, xref="x", yref="y"
        ),
    ]
)

#show image
p
PlotlyJS.savefig(p, "myimage.png")
#PlotlyJS.savefig(p, "myimage.html")
