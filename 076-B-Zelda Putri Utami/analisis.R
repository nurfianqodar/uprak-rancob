
# Nama Lengkap  : ZELDA PUTRI UTAMI
# NPM           : 255001111076
# Kelas         : B

# ==================== Buat analisis anda dibawah ini ==================== #

if(!("pacman" %in% installed.packages())){
  install.packages("pacman")
}

pacman::p_load(dplyr, tibble, agricolae, openxlsx)

df <- read.xlsx ("data.xlsx" , sheet = "data_pengamatan")

df <- df |>
  rename(
    faktor1 = dosis_pupuk,
    faktor2 = sistem_budidaya,
    ulangan = ulangan
  ) |>
  mutate(
    faktor1 = as.factor(faktor1),
    faktor2 = as.factor(faktor2),
    ulangan = ulangan
  )
df |> str()
df |> summary()

model <- aov (kadar_kalium_daun ~ faktor1 * faktor2 + ulangan, data = df)
model |> summary()

faktor2 <- df$faktor2 |>
  unique()
for (f in faktor 2) {
  dd <- df |>
    filter (faktor2 == f)
  model <- aov (kadar_kalium_daun ~ faktor1, data = dd)
  dmrt <- duncan.test(modl, trt = "faktor1")

  paste0("faktor 1 pada" f, "/n") |> cat(sep = "")
  print(tabel)
  cat("/n/n")
}

for (f  in faktor2) {
  dd = df |>
    filter (faktor == f)
  model <- aov (kadar-kalium-daun ~ faktor2, data = dd)
  dmrt <- duncan.test(modl, trt = "faktor2")

}
