
# Nama Lengkap  :AMALIA SIFA FAUZIAH
# NPM           :255001111019
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #
pacman::p_load(dplyr, tibble, agricolae, openxlsx)
df <- read.xlsx("data.xlsx", sheet = "data_pengamatan")
df <- df |> mutate (
  faktor1 = as.factor(jarak_tanam),
  faktor2 = as.factor(jenis_benih),
  ulangan = as.factor(ulangan)
model <- aov(kandungan_klorofil ~ jarak_tanam*jenis_benih + ulangan, data =df )
model |> summary()
