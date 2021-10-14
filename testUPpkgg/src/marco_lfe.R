install.packages("lfe")
library(lfe)
panel_sector_balanced$id1_year <- with(panel_sector_balanced, paste(id1, year, sep = "_"))
mod6.pooled = felm(Consumption~Temperatura+Lockdown|id1_year + id1 + year|0|0, data=panel_sector_balanced)
summary(mod6.pooled)

plm(Consumption~Temperatura+Lockdown+factor(id1)+factor(year), model = "pooling", data = panel_sector_balanced)

mydf = data.frame("t"=1:10, "y"=cos(1:10)+rnorm(10,0,0.2))
mydf2 = data.frame("altezza"=rnorm(100,160,10), "genere"=sample(c(0,1),100,replace=T))
plot(mydf2$genere, mydf2$altezza)
library(ggplot2)
p = ggplot(data=mydf, aes(x=t,y=y)) + geom_line()
p
p = p + geom_point(aes(size=y))
p
p = p+scale_fill_manual(values="red")
p
mydf2$genere = as.factor(mydf2$genere)
plot(mydf$t, mydf$y)
lines(mydf$t, mydf$y, lwd=2, col="red", lty=2)
