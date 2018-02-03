#Esma 3016, lab1
#Edgar Acuna
#Enero 2017
#Leyendo datos de la internet, las columnas tienen nombres
datos=read.table("http://academic.uprm.edu/eacuna/clase97.txt",header=T)
#Viendo las seis primera fila de la tabla de datos
head(datos)
#Viendo las seis ultimas filas de la tabla de datos
tail(datos)
#Determinado la dimension de la tabla.
#El primer valor indica el numero de filas y el segundo el numero de columnas
dim(datos)
#Leyendo datos en Excel, guardados en formato csv
#Hay un comando read.xlsx para leer datos de Excel sheets pero hay que bajar la libreria xlsx
read.csv("http://academic.uprm.edu/eacuna/arbolejemplo.csv",sep=",",header=T)
#adjuntando las variables del conjunto datos al espacio de trabajo
attach(datos)
#Determinando las frecuencias absolutas de la variable edad
frec.abs=table(edad) 
print(frec.abs)
#Determinando las frecuencias relativas porcentuales de la variable edad
frec.relat=frec.abs*100/dim(datos)[1] 
print(frec.relat)
#Determinando las frecuencias absolutas acumuladas de la variable edad
frec.abs.acum=cumsum(frec.abs) 
print(frec.abs.acum)




