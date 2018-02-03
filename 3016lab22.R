#ESMA 3016
#EAF/Diciembre 2014
#Lab22: Comparando la media de dos grupos
#usando la prueba de t
#NOTA: Comparacion de notas de varones y mujeres
#Primera manera de entrar los datos 
notas.f=c(50,75,80,68,95,84,78,87)
notas.m=c(56,61,75,89,80,70,83)
t.test(notas.f,notas.m)
#Segundo manera de entrar los datos
#Comparacion grafica con boxplots
notas=c(50,75,80,68,95,84,78,87,56,61,75,89,80,70,83)
genero=c(rep("f",8),rep("m",7))
boxplot(notas~genero)
#Comparacion con una  prueba aproximada de t, asumiendo varianzas #poblacionales distintas
t.test(notas~genero)
#Comparacion con la prueba exacta de t con n+m-2 grados de libertad, #asumiendo varianzas poblacionales iguales
t.test(notas~genero, var.equal=TRUE)
#Probando igualdad de varianzas de grupos usando la prueba de F
var.test(notas.f,notas.m)
#P-value menor que .05 rechaza la hipotesos de igualdad de varianzas
#
#pruebas pareadas de t
#No se quiere que la unidad experimental afecte al tratamiento
notas.before=c(80,70,65,49,85,56,73)
notas.after=c(83,78,66,59,83,65,71)
t.test(notas.before,notas.after,alternative="less",paired=TRUE)
#P-value  menor de .05 rechza la hipotesis nula y se concluye que el #metodo es efectivo

 
