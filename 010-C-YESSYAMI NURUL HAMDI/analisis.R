
# Nama Lengkap  :YESSYAMI NURULHAMDI
# NPM           :255001111010
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #

pacman::p_load(agicolae, dplyr, openxlax)

data_serapan_fosfor <- read_xlsx("data.xlsx", sheet = "data_pengamatan")
summary(data_serapan_fosfor)
str(data_serapan_fosfor)

serapan_fosfor <- data_serapan_fosfor |>
  mutate(
    f1 = as.factor(dosis_sp36),
    f2 = as.factor(jenis_fungisida),
    ulangan = as.factor(ulangan)
  )

serapan_fosfor <- aov(serapan_fosfor ~ f1 * f2 + ulangan, data = serapan_fosfor)
summary(serapan_fosfor)

dmrt_f1 <- duncan.test(serapan_fosfor, trt = c("f1"))
dmrt_f1 $groups

dmrt_f2 <- duncan.test(serapan_fosfor, trt =("f2"))
dmrt_f2 $groups

dmrt_ulangan <- duncan.test(serapan_fosfor, trt = ("ulangan"))
dmrt_ulangan $groups

dmrt_interaksi <- duncan.test(serapan_fosfor, trt = c ("f1","f2"))
dmrt_interaksi $groups
