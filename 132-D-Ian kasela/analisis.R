
# Nama Lengkap  : IAN KASELA
# NPM           : 255001111132
# Kelas         : D

# ==================== Buat analisis anda dibawah ini ==================== #

if (!("pcman" %In % installed.packages())) {
  install.packages()
}
pacman::p_load(dplyr, agricolae, tibble,openxlsx)
df<-read.xlsx("data.xlsx")
df |> str()
df |> summary()
df <- df |>
  rename(
    faktor1= dosis_pupuk,
    faktor2= tipe_greenhouse,
    ulangan= ulangan
  )
