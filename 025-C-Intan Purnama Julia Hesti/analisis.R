I
# NPM           :INTAN PURNAMA JULIA HESTI
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #

if (!("pacman" %in% installed.packages() [, "Package"])) {
  install.packages("pacman")
}

pacman::p_load(agricolae, openxlsx, readxl,dplyr,lmtest,stats)

RAl_RAK <-read_excel(
  "C:/Users/UNSIL/Desktop/uprak-rancob/025-C-Intan Purnama Julia Hesti/data.xlsx",
  sheet = 1
)
View(RAl_RAK)

RAl_RAK <-within(RAl_RAK, {
  dosis_kompos <-factor(dosis_kompos)
  jenis_fungisida <-factor(jenis_fungisida)
  ulangan <-factor(ulangan)
  serapan_kalium <- as.numeric(serapan_kalium)
})

str(RAl_RAK)

rak <-aov(serapan_kalium ~ dosis_kompos + jenis_fungisida + ulangan, data = RAl_RAK)
summary(rak)

shapiro.test(resid(rak))

bptest(
  serapan_kalium ~ dosis_kompos + jenis_fungisida + ulangan,
  varformula =  fitted.values(rak),
  studentize = FALSE,
  data = RAl_RAK
)
bnt <- LSD.test(rak, "dosis_kompos", alpha = 0,001,group = TRUE)
print(bnt)
bnt <- LSD.test(rak, "jenis_fungisida", alpha = 0.01,group = TRUE)
print(bnt)
bnt <- LSD.test(rak, "ulangan", alpha = 0.001,group = TRUE)
print(bnt)
