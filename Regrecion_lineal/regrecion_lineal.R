altura <- rnorm(30,165,8)
peso <- rnorm(30,60,5)
plot(peso,altura)
cor(peso,altura)

grasas <- read.table("datos.txt",header = TRUE)
pairs(grasas)
cor(grasas$edad,grasas$grasas)
rs <- lm(grasas ~ edad,data=grasas)
modelo <- rs$coefficients[1]
modelo
modelo <- rs$coefficients[1]+ rs$coefficients[2]*(32)
modelo 