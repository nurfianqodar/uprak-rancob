
# Nama Lengkap  :HUSNA TRIADI PUTRA
# NPM           :255001111009
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #
pacman::p_load(dplyr,tibble,agricolae,openxlsx)
#MEMBACA FILE EXCEL
df<- read.xlsx("data.xlsx",sheet = "data_pengamatan")
df|> str()
df|> summary()
#MERAPIKAN DATA AGAR SESUAI UNTUK ANALISIS
df <- df |>
  rename(
    faktor1 = dosis_pupuk,
    faktor2 = jenis_benih,
    ulangan = ulangan
  )|>
  mutate(
    faktor1 = as.factor(faktor1),
    faktor2 = as.factor(faktor2),
    ulangan = as.factor(ulangan)
  )
#MENINJAU ULANG DATA
  df |> str()
  df |> summary()
#ANOVA
  model <- aov(serapan_fosfor ~ faktor1 * faktor2 + ulangan,data = df)
  model |> summary()

#UJI LANJUT DMRT UNTUK F1 DAN F2
  model <- aov(serapan_fosfor ~ faktor1 * faktor2 + ulangan,data = df)
  dmrtf1 <- duncan.test(model,trt = "faktor1")
  dmrtf2 <- duncan.test(model,trt = "faktor2")
# MENAMPILKAN HASIL DMRT
  dmrtf1
  dmrtf2
#MENAMPILKAN DATA PENGELOMPOKKAN
  dmrtf1$groups
  dmrtf2$groups
