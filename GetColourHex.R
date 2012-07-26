# Matthias Orlowski
# 26.07.2012
# Function to get standard colors used in ggplot2

getColourHex <- function(num.vars){
  require(latticeExtra)
  require(ggplot2)
  mycols <- dput(ggplot2like(n = num.vars, h.start = 0, l = 65)$superpose.line
                 $col)
  return(mycols)
}