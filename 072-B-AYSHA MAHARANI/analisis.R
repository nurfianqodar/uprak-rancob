
# Nama Lengkap  : AYSHA MAHARANI
# NPM           : 25500111107
# Kelas         : B

# ==================== Buat analisis anda dibawah ini ==================== #


if (!"pacman" %in% installed.packages())))  {
install.packages("pacman")
}
pacman::p_load(dplyr, tibble, agricolae, openxlsx)

df <- read.xlsx("Data.xlsx")

#ringkasan data

df |> str
df |> summary()

df <- df |>

  ) |>

mutate(
  faktor1 = as.factor(jarak_tanam)
  faktor2 = as.factor(jenis_tanah)
  ulangan = as.factor(ulangan)

model <- aov(kadar_kalium_daun ~ jarak_tanam * jenis_tanah + ulangan, data = df )
model <- summary()

faktor2 <- df$faktor2) |>
  unique()


for ( f in faktor2)
  dd <- df |>
    filter(faktor2 == f)
model <- aov(kadar_kalium_daun ~ jenis_tanam, data = dd)
dmrt <- duncan.test(model, trt = "jarak_tanam")
tabel <- dmrt$groups |>

