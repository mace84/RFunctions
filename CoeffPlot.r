## Matthias Orlowski
## R function to create coefficient plots 

CoeffPlot <- function(model,sig=F,alpha=.05,varnames=names(coef)){
  require(MASS)
  require(ggplot2)
  
  coef <- model$coef
  st_err <- sqrt(diag(vcov(model)))
  ci_upper95 <- coef+st_err*(qt(1-0.05/2,model$df.residual))
  ci_lower95 <- coef-st_err*(qt(1-0.05/2,model$df.residual))
  ci_upper99 <- coef+st_err*(qt(1-0.01/2,model$df.residual))
  ci_lower99 <- coef-st_err*(qt(1-0.01/2,model$df.residual))  
  sig <- ifelse(abs(coef/st_err) > qt(1-alpha/2,model$df.residual),1,0)
  x <- factor(varnames,levels = varnames)
  moddat <- data.frame(coef,st_err,ci_upper95,ci_lower95,ci_upper99,ci_lower99,sig,x)

  ## if(sig){
  ##   p <- ggplot(data=moddat,aes(x=x,y=coef,ymin=ci_lower95, ymax=ci_upper95,col=as.factor(sig)))
  ##   p <- p + geom_pointrange()
  ##   p <- p + scale_colour_manual(name= expression(paste(,alpha ," = ", 0.05)), values = c("0" = "black", "1"="red"), breaks= c("1","0"), labels =c("significant","not significant"))
  ##   p <- p + geom_hline(yintercept=0,lty=2) + xlab("") + ylab("Estimates")
  ##   p <- last_plot() + coord_flip() + theme_bw()
  ##   return(p)
  ## }
  ## else
    p <- ggplot(data=moddat,aes(x=x,y=coef))
    p <- p + geom_point(colour="blue")
    p <- p + geom_linerange(aes(x=x,y=coef,ymin=ci_lower95, ymax=ci_upper95),color="blue",alpha=.6,size=1.2)
    p <- p + geom_linerange(aes(x=x,y=coef,ymin=ci_lower99, ymax=ci_upper99),color="blue",alpha=.8)
    p <- p + geom_hline(yintercept=0,lty=2,colour="black") + xlab("") + ylab("Estimates")
    p <- last_plot() + coord_flip() + theme_bw()
    p <- p + opts(axis.title.x =theme_text(size = 10))
    return(p)
}

# todo:
# include options for correcting standard errors/plotting CIs based on corrected standard errors
# include switch for coloring significant coefficients


