## Matthias Orlowski
## 17.07.2012
## script to install R packgages after updating R

# create list with packages
packages <- c(# general stuff 
              "foreign" , "xtable" , "reshape"
              # Analysis
              , "MASS" , "Zelig" , "Amelia" , "gamlss" , "pcse" , "car", "lmtest"              
              # graphics
              , "ggplot2" , "tikzDevice", "ROCR", "sparationplot"
              # Bayesian analysis
              , "coda" , "MCMCpack" , "R2jags"
              # data sources
              , "datamart" 
              # extras
              , "countrycode", "rootSolve", "games" )

# install packages
install.packages(packages)