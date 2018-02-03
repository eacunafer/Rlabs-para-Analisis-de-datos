#ESMA 3016
#EAF/Octubre 2016
#Lab13: Distribucion Poisson 
#Ejemplo1: El numero de errores tipograficos en un libro tiene una distribucion Poisson con 
# un promedio de  4 paginas por pagina
#a) Cual es la probailidad de que una pagina cualquiera del libro hayan 2 errores
#b) CUal es la probailidad de que no haya mas de 5 errores en una pagina de libro
#c) Si se encuentran mas de 6 errroes en una pagina del libro, esta pagina debe reescribirse totalmente
#cual es la probabilidad de que esto ocurra
Sol:
dpois(1,4)
ppois(5,4)
1-ppois(6,4)
#Comparacion de la probabilidad teorica con la frecuencia relativa de 1000 valores simulados del 0 al 10
dpois(0:10,4)
table(rpois(1000,4))/1000
#Prueba experimental de que una binomial con n grande y p pequeno se aproxima a una Poisson con lambda=n*p
dbinom(60:80,1000,.073)
dpois(60:80,73)
#Haciendo una comparacion grafica
plot(0:150,dbinom(0:150,1000,.073),type="h",col="green")
points(0:150,dpois(0:150,73),type="l",col="red")
#Mostrando graficamente que la aproximacion no es tan buena si p es grande
plot(0:800,dbinom(0:800,1000,.6),type="h",col="green")
points(0:800,dpois(0:800,600),type="l",col="red")
Ejemplo2: Los clientes llegan a un restaurante a razon de 15 por hora. En una hora cualquiera
a)Cual es la probabilidad de que lleguen exactamente 10 clientes
b)Cual es la probabilidad de que lleguen no mas de 5 clientes?
c)Cual es la probabilidad de que lleguen por lo menos 8 clientes?
d)Cual es la probabilidad de que en las proximas 4 horas lleguen entre 40 y 70 clientes? 
#Solucion
dpois(10,15)
ppois(5,15)
1-ppois(7,15)
ppois(70,60)-ppois(39,60)

