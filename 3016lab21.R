#ESMA 3016
#EAF/Noviembre 2014
#Lab21: Intervalos confianza y prueba de hipotesis para proporciones
#NOTA: Para R el exito es el primer valor en orden alfabetico
#NOTA: en este ejemplo el exito es CESAREA
partos=c("cesarea","normal","cesarea","normal","normal","normal","normal","cesarea","normal","cesarea","normal","cesarea","normal","normal","normal","normal","normal","cesarea","normal","normal","cesarea","normal","normal","cesarea","normal")
table(partos)
n=length(partos)
proporciones=table(partos)/n
#Intervalo de confianza aproximado del 100(1-alfa)% para la proporcion 
#lower=phat-z(alfa/2)*sqrt(phat*(1-phat)/n)
#upper=phat+z(alfa/2)*sqrt(phat*(1-phat)/n)
#z(alfa.2) es un  valor tal que el area a la derecha de dicho valor sea alfa medio
phat=proporciones[1]
lower=phat+qnorm(.025)*sqrt(phat*(1-phat)/n)
upper=phat+qnorm(.975)*sqrt(phat*(1-phat)/n)
cat("El intervalo de confianza es",lower,"-",upper,"\n")
#R tambien da el intervalo de confianza pero usando un factor de correccion debido a Yates
prop.test(table(partos),p=.25,alternative="two.sided",conf.level=.95)
#Prueba de hipotesis es zimplemente mirando el pvalue
#Tambien hay una prueba exacta binom.test
binom.test(table(datos),p=.25,alternative="two.sided",conf.level=.95)
