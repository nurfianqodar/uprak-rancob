
# Nama Lengkap  : MUHAMMAD NABIL NUR SALAM
# NPM           : 255001111057
# Kelas         : E

# ==================== Buat analisis anda dibawah ini ==================== #

if(!("pacman" %in% installed.packages())){
  install.packages("pacman")
}

pacman::p_load(tidyverse, agricolae, openxlsx, dplyr)

df <- read.xlsx("data.xlsx", sheet = "data_pengamatan")

df |> str()
df |> summary()

df <- df|>
  mutate(
    jumlah_benih = as.factor(jumlah_benih),
    jenis_pupuk = as.factor(jenis_pupuk),
    ulangan = as.factor(ulangan)
  )

model <- aov(volume_akar ~ jumlah_benih * jenis_pupuk + ulangan, data = df)

model |> summary()

#KARENA FAKTOR 1 ,FAKTOR 2 DAN INTERAKSI NYA BERPENGARUH JADI LANGSUNG UJI LANJUT PADA INTERAKSI

jenis_pupuk <- df$jenis_pupuk |>
  unique()

for (f in jenis_pupuk) {
  pupuk <- df |>
    filter(jenis_pupuk ==f)
  lanjut1 <- aov(volume_akar ~ jumlah_benih, data = pupuk)
  volume <- duncan.test(lanjut1, trt = "jumlah_benih")
  tabel <- volume$groups |>
    as.data.frame() |>
    rownames_to_column("jumlah_benih")
  paste0("jumlah_benih pada jenis_pupuk", f , "\n") |> cat(sep = "")
  print(tabel)
  cat("\n\n")
}



jumlah_benih <- df$jumlah_benih |>
  unique()

for (f in jumlah_benih) {
  benih <- df |>
    filter(jumlah_benih == f)
  lanjut2 <- aov(volume_akar ~ jenis_pupuk, data = benih)
  akar <- duncan.test(lanjut2, trt = "jenis_pupuk")
  tabel<- akar$groups |>
    as.data.frame() |>
    rownames_to_column("jenis_pupuk")
  paste0("jenis_pupuk pada jumlah_benih", f, "\n") |> cat(sep = "")
  print(tabel)
  cat("\n\n")
}
