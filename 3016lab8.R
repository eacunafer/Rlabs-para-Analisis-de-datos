#*****************************************
#Laboratorio 8 de ESMA 3016
# correlacion y regresion lineal
# Creado por Edgar Acuna
# Febrero 2017
#*****************************************
#Leyendo el conjunto de datos mortalidad de la internet
muertes=read.table("http://academic.uprm.edu/eacuna/mortalidad.txt",header=T)
#Mostrando los datos
muertes
#Haciendo un plot de tasa de mortalidad versus porcentaje de inmunizacion
x=muertes$porc.inmuniz
y=muertes$tasa.mort
win.graph()
plot(x,y,xlab="porcentaje de inmunizacion", ylab="tasa de mortalidad")
title("Relacion de la tasa de mortalidad con el porcentaje de inmunizacion")
pais=muertes$nacion
text(x,y,labels=as.character(pais),cex=.65,col="blue",pos=3, srt=30)
#Haciendo el ajuste por minimos cuadrados
l1<-lsfit(x,y)
#Mostrando los resultados del ajuste minimo cuadratico
l1
#Imprimiendo un resultado mas corto del ajuste minimocuadratico
ls.print(l1)
#Trazando la linea de regresión sobre el plot de puntos
abline(l1)
alfa=l1$coeff[1]
beta=l1$coeff[2]
text(50,100,bquote(hat(y)==.(alfa)+.(beta)*x))
#Extrayendo las  observaciones anormales 11 y 12  y creando un 
#nuevo conjunto muertes1
muertes1<-muertes[-c(11,12),]
#Haciendo el ajuste por minimos cuadrados excluyendo las 
#observaciones anormales y ploteando la linea de regresion para el nuevo 
#conjunto de datos
x1=muertes1$porc.inmuniz
y1=muertes1$tasa.mort
l2<-lsfit(x1,y1)
win.graph()
plot(x1,y1,xlab="porcentaje de inmunizacion", ylab="tasa de mortalidad")
abline(l2)
alfa1=l2$coeff[1]
beta1=l2$coeff[2]
text(50,100,bquote(hat(y)==.(alfa1)+.(beta1)*x))
ls.print(l2)
#Ploteando la linea y los puntos usando ggplot2
library(ggplot2)
attach(muertes)
p=ggplot(muertes,aes(x=porc.inmuniz,y=porc.inmuniz))+geom_smooth(method="lm",se=FALSE,color="red",formula=y~x)+geom_point()
p
# Calculo de la linea de regresion usando el comando lm
l3<-lm(tasa.mort~porc.inmuniz,data=muertes)
l3
#Hallando la prediccion para un valor dado de X. 
porc.inmuniz<-79
porc.inmuniz<-as.data.frame(porc.inmuniz)
predict(l3,porc.inmuniz)