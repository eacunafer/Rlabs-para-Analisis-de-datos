#ESMA 3016
#EAF/Noviembre 2014
#Lab17: Distribucion de medias y el teorema del limite Central
#Distribucion de medias mestrales de una exponencial
#Generacion de 1000 muestras de tamano 10 de una exponencial con lambda=1/3
#este exponecial tiene media igual a 1/lambda=3 , varianza=1/lambda^2=9, desv.est=3
muestras1=matrix(rexp(10000,1/3),ncol=10)
#Calculando las medias de cada una de las 1000 muestras
medias1=apply(muestras1,1,mean)
hist(medias1)
#Generacion de 1000 muestras de tamano 20 de una exponencial con lambda=1/3
muestras2=matrix(rexp(20000,1/3),ncol=20)
#Calculando las medias de cada una de las 1009 muestras
medias2=apply(muestras2,1,mean)
hist(medias2)
#Generacion de 1000 muestras de tamano 50 de una exponencial con lambda=1/3
muestras3=matrix(rexp(50000,1/3),ncol=50)
#Calculando las medias de cada una de las 1000 muestras
medias3=apply(muestras3,1,mean)
hist(medias3)
#Generacion de 1000 muestras de tamano 100 de una exponencial con lambda=1/3
muestras5=matrix(rexp(100000,4),ncol=100)
#Calculando las medias de cada una de las 1000 muestras
sumas5=apply(muestras5,1,sum)
hist(sumas5)
#Calculando la media de las medias
mean(sumas5)
#Notar que la media de las medias esta cerca 3
sd(sumas5)
#Notar que la desviacion estandar de las medias esta cerca 3/sqrt(100)=.3
par(mfrow=c(2,2))
hist(medias1)
hist(medias2)
hist(medias3)
hist(medias4)
#Teorema del Limite Central: De Moivre(1738), Laplace(1812), Liapunov(1902)
#La media de muestras aleatorias de tamano n extraida de una distribucion que tiene media mu
#y varianza sigma^2 se distribuyen aproximadamente en forma normal con media mu  y varianza sigma^2/n
#Ejemplo: La Poisson tiene media  y varianza igual a lambda. Entinces las media de muestras de tamano
# n se distribuiran aproximadamente con media lambda y varianza lambda/n  






