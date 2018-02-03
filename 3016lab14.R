#ESMA 3016
#EAF/Octubre 2016
#Lab14: Distribuciones Continuas 
#######################################################################
#Distribucion Uniforme
#######################################################################
#El valor de la funcion de densidad en .1
dunif(.1)
#La probabilidad acumulada hasta .1
punif(.1)
#La probabilidad entre .4 py .5
punif(.5)-punif(.4)
#El histogram de 100 uniformes simuladas al azar
hist(runif(100),freq=FALSE)
#Uniforme en un intervalo (a,b)=(2,10)
dunif(2.5,2,10)
punif(4,2,10)
qunif(.7,2,10)
#**********************************************************
#Generando n valores de una bernoulli con parametro p
#*********************************************************
bernoulli=function(p,m){x=rep(0,m)
for (i in 1:m){if(runif(1)<p) x[i]=1 }
return(x)}
bernoulli(.8,1000)
#************************************************************
#Generando una binomial con parametros n y p
#************************************************************
#La suma de n bernoulli's da una binomial(n,p)
rbinomial=function(p,n,m){y=rep(0,m)
for(i in 1:m)
{for(j in 1:n)
{y[i]=y[i]+bernoulli(p,1)}
}
return(y)
}
#***************************************************************************
#simulando una muestra de 200 tiempos de espera en un banco
#se esta considerando que el tiempo de espera promedio es 10 minutos
#los tiempos estan dados en minutos
#******************************************************************************* 
tiempos=floor(rexp(200,1/10))
#Generando un histograma de los datos pero de tal manera que el area total sea 1
hist(tiempos, freq = FALSE)
#Montando la curva exponencial sobre el histograma
curve(dexp(x, 1/10), col = 2, lwd = 4, add = TRUE)
#Cual es la probabilidad de que se tenga que esperar mas de 15 minutos para ser atendido?
#Area bajo la curva mas alla de 15
integrando=function(x){exp(-x/10)/10}
integrate(integrando,15,Inf)
#Haciendolo por complemento=1-area hasta 15 y usando la densidad exponencial
1-pexp(15,1/10)
#Estimando la probabilidad
probest=length(tiempos[tiempos>15])/200
