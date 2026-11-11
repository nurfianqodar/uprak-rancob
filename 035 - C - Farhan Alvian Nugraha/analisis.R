
# Nama Lengkap  : FARHAN ALVIAN NUGRAHA

# NPM           : 255001111035
# Kelas         : C

# ==================== Buat analisis anda dibawah ini ==================== #

if (!("pacman"%in%installed.packages())){install.packages("pacman")}

pacman::p_load(agricolae, openxlsx, dplyr, tidyverse)

df <- read.xlsx("data.xlsx", sheet = "data_pengamatan")

df |> str()

df |> summary()

df <- df |>
  mutate(
    faktor1 = as.factor(dosis_sp36),
    faktor1 = as.factor(varietas_tanaman),
    faktor1 = as.factor(ulangan)
  )

model <-aov(tinggi_tanaman~dosis_sp36*varietas_tanaman+ulangan, data=df)

model |>summary()

faktor2 <- df$faktor2 |> unique()

faktor2

for (f in faktor2) {
(dd <-df |>
filter(faktor2 ==f)
model <-aov(tingi_tanaman~faktor1+ulangan, data = dd)
dmrt <-duncan.test(model, trt = "dosis_sp36")
tabel <-dmrt$groups |>
  as.data.frame() |>
  rownames_to_column("dosis_sp36")
paste0("faktor 1 pada ",f,"\n"|>cat(sep="")
}

