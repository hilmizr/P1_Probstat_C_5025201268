# No.1

# a.
p = 0.20
x = 3
dgeom(x, p)

# b.
mean(rgeom(n = 10000, p) == 3)

# c.
# Nilai keduanya berdekatan. Bedanya nilai dari a konstan, sedangkan nilai dari b berubah-ubah

# d. 
library(dplyr)
library(ggplot2)
n = 3

data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = p)) %>%
  mutate(Failures = ifelse(x == n, n, "other")) %>%
ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Peluang X = 3 gagal Sebelum Sukses Pertama",
       subtitle = "Geometrik(0.2)",
       x = "Kegagalan sebelum sukses pertama (x)",
       y = "Probabilitas") 

# e.
p = 0.20
a = 1-p
mean = a/p
print(mean)

b = p^2
variance = a/b
print(variance)
