#ESMA 3016
#EAF/Noviembre 2014
#Lab16: Aproximacion normal a la Binomial
#De Moivre(1733)
#Si X es binomial(n.p) entonces Z=(X-np)/sqrt(npq) is N(0,1) cuando n es grande
#Como X es discreta y Z es continua se aplica un factor de correccion por continuidad de .5
#Asi P[X=k]~P[k-.5<X<k+.5]~P[(k-.5-np)/sqrt(npq)<Z<(k+.5-np)/sqrt(npq)]
#Ejemplo 1. con n=20 y p=.3 y k=8), np=6 y npq=4.2
p.exacta=dbinom(8,20,.3)
#Estandararizando
p.aprox1=pnorm(2.5/sqrt(4.2))-pnorm(1.5/sqrt(4.2))
#Sin estandarizar
p.aprox2=pnorm(8.5,6,sqrt(4.2))-pnorm(7.5,6,sqrt(4.2))
#Ejemplo 2. con n=100 y p=.4 y k=45, np=40 y npq=24
p.exacta=dbinom(45,100,.4)
p.aprox=pnorm(5.5/sqrt(24))-pnorm(4.5/sqrt(24))
#Ejemplo 3. con n=100 y p=.4 y k=30, np=40 y npq=24
p.exacta=dbinom(30,100,.4)
p.aprox=pnorm(-9.5/sqrt(24))-pnorm(-10.5/sqrt(24))
#otras formulas:
#P[a<=X<=b]~P[(a-.5-np)/sqrt(npq)<Z<(b+.5-np)/sqrt(npq)]=F[(b+.5-np)/sqrt(npq)]-F[(a-.5-np)/sqrt(npq)]
#Ejemplo 4. con n=100 y p=.4, calcular P(25<=X<=35)
p.exacta=pbinom(35,100,.4)-pbinom(24,100,.4)
p.aprox=pnorm(-4.5/sqrt(24))-pnorm(-15.5/sqrt(24))
#Trazando las probabilidades binomiales y la curva normal que aproxima las probabilidades
plot(0:100,dbinom(0:100,100,.4),type="h")
curve(dnorm(x,40,sqrt(24)),add=T,col=3,lwd=3)
#Teorema de Moivre pero usando proporciones, phat=X/n, proporcion de eventos en una muestra de tamano n, 
#phat es un numero entre 0 y 1.
#Z=(phat-p)/sqrt(pq/n) es aproximadamnte N(0,1), la probabilidad p es conocida
#Formula Prob(phat<po)=P(Z<(po-p)/sqrt(pq/n))
#Ejemplo 4. Cual es la probabilidad estimada de que en una muestra de tamano 100, la proporcion de  eventos sea menor de .6
# si se sabe que en la probabilidad de ocurrencia p es .4
pnorm(.6,.4,sqrt(.0024))
#La probabiidad exacta es
pbinom(59,100,.4)