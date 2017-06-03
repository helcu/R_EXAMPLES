#PROGRAMA IMNFERERNCIAS FARMACOS

library(prob)
x <- c('L','L','A','A','T','T')
y <- c('D','N','D','N','D','N')

E <- data.frame(x,y)

E <- probspace(E)

E$probs[1] = 0.05*0.45
E$probs[2] = 0.95*0.45
E$probs[3] = 0.03*0.30
E$probs[4] = 0.97*0.30
E$probs[5] = 0.04*0.25
E$probs[6] = 0.96*0.25
L <- subset(E,x=='L')
A <- subset(E,x=='A')
T <- subset(E,x=='T')

D <- subset(E,y=='D')
N <- subset(E,y=='N')

print('Espacion muestral \n')
print(E)
print('Productos lima \n')
print(L)

print('Productos arequipa \n')
print(A)

print('Productos Trujillo \n')
print(T)

#RESULT

cat('Probabilidad de Lima',Prob(L),'\n')
cat('Probabilidad de Arequipa',Prob(A),'\n')
cat('Probabilidad de Trujillo',Prob(T),'\n')

cat('Probabilidad de Defectuosos',Prob(D),'\n')
cat('Probabilidad defectuosos dado lima',Prob(D,given = L),'\n')
cat('Probabilidad de defecutoso dado Arequipa',Prob(D, given=A),'\n')
cat('Probabilidad de defecutoso dado Trujillo',Prob(D, given=T),'\n')


cat('Probabilidad de No Defectuosos',Prob(N),'\n')
cat('Probabilidad No defectuosos dado lima',Prob(N,given = L),'\n')
cat('Probabilidad de No defecutoso dado Arequipa',Prob(N, given=A),'\n')
cat('Probabilidad de No  defecutoso dado Trujillo',Prob(D, given=T),'\n')



cat('Probabilidad de Lima dado defectuoso',Prob(L, given=D),'\n')
cat('Probabilidad de Arequipa dado defectuoso',Prob(A, given=D),'\n')
cat('Probabilidad de Trujillo dado defectuoso',Prob(T, given=D),'\n')


cat('Probabilidad de Lima dado no defectuoso',Prob(L, given=N),'\n')
cat('Probabilidad de Arequipa dado no  defectuoso',Prob(A, given=N),'\n')
cat('Probabilidad de Trujillo dado no defectuoso',Prob(T, given=N),'\n')
