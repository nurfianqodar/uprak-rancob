
# Nama Lengkap  :NISRINA MUHARRAM
# NPM           :255001111021
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #
if(!("pacman"%in% installed.packages())){
  install.packages("pacman")
}
pacman::p_load(dplyr, agricolae, openxlsx)
df <- read.xlsx("data.xlsx", sheet = "analisis.R")
df |>str()
df |>summary()
df <- df |>
  rename(
    faktor1 = f1,
    faktor2 = f2,
    ulangan = rep
     )|>
  mutate(
    faktor1 = as.factor (faktor1),
    faktor2 = as.factor (faktor2),
    ulangan = as.faactor (ulangan),
  )
df |> summary()
model <- aov()
  )

