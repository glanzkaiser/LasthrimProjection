using PlotlyJS
DataVector = [[0 0 0; 1.0 0 1; 2 1 2],
              [1 3 3; 4 2.0 4; 5 3 5],
              [2 5 1;  4 7 3; 6.0 2 5]] 
colorscales=[colors.imola, colors.deep, colors.viridis]
fig = Plot(heatmap(z=DataVector[1], colorscale=colors.imola), #basic plot, updated by slider
           Layout(width=500, height=400, margin_b=90,           
                  sliders=[attr(active=0, 
                                pad_t=20, 
                                steps=[attr(method = "restyle",
                                            label= "Heatmap $k",
                                            args = [attr(z= (DataVector[k], ), 
                                                         colorscale=(colorscales[k], ))] 
                                                        ) for k= 1:length(DataVector)])
                              ])) 
display(fig)