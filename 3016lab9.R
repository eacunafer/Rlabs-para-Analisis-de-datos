#Esma 3016
#Lab9: Calculo de Probabilidades usando simulacion
#Autor:EAF/Sep 2016
#Prob1. Juan y Luis toman un acensor en el estacionamiento de
#un edificio que tiene 6 pisos. Si ellos se bajan al azar en alguno
# de los pisos (el del estacionamiento es piso CERO),.
#Estimar la probabilidad de que ellos se bajen en pisos distintos. 
#La solucion exacta es  5/6=.8333
#Simulando 1000 veces los pisos escogidos por Juan
j1=sample(1:6,1000,replace=T)
#simulando 1000 veces los pisos escogidos por Luis
l1=sample(1:6,1000,replace=T)
#Hallando la frecuencia relativa de que Juan y Lis se bajen en pisos distintos
evento=(1:1000)[j1!=l1]
probest=length(evento)/1000
#Haciendo una funcion para estimar la pronbabilidad simulando una numerico generico de veces
prob1=function(k){evento=(1:k)[sample(1:6,k,replace=T)!=sample(1:6,k,replace=T)]
probest=length(evento)/k
return(probest)}
#Prob. Se extraen tres bolas con REEMPLAZO de una caja que tiene 10 bolas numeradas del 1 al 10
#Cual es la probabilidad de que el mayor de los tres numeros extraidos sea 6.
#La contestacion exacta es .091.
#simulando la primera bola extraida en 1000 intentos
b1=sample(1:10,1000,replace=T)
#simulando la segunda bola extraida en 1000 intentos
b2=sample(1:10,1000,replace=T)
#simulando la tercera  bola extraida en 1000 intentos
b3=sample(1:10,1000,replace=T)
#Formando la tripleta de bolas extraidas
m1=cbind(b1,b2,b3)
#Hallando el mayor de los 3 numeros extraidos en cada uno de los 10000 intentos
max1=apply(m1,1,max)
#Hallando la tabla de frecuencias
table(max1)
#Hallando la frecuencia relativa de 6
a=table(max1)/1000
dimnames(a)=NULL
#la probabilidad estimada es 
probest=a[6]
#Haciendo una funcion para estimar la probabilidad con diferente numero de intentos
prob2=function(k){
b1=sample(1:10,k,replace=T)
b2=sample(1:10,k,replace=T)
b3=sample(1:10,k,replace=T)
m2=cbind(b1,b2,b3)
max2=apply(m2,1,max)
a=table(max2)
dimnames(a)=NULL
probest=a[6]/k
return(probest)
}




