# No.3

# a.
lambda=4.5
dpois(6, lambda)

# b.
library(ggplot2)
success <- 1:365
data = data.frame(y=c(dpois(6, lambda)), x=c(success))
barplot(data$y, names.arg=data$x, ylab="Peluang Kelahiran", xlab="Hari", ylim=0:1)

# c.
# Nilai distribusi poisson konstan sama dengan nilai a

# d.
mean = variance = lambda
print(mean)
print(variance)

