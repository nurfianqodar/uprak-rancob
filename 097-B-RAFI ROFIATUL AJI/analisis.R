
# Nama Lengkap  :RAFI ROFIATUL AJI
# NPM           :255001111097
# Kelas         :B

# ==================== Buat analisis anda dibawah ini ==================== #
install.packages("pachman")
pacman::p_load(agricolae, openxlsx, dplyr)
df <- read.xlsx("data.xlsx", sheet = "data_pengamatan")
df |> str(data)
df |> summary()
mutate(
  faktor1 = as.factor(interval_pemupukan),
  faktor2 = as.factor(warna_daun),
  faktor3 = as.factor(produktivitas_tanaman),
  ulangan = as.factor(ulangan)

)
tabel <- data.frame()

