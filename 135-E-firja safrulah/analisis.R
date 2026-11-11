
# Nama Lengkap  : FIRJA SAFRULAH
# NPM           : 255001111135
# Kelas         : E

# ==================== Buat analisis anda dibawah ini ==================== #
if (!("pacman" %in% installed.packages()) {install.packages("pacman")}
    df <- read.xlsx("KELAS_E_RAK.xlsx", sheet = "KELOMPOK_KELOMPOK_1")
df |> str()
df |> summary()
colSums(is.na(df))
with(df, table(faktor1, faktor2))
with(df, table(ulangan))
df <- df |>
rename(
faktor1 = 1, # konsentrasi_poc_limbah_dapur,
faktor2 = 2, # dosis_cocopeat,
ulangan3 = 3, # ulangan
|>
