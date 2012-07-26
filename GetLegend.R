# Function to grop legends from graphs in ggplot
# https://github.com/hadley/ggplot2/wiki/Share-a-legend-between-two-ggplot2-graphs
GetLegend<-function(a.gplot){
  tmp <- ggplot_gtable(ggplot_build(a.gplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)}
