
# Nama Lengkap  :MUHAMAD RAMDANI
# NPM           :108
# Kelas         :B

# ==================== Buat analisis anda dibawah ini ==================== #


if (!("pacman" %in% installed.packages())) {installed.packages("pacman")}
library(dplyr)
library(tibble)
library(agricolae)
library(openxlsx)
df <- read.xlsx("KELAS_B_RAK.xlsx", sheet = KELO library(openxlsx)
model <- aov(panjang_akar ~ fakttor1 * faktor2,data = df
             )
df |> str()
df |> summary()
df |>
  is.na() |>
df <- df |>
  rename()
   faktor1 = konsetrasi_poc_kulit_nanas,
   faktor2 = dosis_kompos_daun_kering,



