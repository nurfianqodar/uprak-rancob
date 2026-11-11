
# Nama Lengkap  : AQSYA MAULANA WAHYUDI PUTRA
# NPM           : 255001111141
# Kelas         : B

# ==================== Buat analisis anda dibawah ini ==================== #
if (!("pacman" %in% installed.packages())) {
  install.packages("pacman")
}
pacman::p_load(dplyr,tibble,agricolae,openxlsx)
df <- read.xlsx("data.xlsx")
df |> str()
df |> summary()
df <- df|>
  rename(
    faktor1 = suhu_lingkungan,
    faktor2 = warna_daun,
    ulangan = ulangan
  )
df |> str()
df|> summary()
model <-aov(berat_basah_tanaman ~ faktor1 * faktor2 + ulangan,data = df)
model |> summary()
faktor2 <- df$faktor2 |>
  unique()
faktor2
for (f in faktor2) {
  dd <- df |>
    filter(faktor2 == f)
  model <- aov(berat_basah_tanaman ~ faktor1,data = dd)
  dmrt <-duncan.test(model,trt = "faktor1")
  tabel <- dmrt$groups |>
    as.data.frame() |>
    rownames_to_column("faktor1")
  paste0("faktor1 pada",f,"\n") |> cat(sep ="")
  print(tabel)
  cat("\n\n")
}
faktor1 <- df$faktor1 |>
  unique()
faktor1
for (f in faktor1) {
  dd <- df |>
    filter(faktor2 == f)
  model <- aov(berat_basah_tanaman ~ faktor1,data = dd)
  dmrt <-duncan.test(model,trt = "faktor1")
  tabel <- dmrt$groups |>
    as.data.frame() |>
    rownames_to_column("faktor1")
  paste0("faktor1 pada",f,"\n") |> cat(sep ="")
  print(tabel)
  cat("\n\n")
}
