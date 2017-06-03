library(prob)
setwd('E:/R/Sesion_4')
Alimentacion <- data.frame(Alimentacion=c('equilibrada','noequilibrada'),probs=c(0,4,0,6))
Deporte <- data.frame(Deporte = c('Si','No'),probs=c(0,1,0,9))
Fumador <- data.frame(Fumador = c('Si','NO'), probs=c(0,4,0,6)) 

presion <- expand.grid(Alimentacion=c('equilibrada','noequilibrada'), Deporte=c('Si','No'), presion=c('Alta','Normal'))

Datos <- read.table(file='Datos1.txt')

presion <- data.frame(presion,Datos)
presion <- probspace(presion)

for(i in 1:8){
  
  presion$probs[i] = presion$V1[i]/sum(presion$V1)
}

Infarto <- expand.grid(presion=c('Alta','Normal'), Fumador=c('Si','No'))

Datos <- read.table(file='Datos2.txt')

Infarto <- data.frame(Infarto,Datos)
Infarto <- probspace(Infarto)
for(i in 1:8){
  
  Infarto$probs[i] = Infarto$V1[i]/sum(Infarto$V1)
}

Inferencial <- Prob(Infarto,Infarto== 'Si',given = Fumador=='Si' & presion=='Alta')


