
# Nama Lengkap  : MUHAMMAD RAFATA HIDAYAKA
# NPM           : 255001111100
# Kelas         : B

# ==================== Buat analisis anda dibawah ini ==================== #

if((!"pacman" %in% installed.packages())) {
  install.packages ("pacman")
}

pacman::p_load(dplyr, tibble, agricolae, openxlsx)
df <- read.xlsx ("data.xlsx", sheet = "data_pengamatan")

df |> str()
df |> summary()

df <- df |>
  rename(
    faktor1 = dosis_kcl,
    faktor2 = jenis_poc,
    ulangan = ulangan
  ) |>
  mutate(
    faktor1 = as.factor(faktor1),
    faktor2 = as.factor(faktor2),
    ulangan = ulangan
  )

df |> str()

df |> summary()
model <- aov(kandungan_klorofil  ~ faktor1 * faktor2 + ulangan, data = df)

model |> summary()

faktor2 <- df$faktor2 |>
  unique()

faktor2

for (f in faktor2) {
  dd <- df |>
    filter(faktor2 == f)
  model <- aov(kandungan_klorofil ~ faktor1, data = dd)
  dmrt <- duncan.test(model, trt = "faktor1")
  tabel <- dmrt$groups |>
    as.data.frame() |>
    rownames_to_column("faktor1")

  paste0("faktor 1 pada ",f," |n") |> cat(sep = "")

  print(tabel)

  cat("\n\n")
}

for (f in faktor1) {
  dd <- df |>
    filter(faktor1 == f)
  model <- aov(kandungan_klorofil ~ faktor2, data = dd)
  dmrt <- duncan.test(model, trt = "faktor2")

  tabel <- dmrt$groups |>
    as.data.frame() |>
    rownames_to_column("faktor 2")

  paste0("Faktor 2 pada", f, "\n") |> cat(sep = "")


print(tabel)

cat("\n\n")
}

