
# Nama Lengkap  :AUDRA AFDHAL ALDYANSYAH
# NPM           :255001111071
# Kelas         :E

# ==================== Buat analisis anda dibawah ini ==================== #

install.packages("pacman")

pacman::p_load(tidyverse,agricolae,openxlsx)

library(tidyverse,agricolae,openxlsx)

al <- read.xlsx("data.xlsx")
al |> str()
al |> summary()
al <- al |>
  mutate(
    intensitas_cahaya = as.factor(intensitas_cahaya),
    jenis_benih = as.factor(jenis_benih),
    ulangan = as.factor(ulangan)
  )
aud <- aov (serapan_kalium ~ intensitas_cahaya * jenis_benih + ulangan,data = al)

aud |> summary()

epan <- duncan.test(aud , trt = "intensitas_cahaya")

epan$groups

epan <- duncan.test(aud , trt = "jenis_benih")

epan$groups
