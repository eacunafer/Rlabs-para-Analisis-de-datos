#Lab5: ESMA3016
#Autor:Edgar Acuna
#Enero 2017
#Calculo de medidas estadisticas de centralidad y de variabilidad
#****************************************************************
#Leyendo los datos clase97.txt
datos=read.table("http://academic.uprm.edu/eacuna/clase97.txt",na.strings="*",header=T)
attach(datos)
#Calculo de la Media
mean(edad)
mean(gpa)
#Media cuando hay missing values
mean(creditos,na.rm=T)
#Caluclo de la Mediana
median(edad)
median(gpa)
#Mediana cuando hay missing values
median(creditos,na.rm=T)
#Calculo de la Moda
#Construyendo primero una funcion para calcular la moda
moda=function(x,na.rm=FALSE)
{
#Funcion que encuentra la moda de un vector x

if(na.rm){x=x[!is.na(x)]}
else if(any(is.na(x)))return(x[FALSE][NA])
  m1=sort(table(x),decreasing=T)
  moda=names(m1[m1==m1[1]])
if(is.numeric(x)) {return(as.numeric(moda))}
else {return(moda)}
}
#Calculando la moda de la variable Edad
moda(edad)
#Calculo de la moda para una variable con missing values
moda(creditos)
moda(creditos,na.rm=T)
#Calculo de la moda para datos categoricos
moda(programa)
#la media podada(Trimmed mean)
#Calculo de la media podada del 10% para edad
mean(edad, tr=.10)
#Calculo de la media podada del 5% para creditos
mean(creditos, na.rm=T,tr=.05)
#Medidas estadisticas de Dispersion
#a)Rango o amplitud
rango=max(edad)-min(edad)
print(rango)
#b)La Varianza
var(edad)
#c) La desviacion estandar
sd(edad)
#Criterio para outliers
lower=mean(edad)-3*sd(edad)
upper=mean(edad)+3*sd(edad)
cat("\nEl intervalo es:\n")
cat("\n",lower,"-",upper)
#Calculo del coeficiente de Variacion CV=s*100%/|x|
cv.edad=sd(edad)*100/abs(mean(edad))
print(cv.edad)

