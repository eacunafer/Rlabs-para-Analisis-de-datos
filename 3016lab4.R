#Lab4: ESMA3016
#Edgar Acuna
#Enero 2017
#Organizacion y presentacion de datos cualitativos
#***********************************************************************
#Leyendo otra vez los datos pero considerando los missing values *
datos=read.table("http://academic.uprm.edu/eacuna/clase97.txt",na.strings="*",header=T)
attach(datos)
#Tabla de frecuencias para datos categoricos
#variable a usar:programa
frec.abs=table(programa)
frec.relat=table(programa)*100/length(programa)
table2=cbind(frec.abs,frec.relat)
print(table2)
#Grafica de barras verticales
barplot(table(programa),col=1:6)
#Grafica de barras horizontales
barplot(table(programa),col=1:6,horiz=T,xlim=c(0,20),legend=T)
title("Grafica de barras horizontales de la variable programa")
#Pie-Chart
pie(table(programa),col=1:6,main="Piechart de la variable programa")
#Usando la libreria ggplot2
library(ggplot2)
#grafica de barras verticales
ggplot(datos, aes(factor(programa)))+geom_bar()+geom_text(stat='count',aes(label=..count..),vjust=-1)+labs(title="Grafica de barras verticales")
#Grafica de barras horizontales
ggplot(datos, aes(factor(programa)))+geom_bar()+coord_flip()
#Grafica de pie-chart
barras=ggplot(datos, aes(x=factor(1),fill=factor(programa)))+geom_bar(width=1)
barras
barras+ coord_polar("y")+labs(title="Grafica Circular")

 


