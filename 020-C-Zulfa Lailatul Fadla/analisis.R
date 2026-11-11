
# Nama Lengkap  :ZULFA LAILATUL FADLA
# NPM           :255001111020
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #


pacman:: p_load("agricolae, tibble, dplyr")
df <- read_xlsx("data.xlsx", sheet = "data_pengamatan")
summary(df)
df <- df|>
mutate(
  faktor1 = as.factor(interval_pemupukan),
  faktor2 = as.factor(jenis_fungisida),
  ulangan = ulangan
)
summary(df)
model<-aov(indeks_luas_daun ~ interval_pemupukan * jenis_fungisida + ulangan, data=df)
summary(model)
uji_duncan <- agricolae :: duncan.test
(model, "interval_pemupukan"
  alpha=0,05,group=TRUE
)
print (uji_duncan$groups)
