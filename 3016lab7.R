#Lab7: 
#Autor:Edgar Acuna
#Febrero 2017
#Organizacion y presentacion de datos bivariados
#*************************************************
#Leyendo los datos clase97.txt
datos=read.table("http://academic.uprm.edu/eacuna/clase97.txt",na.strings="*",header=T)
attach(datos)
#Caso 1: Ambas variables son categoricas
#******************************************
#Obteniendo las frecuencias absolutas
a=table(programa,escuela)
#Obteniendo las frecuencias porcentuales totales
a*100/28
#Obteniendo las frecuencias por filas
a1=cbind(a,apply(a,1,sum))
#Obteniendo la tabla completa con los totales de filas y columnas
tablag=rbind(a1,apply(a1,2,sum))
#Obteniendo las frecuencias relativas por filas
tablag*100/tablag[,3]
esc.aprueba=read.table("http://academic.uprm.edu/eacuna/eje316.txt",header=T)
attach(esc.aprueba)
table(escuela,aprueba)
#Haciendo una tabla para datos resumidos
opinionbysex=read.table("http://academic.uprm.edu/eacuna/eje2biv.txt",header=T)
attach(opinionbysex)
xtabs(conteo~Sexo+Opinion)
#Clustered bars con frecuencias relativas en la parte superior de las barras
barplot(a,col=1:5, ylim=c(0,8),xlim=c(0,15),beside=T,legend=T)
for(i in 1:5)
text(i,t(a[i,1]),t(a[i,1]),adj=c(-.5,-.5))
for(i in 1:5)
text(i+6,t(a[i,2]),t(a[i,2]),adj=c(-.5,-.5))
#usando la libreria ggplot2
library(ggplot2)
ggplot(datos,aes(x=factor(programa),fill=escuela))+geom_bar(stat="count",position=position_dodge())
#Stacked bars
barplot(a,col=1:5,ylim=c(0,20),xlim=c(0,20),legend=T)
#usando ggplot2
ggplot(datos,aes(x=programa,fill=escuela))+geom_bar(stat="count")
#Caso 2: Una de las variables es discreta y la otra continua
#*************************************************************
#Comparando gpa por sexo
boxplot(gpa~sexo,col=2:3)
#comparando gpa por programa
boxplot(gpa~programa,col=2:6)
#Usando la libreria ggplot2
ggplot(datos,aes(x=sexo,y=gpa,fill=sexo))+geom_boxplot()
#Caso 3: Ambas variables son continuas
datos1=read.table("http://academic.uprm.edu/eacuna/mortalidad.txt",header=T)
attach(datos1)
head(datos1)
plot(porc.inmuniz,tasa.mort)
text(porc.inmuniz,tasa.mort,nacion)
#Usando la libreria ggplot2
ggplot(datos1,aes(x=porc.inmuniz,y=tasa.mort,label=nacion))+
  geom_point()+geom_text(hjust=1,size=2)
#Hallando la correlacion
#Hallando la crrelacion entre las dps variables
cor(porc.inmuniz,tasa.mort)





