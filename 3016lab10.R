#Esma 3016
#EAF/Sep 2016
#Lab10: Calculo de Probabilidades por simulacion
# el problema de los cumpleanos y la probabilidad 
#de ocurrencia de corridas usando simulacion
#Autor:EAF
#Factorial
factorial(6)
#Permutaciones
p12.3=factorial(12)/factorial(9)
#Combinaciones
choose(15,4)
#Problema de las cumpleanos. Cual es la probabilidad de que en un grupo
#de 25 personas por los menos dos de ellas cumplan anos el mismo dia.
#Haciendolo por complemento La solucion exacta es 1-p365.25/365^25=.5686.
#p1=1-factorial(365)/(factorial(340)*365^25) da Overflow
p1=prod(1-0:24/365)
print(1-p1)
#Haciendo la simulacion 10000
a1=rep(0,10000)
for( i in 1:10000){a=sample(1:365,25,replace=T)
a1[i]=25-length(unique(a))}
probdist=length(a1[a1==0])/10000
p1est=1-probdist
p1est
#Problema de las corridas.
#Cual es la probabilidad de que si estacionan 8 carros al azar
#en un estacionamiento donde hay 12 espacios, los 4 espacios
#vacios queden juntos?
#la contestacion exacta es .0181
#Consideremos como 1 si el espacio en el estacionamiento es ocupado
# y 0 si no es ocupado. Lo que queremos es  una secuencia como
#110000111111. La secuencia 10001111110 no se es deseada
#Simulando 10000 maneras de estacionarse
#Inicializando una matriz de 10,000 experimentos
m1=matrix(1,10000,12)
#Inicializando el vector de corridas
b=rep(99,10000)
for(i in 1:10000)
{#eligiendo los 4 espacios libres
m1[i,sample(1:12,4)]=0
a=rle(m1[i,])
#Hallando las corridas de CERO que son de tamano 4
if(any (a$lengths==4)) {b[i]=min(a$values[a$lengths==4])
}
}
probest=length(b[b==0])/10000
print(probest)