## Nama NRP
| Nama                    | NRP        |
|-------------------------|------------|
| Hilmi Zharfan Rachmadi  | 5025201268 |

## Soal 1
>Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya.

- a. Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi sebelum keberhasilan pertama ketika p = 0.20 dari populasi menghadiri acara vaksinasi? (distribusi Geometrik)
``` R
# a.
p = 0.20
x = 3
dgeom(x, p)
```

- b. Mean distribusi Geometrik dengan 10000 data random, prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 (distribusi Geometrik acak () == 3)
``` R
# b.
mean(rgeom(n = 10000, p) == 3)
```

- c. Bandingkan hasil poin a dan b, apa kesimpulan yang bisa didapatkan?

    Nilai keduanya berdekatan. Bedanya nilai dari a konstan, sedangkan nilai dari b berubah-ubah

- d. Histogram distribusi Geometrik, dengan peluang X = 3 gagal sebelum sukses pertama
``` R
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
```
![1d](https://github.com/hilmizr/P1_Probstat_C_5025201268/blob/73bcc175f0cf7995f0082effbe5a0f83c013df54/ss/soal1/1d.png)

- e. Nilai rataan (μ) dan varian (σ²) dari distribusi Geometrik
``` R
# e.
p = 0.20
a = 1-p
mean = a/p
print(mean)

b = p^2
variance = a/b
print(variance)
```
## Referensi Soal 1
- https://rpubs.com/mpfoley73/458721
- https://stat.ethz.ch/R-manual/R-devel/library/stats/html/Geometric.html
- https://search.r-project.org/CRAN/refmans/distributional/html/dist_geometric.html
- https://www.w3schools.com/r/r_comments.asp#:~:text=Comments%20can%20be%20used%20to,ignore%20anything%20that%20starts%20with%20%23%20.
- https://www.geeksforgeeks.org/logarithmic-and-power-functions-in-r-programming/

</br>

## Soal 2
> Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :

- a. Peluang terdapat 4 pasien yang sembuh
``` R
# a. 
n = 4
size = 20
prob = 0.2
dbinom(n, size, prob)
```

- b. Gambarkan grafik histogram berdasarkan kasus tersebut
``` R
# b. 
success <- 1:20

plot(success,dbinom(success,size=20,prob),
     type='h',
     main='Distribusi Binomial (n=20, p=0.2)',
     ylab='Probabilitas',
     xlab ='# Kesembuhan',
     lwd=3)
```
![2b](https://github.com/hilmizr/P1_Probstat_C_5025201268/blob/73bcc175f0cf7995f0082effbe5a0f83c013df54/ss/soal2/2b.png)

- c. Nilai rataan (μ) dan varian (σ²) dari distribusi Binomial
``` R
# c. 
n = 20
p = 0.2
q = 1 - p
variance = n*p*q
mean = n*p
print(variance)
print(mean)
```

## Referensi Soal 2
- http://www.r-tutor.com/elementary-statistics/probability-distributions/binomial-distribution
- https://www.tutorialspoint.com/r/r_binomial_distribution.htm
- https://www.cuemath.com/data/variance-of-binomial-distribution/
- https://www.investopedia.com/terms/b/binomialdistribution.asp#:~:text=The%20expected%20value%2C%20or%20mean,or%20(100%20*%200.5).
- https://www.statology.org/plot-binomial-distribution-r/

</br>

## Soal 3
> Diketahui data dari sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)
- a. Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
``` R
# a.
lambda=4.5
dpois(6, lambda)
```

- b. Simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini selama setahun (n = 365)
``` R
# b.
library(ggplot2)
success <- 1:365
data = data.frame(y=c(dpois(6, lambda)), x=c(success))
barplot(data$y, names.arg=data$x, ylab="Peluang Kelahiran", xlab="Hari", ylim=0:1)
```
![3b](https://github.com/hilmizr/P1_Probstat_C_5025201268/blob/73bcc175f0cf7995f0082effbe5a0f83c013df54/ss/soal3/3b.png)

- c. Bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan

    Nilai distribusi poisson konstan sama dengan nilai a

- d. Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.
``` R
# d.
mean = variance = lambda
print(mean)
print(variance)
```
## Referensi Soal 3
- https://www.programmingr.com/examples/neat-tricks/sample-r-function/rpois-poisson-distribution/
- https://www.rumusstatistik.com/2012/07/rumus-distribusi-poisson.html
- https://rpubs.com/mpfoley73/456645

</br>
