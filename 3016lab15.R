#ESMA 3016
#EAF/Noviembre 2014
#Lab15: La Distribucion Normal o Gaussiana
#Graficando la Normal Estandar
x=seq(-3.5,3.5,by=.01)
plot(x,dnorm(x),type="l",col=2,lwd=2)
#Verificando que el area de la mitad de la curva normal es .5
halfnormal=function(x,k)
{#x es el punto hasta donde se calcula el area desde el centro,x>0
#k+1 es el numero de terminos que se usan de la de la serie exponencial para aproximar el area 
normal.5=0
for(i in 0:k){normal.5=normal.5+((-1)^i)*(x)^(2*i+1)/((2^i)*sqrt(2*pi)*(2*i+1)*factorial(i))}
return(normal.5)}
halfnormal(3.3,15)
#Area debajo de la normal estandar a la izquierda de x=1.5
pnorm(1.5,0,1)
#Area entre x=-2.25 y x=3.17
pnorm(3.17)-pnorm(-2.25)
#Area mas alla de x=.55
1-pnorm(.55)
#Calculo de cuantiles(percentiles) para la normal estandar
#el 20% inferior
qnorm(.2)
#el 10% superior
qnorm(.1)
#Generacion al azar de 1000 valores de una normal estandar
a=rnorm(1000)
#Generando un histograma de los datos pero de tal manera que el area total sea 1
hist(a, freq = FALSE)
#Montando la curva normal estandar sobre el histograma
curve(dnorm(x), col = 2, lwd = 4, add = TRUE)
#Estimando la media y varianza de una normal
mean(a)
var(a)
#ejemplo de aplicacion
#Los promedio academcios de los egresados de uan universidad se distribuyen normalmente con media 
#mu=2.5 y desviacion estandar sigma=.5
#a) cual es la probabilidad de que un egresado se haya graduado con un un gpa menor que 3.0
pnorm(3.0,2.5,.5)
#b) cual es la probabildiad de que un egresado se haya graduado con un gpa de mas de 3.5
1-pnorm(3.5,2.5,.5)
#c) cual es la probabilidad de que un egresado se haya graduado con un gpa mayor de 2.0 pero menor de 3.3
pnorm(3.3,2.5,.5)-pnorm(2.0,2.5,.5)
#d) A los egresados que tengan un GPA que caen el el 1% superior se le dara un premio cual es el gpa minimo
#para obtener un premio
qnorm(.95,2.5,.5) 
