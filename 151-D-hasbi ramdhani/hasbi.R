
# Nama Lengkap  :HASBI RAMDHANI
# NPM           :255001111151
# Kelas         :D

# ==================== Buat analisis anda dibawah ini ==================== #

it (! ("pacman"%in% instal led.packages())) {install.packages("pacmen")}
pacman ::p_load (dplyr,agricolae,sheet, openxlsx)
df <- read.xlsx("data.xlxs", sheet = "ral_jagung")
df  |>  str()
df  |> summary()
df <- df
faktor1 = f1,
faktor2 = f2,
ulangan = rep
) |>
  mutate(
faktor1 = as.factor (faktor1),
faktor2 = as.factor (faktor2),
ulangan = as.factor (ulangan),
)
df |> str()

df |> summary()
model <- aov(tinggi_tanaman~faktor1* faktor + ulangan, data = df)
model |> summary()
faktor 2 <- unique (df $ faktor 2)
