
# Nama Lengkap  : RAIFA AZKIA FITRIYANI
# NPM           : 255001111030
# Kelas         :E

# ==================== Buat analisis anda dibawah ini ==================== #
pacman::p_load("agricolae, openxlsx, dplyr")
df<-read_xlsx("data.xlsx", sheet = "data_pengamatan")
summary(df)
df<-df |> dplyr::mutate(
  faktor1=as.factor(konsentrasi_nutrisi),
  faktor2=as.factor(jenis_bakteri),
  ulangan=ulangan
)
model<-aov(serapan_fosfor ~ konsentrasi_nutrisi * jenis_bakteri + ulangan, data=df)
summary(model)

uji_duncan <- agricolae::duncan.test(
  model, "ulangan",
  alpha = 0,05, group = TRUE
)
print(uji_duncan$groups)
