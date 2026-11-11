
# Nama Lengkap  : SITI AISYAH
# NPM           : 255001111033
# Kelas         : C

# ==================== Buat analisis anda dibawah ini ==================== #


pacman::p_load(openxlsx, dplyr, agricolae)

df <- openxlsx::read.xlsx("data.xlsx", sheet="data_pengamatan"
                          )
View(df)
names(df)
str(df)
head(df)

df <- df |> dplyr::mutate(
  ulangan=as.factor(ulangan),
  dosis_urea=as.factor(dosis_urea),
  jenis_pupuk=as.factor(jenis_pupuk)
)

model <- aov (
  indeks_luas_daun ~ ulangan +
    dosis_urea * jenis_pupuk, data=df
  )
summary(model)

uji_duncan <- agricolae::duncan.test(
  model, "jenis_pupuk",
  alpha = 0.05, group=TRUE)

print (uji_duncan$groups)

uji_duncan <- agricolae::duncan.test(
  model,
  c("dosis_urea", "jenis_pupuk"),
  alpha = 0.05, group=TRUE)

print (uji_duncan$groups)

