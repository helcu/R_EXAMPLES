#
# Inteligencia Artificial - Trabajo 2
#
# Cutipa Arias, Helmut E.     (u201411510)
# Kina Kina, Ken M.           (u201414627)


#install.packages("combinat")
#install.packages("prob")

library(combinat)
library(prob)

E <- expand.grid(A=c('Soleado','NoSoleado'),
                 B=c('Nublado','NoNublado'),
                 C=c('Niebloso','NoNiebloso'),
                 D=c('Llueve','NoLlueve'))

# Se toma de muestra el clima de 500 dias
Dias = c(3,18,4,59,7,74,26,15,25,41,17,48,25,32,57,49)

E <- data.frame(E, Dias)
E <- probspace(E)

for(i in 1:length(E$Dias)) { 
  E$probs[i] = E$Dias[i]/sum(E$Dias) 
}

Soleado = subset(E, A =='Soleado')
NoSoleado = subset(E, A=='NoSoleado')
Nublado = subset(E, B=='Nublado')
NoNublado = subset(E, B=='NoNublado')
Niebloso = subset(E, C =='Niebloso')
NoNiebloso = subset(E, C=='NoNiebloso')
Llueve = subset(E, D=='Llueve')
NoLlueve = subset(E, D=='NoLlueve')


cat("A PRIORI \n")

ProbCustom <- function(X) {
  cat("Prob ",deparse(substitute(X)),": ", Prob(X), " \n")
}

ProbCustom(Soleado)
ProbCustom(NoSoleado)
ProbCustom(Nublado)
ProbCustom(NoNublado)
ProbCustom(Niebloso)
ProbCustom(NoNiebloso)
ProbCustom(Llueve)
ProbCustom(NoLlueve)
cat("\n")


cat("Prob Soleado y Nublado: ", Prob(intersect(Soleado, Nublado)), " \n")
cat("Prob Soleado y NoNublado: ", Prob(intersect(Soleado, NoNublado)), " \n")
cat("Prob Soleado o Nublado: ", Prob(union(Soleado, Nublado)), " \n")
cat("Prob Soleado o NoNublado: ", Prob(union(Soleado, NoNublado)), " \n")
cat("Prob Soleado, Nublado y Niebloso: ", Prob(intersect(Soleado, Nublado, Niebloso)), " \n")
cat("Prob NoSoleado, NoNublado y NoNiebloso: ", Prob(intersect(NoSoleado, NoNublado, NoNiebloso)), " \n")

# ...



cat("\n")

cat("A POSTERIORI \n")
ProbXGivenY<-function(X, Y) {
  cat("Prob ",deparse(substitute(X))," dado ",deparse(substitute(Y)),": ", Prob(X, given=Y), " \n")
}

ProbXGivenY(Soleado, Nublado)
ProbXGivenY(Soleado, NoNublado)
ProbXGivenY(NoSoleado, Nublado)
ProbXGivenY(NoSoleado, NoNublado)
ProbXGivenY(Nublado, Soleado)
ProbXGivenY(Nublado, NoSoleado)
ProbXGivenY(NoNublado, Soleado)
ProbXGivenY(NoNublado, NoSoleado)

# ...


cat("\n")


cat("DEPENDENCIA: \n")


Dependencia<-function(X, Y) {
  if(Prob(X, given=Y) == Prob(X)) {
    cat(deparse(substitute(X)), "/", deparse(substitute(Y)), " son independientes \n")
  } else {
    cat(deparse(substitute(X)), "/", deparse(substitute(Y)), " son dependientes \n")
  }
}

Dependencia(Soleado, Nublado)
Dependencia(Soleado, Niebloso)
Dependencia(Soleado, Llueve)


print(E)
