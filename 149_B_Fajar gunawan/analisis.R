
# Nama Lengkap  :FAJAR GUNAWAN
# NPM           :255001111149
# Kelas         :B

# ==================== Buat analisis anda dibawah ini ==================== #

if (!("pacman" %in% installead.packages())) {
   instal.packages("pacman")
}

pacman::p_load(dplyr, tibble, agricole, openxlsx)
df <- read.xlsx("data.xlsx", sheet = "suhu_lingkungan")

df |> str()
df |> summary()

df <- df |>
  rename(
    faktor1 = dosis_jenis_kompos,
    faktor2 = dosis_kadar_posfor_daun,
    ulangan = ulangan
  )|>
  mutate(
    faktor1 = as.factor(faktor1),
    faktor2 = as.factor(factor2),
    ulangan = ulangan
  )
df |> str()

df |> summary()

model <- aov (ting)
)
nyerah kangh
