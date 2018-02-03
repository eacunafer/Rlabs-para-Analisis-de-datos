#ESMA 3016
#EAF/Noviembre 2014
#Lab18: Bootstrapping
#una muestra normal simulada de 35 notas en un examen
data <- round(rnorm(35, 70, 10))
#Generando una lista de 100 muestras bootstrap de la muestra original  
bootsamples <- lapply(1:100, function(i)
sample(data, replace = T))
#Calculando las medias de las 100 muestras bootstrap
r.medias=sapply(bootsamples,mean)
#Calculando la media de las medias muestrales deberia ser como 70
mean(r.medias)
#Calculando la deviacion estandar (error estandar) de las medias muestrales
#deberia ser aprox 10/sqrt(35)
sd(r.medias)
#Haciendo el histograma de las 100 medias muestrales
hist(r.medias)
#calculando las medianas de las muestrales
r.medianas=sapply(bootsamples,median)
#Calculando la media de las medianas
mean(r.medianas)
#Calculando el error estandar de la mediana
sd(r.medianas)
#valor exaxto es
10*sqrt(pi/70)
hist(r.medianas)