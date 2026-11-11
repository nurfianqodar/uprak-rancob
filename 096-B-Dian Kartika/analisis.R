
# Nama Lengkap  :DIAN KARTIKA
# NPM           :255001111096
# Kelas         :B

# ==================== Buat analisis anda dibawah ini ==================== #

library(tidyverse)
library(agricolae)
library(openxlsx)

df <- read.xlsx("C:/Users/UNSIL/Desktop/uprak-rancob/096-B-Dian Kartika/data.xlsx", sheet = "data_pengamatan")

df <- df |>

  mutate(
    dosis_npk = as.factor(dosis_npk),
    varietas_tanaman = as.factor(varietas_tanaman)
    ulangan = as.factor(langan)
  )

model <- aov(
  berat_basah_tanaman ~ ulangan +
    dosis_npk *
    varietas_tanaman,
  data = df
)

summary(model)

##uji anova tiap faktor tanpa interaksi

dmrt <- duncan.test(model, trt = "dosis_npk")
dmrt$groups

dmrt <- duncan.test(model, trt = varietas_tanaman)
dmrt$groups

#' ##### uji 'faktor1' pada setiap 'faktor2'
#'
## -----------------------------------------------------------------------------
varietas_tanaman <- df$varietas_tanaman |>
  unique()

varietas_tanaman

#'
##------------------------------------------------------------------------------
for (f in varietas_tanaman) {
  dd <- df |>
    filter(varietas_tanaman == f)
  model <- aov(
    berat_basah_tanaman ~ ulangan + dosis_npk,
    data = dd
  )
dmrrt <- duncan.test(model, trt = dosis_npk)
tabel <- dmrt$groups |>
  as.data.frame() |>
  rownames_to_column("dosis_npk")

paste0("Faktor 1 pada ", f, "\n") |> cat(sep = "")

print(tabel)

cat("\n\n")
}


