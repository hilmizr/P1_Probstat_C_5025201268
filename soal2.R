# No.2

# a. 
n = 4
size = 20
prob = 0.2
dbinom(n, size, prob)

# b. 
success <- 1:20

plot(success,dbinom(success,size=20,prob),
     type='h',
     main='Distribusi Binomial (n=20, p=0.2)',
     ylab='Probabilitas',
     xlab ='# Kesembuhan',
     lwd=3)

# c. 
n = 20
p = 0.2
q = 1 - p
variance = n*p*q
mean = n*p
print(variance)
print(mean)

