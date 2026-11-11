
# Nama Lengkap  : NAILA MARDHIYANA
# NPM           : 255001111022
# Kelas         : E

# ==================== Buat analisis anda dibawah ini ==================== #

pacman::p_load(agricolae, dplyr, openxlsx)

#Input Data
data <- read.xlsx("data.xlsx")
summary(data)
str(data)

dat <- data |>
rename(
  f1 = dosis_kompos,
  f2 = media_tanam,
  ulangan = ulangan
) |>
  mutate(
    f1 = as.factor(f1),
    f2 = as.factor(f2),
    ulangan = as.factor(ulangan)
  )

dat <- aov(diameter_batang ~ f1*f2 + ulangan, data = dat)
summary(dat)

#Uji Lanjut
dmrt <- duncan.test(dat, trt = c("f1", "f2"))
dmrt_f1 <- duncan.test(dat, trt = "f1")
dmrt_f1$groups

dmrt_f2 <- duncan.test(dat, trt = "f2")
dmrt_f2$groups
