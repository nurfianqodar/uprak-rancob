
# Nama Lengkap  :RIZKAR MARTIN ALRIZKY
# NPM           :255001111154
# Kelas         :E

# ==================== Buat analisis anda dibawah ini ==================== #
if (!("pacman"%in% installed.packages())){install.packages("pacman")}
pacman ::p_load (dplyr, agricolae, openxlsx)
df <- read.xlsx("data.xlsx")
df |> str()
df |> summary()
df <- df |>
  rename(
  faktor1 = f1,
  faktor2 = f2,
  ulangan = rep
) |>
 mutate(
    faktor1 = as.factor (f1),
    faktor2 = as.factor (f2),
    ulangan = as.factor (rep),
)
df |> str()
df |. summary
