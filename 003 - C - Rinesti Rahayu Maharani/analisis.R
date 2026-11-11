
# Nama Lengkap  : RINESTI RAHAYU MAHARANI
# NPM           : 255001111003
# Kelas         : C

# ==================== Buat analisis anda dibawah ini ==================== #


if (!("pacman"%in%installed.packages())) {
  install.packages("pacman")

  install.packages()
  }
pacman ::p_load (dplyr, agricolae, openxlsx)
df <- read.xlsx("data.xlsx, sheet = data.xlsx)
df |> str()

df |> summary()
df <- df |>
rename(
  faktor1 = f1,
  faktor2 = f2,
  ulangan = rep
) |>
  mutate(
    faktor1 = as.factor (faktor1),
    faktor2 = as.factor (faktor2),
    ulangan = as.factor (ulangan),
  )
df |> str()
df |> summary()
model <- aov(volume_air~faktor1* faktor2 + ulangan, data = df)
model |> summary()
faktor2 <- unique (df )



