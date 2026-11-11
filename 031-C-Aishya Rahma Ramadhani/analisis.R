
# Nama Lengkap  : AISHYA RAHMA RAMADHANI
# NPM           : 255001111031
# Kelas         : C

# ==================== Buat analisis anda dibawah ini ==================== #

pacman::p_load(agricolae, openxlsx, dplyr)

data_aishya <- read.xlsx("data.xlsx")
data_aishya |> str()
data_aishya |> summary()

data_aishya |> is.na() |> colSums()

data_aishya <- data_aishya |>
  rename(
    f1 = kedalaman_tanam,
    f2 = tekstur_tanah,
    rep = ulangan
  ) |>
  mutate(
    f1 = as.factor(f1),
    f2 = as.factor(f2),
    rep= as.factor(rep)
  )

model <- aov(kandungan_klorofil ~ f1*f2 + rep,
             data = data_aishya)
summary(model)

db_galat <- df.residual(model)
kt_galat <- deviance(model) / db_galat

shapiro.test(residuals(model))
bartlett.test(
  kandungan_klorofil ~ interaction(f1, f2), data = data_aishya)


level_f2 <-c("M1", "M2", "M3")
for (M in level_f2) {
  dd<-data_aishya |> filter(f2==M)
  dmrt<- duncan.test(dd$kandungan_klorofil, dd$f1,
                     DFerror = db_galat, MSerror = kt_galat, alpha = 0.05)
  tabel<-dmrt$groups |>
    mutate(f1=rownames(dmrt$groups)) |>
    select(f1, everything())
  paste0("Faktor B pada Taraf", M, "\n") |> cat()
  print(tabel)
  cat("\n")
}

level_f1 <-c("C0", "C1", "C2")
for (C in level_f1) {
  dd<-data_aishya |> filter(f1==C)
  dmrt<- duncan.test(dd$kandungan_klorofil, dd$f2,
                     DFerror = db_galat, MSerror = kt_galat, alpha = 0.05)
  tabel<-dmrt$groups |>
    mutate(f1=rownames(dmrt$groups)) |>
    select(f1, everything())
  paste0("Faktor A pada Taraf", C, "\n") |> cat()
  print(tabel)
  cat("\n")
}
