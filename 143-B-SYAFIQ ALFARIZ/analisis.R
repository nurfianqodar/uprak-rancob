
# Nama Lengkap  :SYAFIQ ALFARIZ N
# NPM           :255001111143
# Kelas         :B

# ==================== Buat analisis anda dibawah ini ==================== #

if(!("pacman" %in% installed.packages ())){
  install.packages("pacman")
}
pacman::p_load(dplyr, tibble, agricolae, openxlsx)
df <- read.xlsx("~$data.xlsx")

df |> str()
df |> summary()

df <-df |>
  rename(
      faktor1 = dosis_poc_limbah_dapur,
      faktor2 = dosis_kompos_daun_kering,
      ulangan = ulangan
    )|>
  mutate(
    faktor1 = as.faktor(fAKTOR1),
    fAKTOR2 = as.fAKTOR(fAKTOR2),
    ulangan = ulangan
  )


df |>str()
df |>summary()

model <- aov (tinggi_tanaman ~ faktor1 * faktor2 + ulangan, data = df)
model |> df$faktor1 |>

    unique()

faktor2

for (f in faktor 2) {

}
