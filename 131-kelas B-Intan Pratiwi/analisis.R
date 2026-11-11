
# Nama Lengkap  :INTAN PRATIWI
# NPM           :255001111131
# Kelas         :B

# ==================== Buat analisis anda dibawah ini ==================== #


if (!("pacman" %in% installed.packages())) {

}
pacman::p_load(dplyr, agricolae, openxlsx)
df <- read.xlsx("data.xlsx", sheet = 1)
summary(df)
df <- df |>
  rename(
    faktor1 = lama_penyinaran,
    faktor2 = sistem_budidaya,
    ulangan = ulangan
  )|>
  mutate(
    faktor1 = as.factor(faktor1),
    faktor2 = as.factor(faktor2),
    ulangan = ulangan
  )
summary(df)

model <- aov (panjang_akar ~ faktor1 * faktor2 + ulangan, data = df)
summary (model)

faktor2 <- df$faktor2 |>

  unique()
faktor2
for (f in faktor2) {
  dd <- df |>
    filter(faktor2 == f)
  model <- aov(panjang_akar ~ faktor1, data = dd)
  dmrt <- duncan.test(model, trt = "faktor1")
  tabel <- dmrt$groups |>
    as.data.frame() |>
    rownames_to_column(as.data.frame(dmrt$groups), "faktor1")

  paste0("faktor1 pada ",f,"|n") |> cat(sep ="")

  print(tabel)
  cat("\n\n")
}

for (f in faktor1) {
  dd <- df |>
    filter(faktor1 == f)
  model <- aov(panjang_akar ~ faktor1, data = dd)
  dmrt <- duncan.test(model, trt = "faktor2")
  tabel <- dmrt$groups |>
    as.data.frame() |>
    rownames_to_column("faktor2")

  paste0("faktor2 pada ",f,"|n") |> cat(sep ="")

  print(tabel)
  cat("\n\n")

}

