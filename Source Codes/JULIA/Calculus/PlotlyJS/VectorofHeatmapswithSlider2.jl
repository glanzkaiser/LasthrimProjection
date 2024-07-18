using PlotlyJS

Matrices   = [rand(2,2) for i = 1 : 3]
colorscale = [[0, "white"], [1, "cyan"]]

maps = Plot(  heatmap(z=Matrices[1], colorscale=colorscale),
              Layout(
                     width=400, 
                     height=400, 
                     margin_b=90,  
                     #this section creates the slider in the plot which can be dragged, but only manually
                     sliders= [
                            attr(
                                   active=0, 
                                   pad_t=20, 
                                   steps=[
                                          attr(
                                                 method = "restyle", 
                                                 label= "Heatmap $k",
                                                 args = [
                                                        attr(
                                                               z= (Matrices[k], ), 
                                                               colorscale=(colorscale, )
                                                        )
                                                 ] 
                                          ) for k= 1:length(Matrices)] #end steps vector
                            ) #end slider attributes
                     ] #end sliders
              ) #end layout
       ) #end plot
  
display(maps)