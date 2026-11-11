# Nama Lengkap  : MUHAMMAD FADIL NURFADILAH
# NPM           : 255001111102
# Kelas         : B

# ==================== Buat analisis anda dibawah ini ==================== #
if (!("pacman" %in% installed.packages())){
  install.packages("pacman")
}

pacman::p_load(dplyr, tibble, agricolae, openxlsx)
library(readxl)
df <- read.xlsx("data.xlsx")
df |> str()
df |> summary()
df <- df |>
  rename(
    faktor1 = konsentrasi_poc,
    faktor2 = jenis_insektisida,
    ulangan = ulangan
  ) |>
  mutate(
    faktor1 = as.factor(faktor1),
    faktor2 = as.factor(faktor2),
    ualangan = as.factor (ulangan)
  )
df |> str()
df |> summary
model <- aov(serapan_kalium ~ faktor1 * faktor2 + ulangan, data = df)
model |> summary()
dmrtf1 <- duncan.test(model, trt = "faktor1")
tabel_f1 <-dmrtf1$groups |>
  as.data.frame() |>
  rownames_to_column("faktor 1")
print(tabel_f1)
