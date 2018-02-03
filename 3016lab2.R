#Esma 3016, lab2
#Edgar Acuna
#Enero 2017
#Organizacion y presentacion de datos cuantitativos discretos
#*************************************************************************
#Leyendo los datos
datos=read.table("http://academic.uprm.edu/eacuna/clase97.txt",header=T)
head(datos)
#adjuntando los datos
attach(datos)
#Funcion que hace la tabla de frecuencias de datos discretos
tabla.freq=function(vardatos)
{#cotejando que el argumento de la funcion no sea un vector nonumerico
# o una tabla de datos
if (is.factor(vardatos) || is.data.frame(vardatos)) 
        stop("need numeric data")
xname=deparse(substitute(vardatos))
#calculo de frecuencias absolutos
fabs=table(vardatos)
#calculo de frecuencias relativs porcentuales
frelat=fabs*100/length(vardatos)
#calculo de frecuencias absolutas acumuladas
fabs.acum=cumsum(fabs)
frelat.acum=cumsum(frelat)
valores=sort(unique(vardatos))
b=cbind(valores, fabs,frelat,fabs.acum,frelat.acum)
rownames(b)=rep("",length(valores))
colnames(b)[1]=xname
print(b)
}
tabla.freq(edad)
#Dotplot de la variable edad
stripchart(edad,method="stack",offset=1,main="Dotplot de Edad")
#usando la libreria ggplot2
library(ggplot2)
ggplot(datos, aes(x=edad))+geom_dotplot()+labs(title="Dotplot de Edad")
#Grafica de linea de la variable edad
plot(table(edad),xlab="edad", ylab="frecuencia absoluta",main="Grafica de linea de Edad", type="h")
#Otra forma es:
plot(as.numeric(unlist(dimnames(table(edad)))),table(edad),xlab="edad",ylab="frecuencia absoluta",type="h")
#Poniendo las frecuencias absolutas en la parte superior dde la linea
text(as.numeric(unlist(dimnames(table(edad)))),table(edad)+.25,labels=table(edad))
#Usando la libreria ggplot2
ggplot(datos, aes(factor(edad)))+geom_bar(width=.01)+ geom_text(stat='count',aes(label=..count..),vjust=-1)


