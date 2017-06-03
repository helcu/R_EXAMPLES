S <- expand.grid(D1 =c(1,2,3,4,5,6), D2=c(1,2,3,4,5,6))
S
S <- probspace(S)
S
A <- subset(S,D1==D2)
B<- subset(S,(D1+D2)>8)
prob(A)
 0.277777
 Prob(A,given =B)
0.2
Prob(B,given = A)
 0.3333333
Prob(union(A,B))
0.3888889
 Prob(intersect(A,B))
 0.05555556
>Prob(setdiff(A,B))
 0.1111111                          