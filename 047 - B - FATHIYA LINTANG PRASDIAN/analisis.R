
# Nama Lengkap  : FATHIYA LINTANG PRASDIAN
# NPM           : 255001111047
# Kelas         : B

# ==================== Buat analisis anda dibawah ini ==================== #
if (!("pacman" %in% installed.packages())) {
  install.packages("pacman")
}
pacman::p_load(tidyverse, agricolae, openxlsx)
df <- read.xlsx("data.xlsx", sheet = "data_pengamatan")

df|> str ()

df |> summary()
colSums(is.na(df))
with(df, table(faktor1, faktor2))
with(df, table(ulangan))

#merapikan data agar seusai untuk analisis
df <- df |>
  rename(
    faktor1 = 1, # dosis_urea,
    faktor2 = 2, # jenis_benih,
    ulangan = 3, # ulangan
  ) |>
  mutate(
    faktor1 = as.factor(factor1),
    faktor2 = as.factor(factor2),
    ulangan = as.factor(ulangan)
  )

model <- aov(dosis_urea ~ faktor1 * faktor2 + ulangan, data = df)

model |> summary()

faktor2 <- df$faktor2 |>
  unique()
faktor2

for (f in faktor 1) {
  dd <- df |>
    filter(faktor1 == f)
}

model <- aov(dosis_urea ~ faktor 2, data = dd)
dmrt <- duncan.test(model, trt = "faktor2")

tabel <- dmrt$groups |>
  as.data.frame() |>
  rownames_to_column("factor 2")

paste0("faktor 2 pada", f, "\n") |> cat(sep = "")

taraf_faktor1 <- levels(df$faktor1)
model_sederhana<-aov(bobot_basah ~ ulangan + faktor 2, data = dd)


#DMRT

duncan.test(model, "faktor1", group = TRUE, console = TRUE)
duncan.test(model, "faktor2", group = TRUE, console = TRUE)
duncan.test(model, "faktor1", "faktor2" group = TRUE, console = TRUE)
