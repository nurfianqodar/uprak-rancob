
# Nama Lengkap  :ALYA NURSYAMSIAH
# NPM           :255001111027
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #
if (!("pacman" %in% installed.packages() [, "Package"])) {
  install.packages ("pacman")
}

pacman::p_load(
  agricolae,
  openxlsx,
  readxl,
  dplyr,
  lmtest,
  stats
)

RAL_RAK <- read_excel(
  "C:/Users/UNSIL/Desktop/uprak-rancob/027-C-Alya Nursyamsiah/data.xlsx",
  sheet=1
)

RAL_RAK <- within (RAL_RAK,{
  dosis_kcl <- factor(dosis_kcl)
  jenis_herbisida <- factor(jenis_herbisida)
  ulangan <- factor (ulangan)
  kadar_nitrogen_daun <- as.numeric(kadar_nitrogen_daun)
})

str (RAL_RAK)

rak <- aov(kadar_nitrogen_daun ~ dosis_kcl+jenis_herbisida+ulangan, data = RAL_RAK)
summary(rak)

shapiro.test(resid(rak))

bptest(
  kadar_nitrogen_daun ~ dosis_kcl+jenis_herbisida+ulangan,
  varformula = ~ fitted.values(rak),
  studentize = FALSE,
  data = RAL_RAK
)

bnt <- LSD.test(rak, "dosis_kcl", alpha = 0.05, group = TRUE)
print(bnt)
bnj <- HSD.test (rak, "dosis_kcl", alpha = 0.05, group = TRUE)
print(bnj)
duncan <- duncan.test (rak, "dosis_kcl", alpha = 0.05, group = TRUE)
print(duncan)

plot(bnt, variation = "range")

aggregate(
  kadar_nitrogen_daun ~ dosis_kcl,
  data=RAL_RAK,
  FUN=mean
)
