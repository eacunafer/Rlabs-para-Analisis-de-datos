#ESMA 3016
#EAF/Junio 2017
#Lab19: Intervalos confianza y prueba de hipotesis para la media
#*********************************************************************************************
#Caso 1: Poblacion Normal y varianza (sigma^2) conocida
#Tambien puede aplicarse si la varianza es desconocida y la muestra es grande
#La media muestral xbarra es un estimador de la media pobacionl mu
#Intervalo de confianza para mu del 100(1-alfa)%, alfa es el nivel de significacion
#xbar-z(alfa/2)*sigma/sqrt(n),xbarra+z(alfa/2)*sigma/sqrt(n)
#Ejemplo 1: Hallar el intervalo de confianza del 95% para el promedio de todos los graduandos
#basado en la siguiente muestra de 14 graduandos
#Asumir que la poblacion es normal con varianza sigma^2=.35^2
gpa=c(3.15,2.80,2.56,3.17,3.73,2.77,3.18,3.12,3.33,2.99,2.71,2.83,3.45,3.55)
xbarra=mean(gpa)
lower=xbarra+qnorm(.025)*.35/sqrt(14)
upper=xbarra+qnorm(.975)*.35/sqrt(14)
cat("El intervalo de confianza es",lower,"-",upper,"\n")
#Probar la hipotesis de que la  gpa promedio de todos los graduandos
#sea mayor que 3.0
#Sol
#Hipotesis nula es mu=3.0
#Hipotesis alterna mu>3.0
s.e=.35/sqrt(14)
ztest=(xbarra-3.0)/s.e
#Calculando el p-value
p.value=1-pnorm(ztest)
#pvalue<alfa=.05 rechaza la hipotesis nula de lo contrario lo acepta
#Ejemplo 2: Hallar el intervalo de confianza del 90% para el peso promedio (en gramos) de todos los recien nacidos
#basado en la siguiente muestra de 18 bebes
#Asumir que la poblacion es normal con varianza sigma^2=650^2
pesos=c(2400,3600,2525,3125,3300,2875,2335,4000,3820,2990,3110,3810,4100,3700,2200,2800,3700,4300)
xbarra=mean(pesos)
lower=xbarra+qnorm(.05)*650/sqrt(18)
upper=xbarra+qnorm(.95)*650/sqrt(18)
cat("El intervalo de confianza es",lower,"-",upper,"\n")
#Probar la hipotesis de que la  gpa promedio de todos los graduandos
#sea menor que 3500
#Sol
#Hipotesis nula es mu=3500
#Hipotesis alterna mu<3500
s.e=650/sqrt(18)
ztest=(xbarra-3500)/s.e
#Calculando el p-value
p.value=pnorm(ztest)
#pvalue<alfa=.05 rechaza la hipotesis nula de lo contrario lo acepta
#Si la Hipotesis alternativa es "menor que" ,P-value=pnorm(ztest)
#Si la hipotesis alternativa es "mayor que", P-value=1-pnorm(ztest)
p.value1=1-pnorm(ztest)
#Si la hipotesis alternativa es "distinta de", P-value=2*(1-pnorm(abs(ztest))
p.value2=2*(1-pnorm(abs(ztest)))
