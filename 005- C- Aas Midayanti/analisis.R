
# Nama Lengkap  :AAS MIDAYANTI
# NPM           :255001111005
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #
if (!("pancam" %in% installed.packages()[, "package"])) {
  install.packages("pacman")
}
pacman::p_load(
  agricolae,
  openxlsx,
  readxl,
  dplyr,
  lmtest,
  stats
)

data.xlsx <- read_excel(
  "C:/Users/UNSIL/Desktop/uprak-rancob/005-C-Aas Midayanti/data.xlsx",
  sheet = 1
)
View(data.xlsx)
data.xlsx <- withim (data.xlsx, {
 faktor1 <- factor(faktor1)
 faktor2 <- factor (faktor2)
 faktor3 <- as. numeric(faktor3)
})
