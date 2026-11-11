
# Nama Lengkap  :NIPANDA TIARA
# NPM           :255001111001
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #
if(!("pacman" %in% installed.packages())) {
  install.packages("pacman")
}
pacman::p_load(dplyr, agricolae, openxlsx)
df <- read.xlsx("data.xlsx", sheet = "data_pengamatan")
df |> str()
df |> summary()
  mutate(
    faktor1 = as.factor (faktor1),
    faktor2 = as.factor (faktor2),
    ulangan = as.factor (ulangan),
  )
df |> str()
df |> summary()
model  <- aov(indeks_luas_daun ~ konsentrasi_nutrisi * jenis_bakteri + ulangan, data = df)
model |> summary()
for(f in faktor2) {
  dd <- sub
}
}
