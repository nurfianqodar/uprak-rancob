
# Nama Lengkap  :BILAL FARHANUL HAKIEM
# NPM           :255001111012
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #
pacman::p_load(agricolae, openxlsx, dplyr)
df <- read.xlsx(data.xlsx, data_pengamatan = 1)

str(df)
summary(df)

df <- df |>
  rename (faktor1=intensitas_cahaya, faktor2=tekstur_tanah, ulangan=rep) |>
mutate(
  faktor1=as.factor(faktor1),
  faktor2=as.factor(faktor2),
  ulangan=as.factor(ulangan)
)

str(df)
summary(df)

model <- aov(berat_basah_tanaman ~ faktor1+faktor2+ulangan,data = df)
model |> summary()

