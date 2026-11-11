
# Nama Lengkap  :ALFIANA MUTIARA RAMDHANI
# NPM           :255001111032
# Kelas         :B

# ==================== Buat analisis anda dibawah ini ==================== #
if (! ("pacman"%in% installed.pacakges())) {
  install.packages("pacaman")
}
pacman ::p_load (dplyr, agricolae, openxlsx)
df <- read.xlsx("data.xlsx", sheet = "data_pengamatan")
df |> str()
df |> summary()
df <- df |>
  rename(
    faktor1 = f1,
    faktor2 = f2,
    ulangan = rep
  ) |>
  mutate(
    faktor1 = as.factor (faktor1),
    faktor2 = as.factor (faktor2),
    ulangan = as.factor (ulangaan),
  )
df |> str ()

df |> summary()
model <- aov (berat_kering_tanaman~faktor1= faktor2 + ulangan, data = df)
model |> summary ()
faktor2 <- unique (df $ faktor2)
