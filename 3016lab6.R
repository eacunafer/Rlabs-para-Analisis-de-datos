#Lab6: ESMA3016
#Autor:Edgar Acuna
#Febrero  2017
#Calculo de cuartiles y Grafica del Boxplot
#***********************************************************
#Leyendo los datos clase97.txt
datos=read.table("http://academic.uprm.edu/eacuna/clase97.txt",na.strings="*",header=T)
attach(datos)
#Calculo de los quantiles
#Calculo del primer cuartil
q1=quantile(edad,.25)
#Calculo del tercer cuartil
q3=quantile(edad,.75)
#Calculo del primer cuartil, primer tercil, segundo tercil y tercer  cuartil
quantile(edad,c(.25,.33,.66,.75))
#Calculo del rango intercuartilico
iqr=q3-q1
print(iqr)
#Calculo de las fronteras interiores del boxplot
fi.inf=q1-1.5*iqr
fi.sup=q3+1.5*iqr
print(fi.inf)
print(fi.sup)
#Grafica del boxplot
boxplot(edad,col="blue")
a=boxplot(edad,plot=F)
attributes(a)
#El valor adyacente inferior, el cuartil inferior, la mediana
#el cuartil superior, el valor adyacente superior del boxplot 
a$stats
#los outliers segun el boxplot
a$out
boxplot(edad, col="green")
text(1,c(a$stats,a$out),c(a$stats,a$out),adj=c(-.5,-.5))
boxplot(creditos,col=5)
#usando la librery ggplot2
library(ggplot2)
ggplot(datos,aes(x=1,y=edad))+geom_boxplot()+theme(axis.text.x=element_blank(),
panel.background = element_rect(fill = "lightblue",colour = "lightblue",size = 0.5, linetype = "solid"),
panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "white"), 
panel.grid.minor = element_line(size = 0.25, linetype = 'solid',colour = "white"))+labs(x=" ")



