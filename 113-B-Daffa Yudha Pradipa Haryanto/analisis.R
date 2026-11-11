
# Nama Lengkap  : DAFFA YUDHA PRADIPA HARYANTO
# NPM           : 255001111113
# Kelas         : B

# ==================== Buat analisis anda dibawah ini ==================== #
if (!("pacman" %in% installed.packages())){
  install.packages("pacman")
}
pacman::p_load(dplyr, tibble, agricolae, openxlsx)
df <- read.xlsx ("data.xlsx", sheet = "data_pengamatan")

df |> str()
df |> summary()

df <- df |>
  rename(
    faktor1 = konsentrasi_nutrisi,
    faktor2 = jenis_pupuk,
    ulangan = ulangan
  )
df |> str()

df |>summary()

model <- aov (kadar_air_daun ~ faktor1 * faktor2 + ulangan, data = df)

model |> summary()

faktor2 <- df$faktor2 |>

  unique ()

faktor2

for ( f in faktor2) {
  dd <- df |>
    filter (faktor2 == f)
model <- aov (kadar_air_daun ~ faktor1, data =dd)
dmrt <- duncan.test (model, trt = "faktor1")
tabel <- dmrt$groups |>
  as.data.frame () |>
rownames_to_column("faktor 1")

paste0 ("faktor 1 pada ",f,"|n") |> cat(sep="")

print(tabel)

cat ("\n\n")
}
faktor1 <- df$faktor1 |>

  unique ()

faktor1

for ( f in faktor1) {
  dd <- df |>
    filter (faktor1 == f)
  model <- aov (kadar_air_daun ~ faktor2, data =dd)
  dmrt <- duncan.test (model, trt = "faktor2")
  tabel <- dmrt$groups |>
    as.data.frame () |>
    rownames_to_column("faktor 2")

  paste0 ("faktor 2 pada ",f,"|n") |> cat(sep="")

  print(tabel)

  cat ("\n\n")
}
