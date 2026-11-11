
# Nama Lengkap  :MUHAMAD pARAS nAOVAL
# NPM           :255001111101
# Kelas         :B

# ==================== Buat analisis anda dibawah ini ==================== #
if(!("pacman" %in% installed.packages())) {
  install.packages("pacman")
}
pacman::p_load(dplyr, tibble, agricolae, openxlsx)

df <- read.xlsx("data.xlsx", sheet = "data_pengamatan")
library(openxlsx)

df <- df |>
  rename(
    faktor1 = intensitas_cahaya,
    faktor2 = tekstur_tanah,
    ulangan = ulangan
  ) |>
  mutate(
    faktor1 = as.factor(faktor1),
    faktor2 = as.factor(faktor2),
    ulangan = ulangan(ulangan)
  )
df
