
# Nama Lengkap  :KARMELA SARI
# NPM           :255001111118
# Kelas         :E

# ==================== Buat analisis anda dibawah ini ==================== #
if (!("pacman" %in% installed.packages())) {
  install.packages("pacman")
}
pacman::p_load(dplyr, tibble, agricolae, openxlsx)
df <- read.xlsx("data.xlsx", sheet = "1")
model <- aov(berat_basah_tanaman ~ faktor1 * faktor2,
  data = df
)
df |> str()
df |> summary()
df |>
  is.na() |>
  colSums()
df <- df |>
  rename(
    faktor1 = konsentrasi_poc,
    faktor2 = jenis_kompos,
    ulangan = ulangan
  ) |>
  mutate(
    faktor1 = as.factor(faktor1),
    faktor2 = as.factor(faktor2),
    ulangan = as.factor(ulangan)

  )
df |> str()
model <- aov(berat_basah_tanah ~ faktor1 * faktor2 + ulangan, data = df)
model |> summary()
factor2 <- df$faktor2 |>
         unique()
faktor2
for(f in faktor2) {
  dd < df |>
    filter (faktor2 == f)
}
