#ESMA 3016
#EAF/Octubre 2016
#Lab12: Distribuciones Hipergeometrica, Geometrica y BInomial Negativa 
#Ejemplo1: De un lote de 10 articulos de los cuales 6 son de buenos y 4 danados se extraen al azar y Sin Reposicion
#5 de ellos.
#a)Cual es la probabilidad de que hayan  exactamente 3 danados entre los extraidos?
#b)Cual es la probabilidad de que A LO Mas 2 sean 2 danados? 
#c)Cual es la probabilidad de que haya al menos un danado entre los 5 extraidos?
#Sol: Sea X: Número de articulos danados (exito) en la muestra de 5. X es una hipergeometrica com m=4, n=6 y k=5
dhyper(3,4,6,5)
phyper(2,4,6,5)
1-phyper(0,4,6,5)
#Comparacion de la probabilidad teorica con la frecuencia relativa de 1000 valores simulados 
dhyper(0:4,4,6,5)
table(rhyper(1000,4,6,5))/1000
#Calculando la media de la hypergeometrica
mu=sum((0:4)*dhyper(0:4,4,6,5))
mu
#Ejemplo 2: Distribucion Geometrica
#Si las extracciones en el ejemplo anterior fueran con reemplazo
#a) Cual es la probabilidad de que el primer articulo danado salga en la tercera extraccion?
#b) Cual es la probabilidad de que el primer articulo danado salga a lo mas en  5 extracciones?
#c) Cual es la probabilidad de que el primer articulo danado salga despues de 4 extracciones?
#Solucion: Sea X: el numero de buenos extraidos hasta que salga el primer danado. X es una geometrica con p=.4
dgeom(2,.4)#a
pgeom(4,.4)#b
1-pgeom(3,.4) 	#c
#Comparacion de la probabilidad teorica con la frecuencia relativa de 1000 valores simulados del 0 al 10
dgeom(0:10,.4)
table(rgeom(1000,.4))/1000
#valor esperado estimada de una geometrica (el valor exacto es q/p=1.5)
mu=sum((0:100)*dgeom(0:100,.4))
#Ejemplo 3: Distribucion Binomial Negativa (tambien llamada Pascal)
#Bajo las mismas condiciones del ejemplo 2
#a) Cual es la probabilidad de que salgan dos articulos buenos antes de salir el tercer articulo danado?
#b) Cual es la probabilidad de que salgan a lo mas  3 buenos antes de que salga el tercer articulo danado?
#b) Cual es la probabilidad de que el tercer articulo danado salga despues de que salgan 5 buenos?
#Solucion: Sea X: el numero de buenos extraidos hasta que salga el tercer danado. X es una binomial negativa con r=3 y p=.4
dnbinom(2,3,.4)
pnbinom(3,3,.4)
1-pnbinom(5,3,.4) 	
#Comparacion de la probabilidad teorica con la frecuencia relativa de 1000 valores simulados del 0 al 10
dnbinom(0:10,3,.4)
cumsum(dnbinom(0:10,3,.4))
table(rnbinom(1000,3,.4))/1000
#valor esperado estimado de la Binomial Negativa)valor escato es rq/p=3*.6/.4=4.)
mu=sum((0:100)*dnbinom(0:100,3,.4))