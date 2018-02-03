#ESMA 3016
#EAF/Noviembre 2014
#Lab20: Intervalos confianza y prueba de hipotesis para la media
#Caso 2: Poblacion Normal y varianza (sigma^2) desconocida,muestra pequena
#uso de la distribucion t de Student
#Comparacion de la curva t con la curva normal estandar
x=seq(-3,3,.01)
#t con 10 grados de libertad
plot(x,dt(x,10),type="l",col=3)
points(x,dnorm(x),type="l",col=2)
#t con 30 grados de libertad
plot(x,dt(x,30),type="l",col=3)
points(x,dnorm(x),type="l",col=2)
#Area debajo de la curva t
pt(2,10)
#Percebtile de la curva t
qt(.95,10)
#Generacion al azar de valores de la t con 10 grados de libertad
a=rt(1000,10)
#media estimada de a t con 10 grados de libertad
mean(a)
#el valor exacto es CERO
#deviacion estandar estimada de la t con 10 grados de libertad
sd(a)
#el valor exacto debe ser sqrt(n/n-2)=1.118
#Intervalo de confianza para la media
#La media muestral xbarra es un estimador de la media pobacional mu
#Intervalo de confianza para mu del 100(1-alfa)%, alfa es el nivel de significacion
#xbar-t(alfa/2,n-1)*s/sqrt(n),xbarra+t(alfa/2,n-1)*s/sqrt(n)
#Ejemplo 1: Hallar el intervalo de confianza del 95% para el promedio de todos los graduandos
#basado en la siguiente muestra de 14 graduandos
#Asumir que la poblacion es normal 
gpa=c(3.15,2.80,2.56,3.17,3.73,2.77,3.18,3.12,3.33,2.99,2.71,2.83,3.45,3.55)
xbarra=mean(gpa)
lower=xbarra+qt(.025,13)*sd(gpa)/sqrt(14)
upper=xbarra+qt(.975,13)*sd(gpa)/sqrt(14)
cat("El intervalo de confianza es",lower,"-",upper,"\n")
#hallando el intervalo de confianza con el comando t.test
t.test(gpa,mu=3,alternative="two.sided",conf.level=.95)
#Probar la hipotesis de que la  gpa promedio de todos los graduandos
#sea mayor que 3.0
#Sol
#Hipotesis nula es mu=3.0
#Hipotesis alterna mu>3.0
t.test(gpa,mu=3.0,alternative="greater",conf.level=.95)
#pvalue<alfa=.05 rechaza la hipotesis nula de lo contrario lo acepta
#Ejemplo 2: Hallar el intervalo de confianza del 90% para el peso promedio (en gramos) de todos los recien nacidos
#basado en la siguiente muestra de 18 bebes
#Asumir que la poblacion es normal 
pesos=c(2400,3600,2525,3125,3300,2875,2335,4000,3820,2990,3110,3810,4100,3700,2200,2800,3700,4300)
xbarra=mean(pesos)
lower=xbarra+qt(.05,17)*sd(pesos)/sqrt(18)
upper=xbarra+qt(.95,17)*sd(pesos)/sqrt(18)
cat("El intervalo de confianza es",lower,"-",upper,"\n")
#Probar la hipotesis de que la  gpa promedio de todos los graduandos
#sea menor que 3500
#Sol
#Hipotesis nula es mu=3500
#Hipotesis alterna mu<3500
#Calculando la prueba estadistica
ttest=(mean(pesos)-3500)/(sd(pesos)/sqrt(18))
#Calculando el p-value
pvalue=pt(ttest,17)
#haciendo la prueba directamente
t.test(pesos,mu=3500, alternative="less")
#Si pvalue<alfa=.05 se rechaza la hipotesis nula de lo contrario se acepta
#Si la Hipotesis alternativa es "menor que" ,P-value=pt(ttest,n-1)
#Si la hipotesis alternativa es "mayor que", P-value=1-pt(ttest,n-1)
p.value1=1-pt(ttest,17)
cat("\nPvalue si la alternativa es mayor que",p.value1)
#Si la hipotesis alternativa es "distinta de", P-value=2*(1-pt(abs(ttest),17))
p.value2=2*(1-pt(abs(ttest),17))
cat("\nPvalue si la alternative es distinta de",p.value2)
