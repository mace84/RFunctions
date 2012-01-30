## Matthias Orlowski
## R function to create coefficient plots 

CoeffPlot <- function(model,alpha=.05,varnames=names(coef)){
  require(MASS)
  require(ggplot2)
  
  coef <- model$coef
  st_err <- sqrt(diag(vcov(model)))
  ci_upper <- coef+st_err*(qt(1-alpha/2,model$df.residual))
  ci_lower <- coef-st_err*(qt(1-alpha/2,model$df.residual))
  sig <- ifelse(abs(coef/st_err) > qt(1-alpha/2,model$df.residual),1,0)
  x <- factor(varnames,levels = varnames)
  moddat <- data.frame(coef,st_err,ci_upper,ci_lower,sig,x)
  
  p <- ggplot(data=moddat,aes(x=x,y=coef,ymin=ci_lower, ymax=ci_upper,col=as.factor(sig)))
  p <- p + geom_pointrange() + scale_colour_manual(name= expression(paste(,alpha ," = ", 0.05)), values = c("0" = "black", "1"="red"), breaks= c("1","0"), labels =c("significant","not significant")) + geom_hline(yintercept=0,lty=2) + xlab("") + ylab("Estimates")
p <- last_plot() + coord_flip() + theme_bw()
return(p)
}

# todo:
# include options for correcting standard errors/plotting CIs based on corrected standard errors
# include switch for coloring significant coefficients


