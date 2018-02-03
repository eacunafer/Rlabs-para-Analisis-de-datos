#ESMA 3016
#EAF/Abril 3 del 2017
#Lab11: Distribucion binomial
#Calculo de la probabilidad binomial para n=6, p=.35 y x=2 exitos
dbinom(2,6,.35)
#Calculo de todas las probabilidades binomiales
dbinom(0:6,6,.35)
#Verificando que la suma de todas las probabilidades da 1
sum(dbinom(0:6,6,.35))
#Calculando la probabilidad acumulada hasta x=1, con n=6 y p=.35 
pbinom(1,6,.35)
#Calculando todas las probabilidades acumuladas 
pbinom(0:6,6,.35)
#Calculando el quantil del 25%
qbinom(.25,5,.35)
#Generando una muestra de 100 valores de una binomial con n=6 y p=.35
rbinom(100,6,.35)
#Hallando las frecuencias relativas de la muestra generada
table(rbinom(100,6,.35))/100
#Ejemplo: Sea X: Número de preguntas bien contestadas por un estudiante que responde al azar un examen 
#tipo selección múltiple que consiste de 10 preguntas, cada una con 4 alternativas de las cuales sólo una es correcta.
#calcular la probabilidad de que el estudiante: 
#i)	Tenga exactamente 3 preguntas buenas.
#ii)	Tenga a lo mas 6 preguntas buenas.
#iii)	Tenga por lo menos 3 buenas.
#iv)    Tenga por lo menos 2 malas
#soluciones
#X es una binomial con n=10 y p=1/4=.25
dbinom(3,10,.25)
pbinom(6,10,.25)
#Por conplemento
1-pbinom(2,10,.25)
#Por complememto, cambiando la p
1-pbinom(1,10,.75)
#Cambiando la pregunta a buenos
pbinom(8,10,.25)
#Calculando la media de una binomial
mu=sum((0:10)*dbinom(0:10,10,.25))


	