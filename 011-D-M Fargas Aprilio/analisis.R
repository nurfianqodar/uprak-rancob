
# NAMA LENGKAP  :M FARGAS APRILIO
# NPM           :255001111011
# Kelas         :D

# ==================== Buat analisis anda dibawah ini ==================== #
if (! ("pacman"%in% installed.packages())) {
}
pacman ::p_load (dplyr, agricolae, openxlsx)
df <- read.xlsx("data.xlsx")
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
    faktor2 = as.factor (factor2),
    ulangan = as.factor (ulangan),
  )
df |> str()
df |> summary()
model <- aov(kedalaman_tanam~faktor1* faktor2 + ulangan, data =df)
model |> summary()
faktor2 <- unique (df $ faktor2)

for(f in faktor2) {
  dd <- aov (kedalaman_tanam ~ faktor1 + ulangan, data = dd)
}


