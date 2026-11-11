
# Nama Lengkap  :DICKY V ABDILLAH
# NPM           :255001111087
# Kelas         :B

# ==================== Buat analisis anda dibawah ini ==================== #

pacman:: p_load("agricolae, tibble, dplyr")
library(tibble)
df<-read.xlsx("uprak-rancob > 087-B-DICKY V ABDILLAH", sheet = "kelompok_6")
sumarry(df)
df<-df|>
  mutate(
    faktor1 = as.factor(dosis_npk),
    faktor2 = as.factor(jenis_pungisida),
    ulangan = ulangan
  )
summary(df)
model<-aov(bobot_kering ~ faktor1 * faktor2 + ulangan, data = df)
summary(model)
faktor2<-df$faktor2 |>
  unique()
for (f in faktor2) {
  edi <- df |>
    filter(faktor2 ==)
  edii<-aov(bobot_kering ~ faktor1, data =edi)
