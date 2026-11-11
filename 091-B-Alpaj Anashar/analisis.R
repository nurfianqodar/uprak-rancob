
# Nama Lengkap  :ALPAJ ANASHAR
# NPM           :255001111091
# Kelas         :B

# ==================== Buat analisis anda dibawah ini ==================== #
if (!("pacman" %in% installed.packages())) {
  install.packages("pacman")
}
pacman::p_load(dplyr, tibble, agricolae, openxlsx)
df <- read.xlsx("data.xlsx", sheet= "data_pengamatan")
df |> str()
df |> summary()
df <- df |>
  rename(
    faktor1 = jarak_tanam,
    faktor2 = jenis_insektisida,
    ulangan = ulangan
  )|>
mutate(
  faktor1 = as.factor(faktor1),
  faktor2 = as.factor (faktor2),
  ulangan = ulangan
)
df|> str()
df|> summary()
model |> aov (panjang_akar ~ faktor1 * faktor2 + ulangan, data =df)
model |
