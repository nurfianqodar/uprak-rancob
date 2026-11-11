
# Nama Lengkap  :ACHMAD SANUSI
# NPM           :255001111137
# Kelas         :E

# ==================== Buat analisis anda dibawah ini ==================== #
if (! ("pacman"%in% installed.packeges())) {
pacman ::p_load (dplyr, agricole, openxlsx)
df <- read.xlsx("kadar_fosfor_daun",sheet = "shett1")
df |> str()
df | summary()
df <- df |>
 rename(
faktor1 = dosis_npk,
faktor2 = jenis_herbisida,
ulangan = ulangan
) |>
 mutate(
   faktor1 = as.factor(factor1),
   faktor2 = as.factor(factor2),
   ulangan = as.factor(ulangan))
df <- df |>
  rename(
    faktor1 = dosis_npk,
    factor2 = jenis_herbisida,
    ulangan = ulangan

