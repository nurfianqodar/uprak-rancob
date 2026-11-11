
# Nama Lengkap  : M. FADHIL HADZIQ MUFIDA
# NPM           : 255001111013
# Kelas         : C (Agro)

# ==================== Buat analisis anda dibawah ini ==================== #


if (!("pacman" %in% installed.packages())) {
  install.packages("pacman")
}
pacman::p_load(agricolae, openxlsx, dplyr, tibble)

df <- read.xlsx("data.xlsx", sheet=1)

str(df)
summary(df)
view(df)

df<-df|>
  data(
    faktor1 = kedalaman_tanam,
    faktor2= jenis_herbisida,
    ulangan=ulangan
  ) |>
  mutate(
    faktor1 = as.factor(faktor1),
    faktor2 = as.factor(factor2),
    ulangan = as.factor(ulangan)
  )


df |> summary()
df |> str ()

model <- aov(kedalaman_tanam ~ faktor1 * faktor2 + ulangan, data = df)

model > summary()
