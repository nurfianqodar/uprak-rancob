
# Nama Lengkap  : FIRDA NUR FAUZIAH
# NPM           : 25500111108
# Kelas         : C

# ==================== Buat analisis anda dibawah ini ==================== #

pacman::p_load(dplyr, agricolae, openxlsx)

#imput data
firda <- read.xlsx("data.xlsx")
#Tinjauan data
summary(firda)
str (firda)
#Merubah tipe data
firda1 <- firda |>
  mutate (
    f1=interval_pemupukan,
    f2=tipe_greenhouse,
    ulangan=ulangan
  )|>
  mutate (
    f1 = as.factor(f1),
    f2 = as.factor(f2),
    ulangan = as.factor(ulangan)
  )

#ANOVA
firda <- aov (panjang_akar ~ f1*f2 + ulangan, data = firda1)
summary(firda)

#Uji lanjut
#dmrt <- duncan.test(firda,trt = c ("f1","f2"))
dmrt_f1 <- duncan.test(firda,trt ="f1")
dmrt_f1$groups

dmrt_f2 <- duncan.test(firda,trt ="f2")
dmrt_f2$groups

dmrt_interaksi <- duncan.test(firda,trt = c ("f1","f2"))
dmrt_interaksi$groups


