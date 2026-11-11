
# Nama Lengkap  :AGNI FITRIANI
# NPM           :255001111002
# Kelas         :c

# ==================== Buat analisis anda dibawah ini ==================== #

if (!("pacman" %in% installed.packages())){
  install.packages("pacman")
}
pacman ::p_load (dplyr, agricolae, openxlsx)

df <- read.xlsx ("data.xlsx", sheet = "data_pengamatan")

df |> str()
df |> summary()

df <- df |>
  rename(
    faktor1 = f1,
    faktor2 = f2,
    ulangan = rep
  ) |>
  mutate (
    faktor1 = as.factor(faktor1),
    faktor2 = as.factor(faktor2),
    ulangan = as.factor(ulangan),
  )
df |> str()
df |> summary()
model <-aov(data_pengamatan~faktor1*faktor2 + ulangan = df)
model |> summary()
faktor2 <- unique(df $ faktor2)

for (f in faktor2){
  dd <- subset(df, faktor2 == f)
}
 model
