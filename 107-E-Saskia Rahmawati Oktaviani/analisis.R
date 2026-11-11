
# Nama Lengkap  : SASKIA RAHMAWATI OKTAVIANI
# NPM           : 255001111107
# Kelas         : E

# ==================== Buat analisis anda dibawah ini ==================== #
# MENGINSTAL PACMAN (JIKA BELUM ADA)
 if (!("pacman" %in% installed.packages())) {
   install.packages()
 }

 #memuat packages yang diperlukan
 pacman::p_load (agricolae,openxlsx,dplyr)

 #memuat data dari excel
 df <- read.xlsx("data.xlsx", sheet = "data_pengamatan")

 #meninjau data
str(df)
summary(df)

#menyesuaikan tipe data untuk dianalisis
df <- df |>
  rename(
    faktor1 = kedalaman_tanam,
    faktor2 = tekstur_tanah,
    ulangan = ulangan
  ) |>
  mutate(
    faktor1 = as.factor(faktor1),
    faktor2 = as.factor(faktor2),
    ulangan = as.factor(ulangan)
  )

#meninjau ulang data
str(df)
summary(df)

# analisis anova
 model <- aov(berat_basah_tanaman ~ faktor1 * faktor2 + ulangan, data = df)
 model |> summary()

 # uji lanjut karena ada interaksi

 # uji lanjut semua faktor 1 pada setiap faktor 2
 faktor2 <- df$faktor2 |>
   unique()

 faktor2

 for (f in faktor2) {
   dd <- df |>
     filter(faktor2 == f)
   model <- aov(berat_basah_tanaman ~ faktor1 + ulangan, data = dd)
   dmrt <- duncan.test(model, trt = "faktor1")
   tabel <- dmrt$groups |>
     as.data.frame() |>
   rownames_to_column("faktor1")

   paste0("faktor 1 pada", f, "\n") |> cat(sep = "")
   print(tabel)

   cat("\n\n")
 }

 # uji lanjut semua faktor 2 pada setiap faktor 1
 faktor1 <- df$faktor1 |>
   unique()

 faktor1

 for (f in faktor1) {
   dd <- df |>
     filter(faktor1 == f)
   model <- aov(berat_basah_tanaman ~ faktor2 + ulangan, data = dd)
   dmrt <- duncan.test(model, trt = "faktor2")
   tabel <- dmrt$groups |>
     as.data.frame() |>
     rownames_to_column("faktor 1")

   paste0("faktor 2 pada", f, "\n") |> cat(sep = "")
   print(tabel)

   cat("\n\n")
 }

 #akhir uji lanjut
 model <- aov(berat_basah_tanaman ~ faktor1 * faktor2 + ulangan, data = df)

 dmrtf1 <- duncan.test(model< trt = "faktor1")
 print(tabel)

 dmrtf2 <- duncan.test(model< trt = "faktor2")
 print(tabel)
