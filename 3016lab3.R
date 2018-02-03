#Esma 3016, lab3
#Edgar Acuna
#Enero 2017
#Organizacion y presentacion de datos cuantitativos continuos
#************************************************************************
#Leyendo los datos
datos=read.table("http://academic.uprm.edu/eacuna/clase97.txt",header=T)
#adjuntando los datos al workspace
attach(datos)
#Histograma para la tabla de frecuencias para datos agrupados
hist(gpa, col="green")
#histograma con 6 intervalos. SOLO salen 4 intervalos
hist(gpa, breaks=6,col="blue")
#histograma con 5 intervalos
#Los breaks son determinado manualmente
b3=hist(gpa,breaks=c(2.15,2.5,2.85,3.2,3.55,3.9))
#puntos medios de los intervalos
midpoints=b3$mids
#frecuencias absolutas de los intervalos
f.abs=b3$counts
f.relat=b3$counts/length(gpa)
f.abs.acum=cumsum(f.abs)
f.relat.acum=cumsum(f.relat)
#Tabla de fercuencia para datos agrupados
tabla1=cbind(midpoints,f.abs,f.relat,f.abs.acum,f.relat.acum)
print(tabla1)
#histograma con 5 intervalos
hist(gpa,breaks=c(2.15,2.5,2.85,3.2,3.55,3.9),col="red")
text(midpoints,f.abs,f.abs,adj=c(.5,.5))
#usando la libreria ggplot2
library(ggplot2)
b=max(gpa)
a=min(gpa)
ggplot(datos, aes(x=gpa)) + 
  geom_histogram(breaks=seq(a,b, by = (b-a)/5), col="red",fill="green") +
  stat_bin(aes(y=..count.., label=..count..), breaks=seq(a,b,by=(b-a)/5),geom="text", vjust=-.5) 
#Leyendo otra vez los datos pero considerando los missing values *
datos1=read.table("http://academic.uprm.edu/eacuna/clase97.txt",na.strings="*",header=T)
attach(datos1)
hist(creditos)


 


