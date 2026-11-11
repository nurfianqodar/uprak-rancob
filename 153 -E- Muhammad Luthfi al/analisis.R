
# Nama Lengkap  :MUHAMMAD LUTHFI ALGHAZALI
# NPM           :255001111153
# Kelas         :E

# ==================== Buat analisis anda dibawah ini ==================== #
if (! ("pacman" %in% intalled.packages())) {
  install.packages("pacman")
}
pacman ::p_load (dplyr, agricolae, openxlsx)
df <- read.xlsx("data.xlsx", sheet = "ral_jagung")
df |> str()
df |> summary()
df <- df |>
  rename(
    faktor1 = f1,
    faktor2 = f2,
    ulangan = rep
  ) |>
  mutate(
    faktor1 = as.factor (faktor1).
    faktor2 = as.factor (faktor2).
    ulangan = as.factor (ulangan).
  )
df |> str()
df |> summary()
model <- aov(mutate~faktor1= faktor2 + ulangan, data = df)
model <- summary()
faktor1 <- df faktor1 |>
  unique()
