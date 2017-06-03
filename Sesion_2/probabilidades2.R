# Ejercicios destorn
library(combinat)
library(prob)

E <- expand.grid(A = c('Largo','COrto'),B=c('Plana','Estrella'))
Cant <- c(40,60,15,20)
E <- data.frame(E,cant)
E <- probspace(E)
for(i in  1:4){E$probs[i] = E$cant[i]/sum(E$cant)   }
Largo <- subset(E,A =='Largo')
Corto <- subset(E,A =='Corto')
Estrella <- subset(E,B =='Estrella')
Plana <- subset(E,B =='Plana')

cat('Probabilidad de que se Largo: ',Prob(Largo),'\n')
cat('Probabilidad de que se Corto: ',Prob(Corto),'\n')
cat('Probabilidad de que se Plana: ',Prob(Plana),'\n')
cat('Probabilidad de que se Estrella: ',Prob(Estrella),'\n')

cat('Probabilidad de que se Largo y Plano : ',Prob(intersect(Largo,Plana)),'\n')

cat('Probabilidad de que se Largo y Estrella : ',Prob(intersect(Largo,Estrella)),'\n')

cat('Probabilidad de que se Largo o Plano : ',Prob(union(Largo,Plana)),'\n')

cat('Probabilidad de que se Largo o estrella : ',Prob(union(Largo,Estrella)),'\n')

#inferencias

cat('Probabilidad de que se Largo cunado se dio plana : ',Prob(Largo,given = Largo),'\n')

