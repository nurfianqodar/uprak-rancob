
# Nama Lengkap  :NANDANG HIDAYAT
# NPM           :255001111046
# Kelas         :E

# ==================== Buat analisis anda dibawah ini ==================== #

 installed.packages("pacman")
pacman::p_load(dplyr, tibble, agricolae, openxlsx)
uprak<- read.xlsx("data.xlsx")
str(uprak)
summary(uprak)
uprak <- uprak|>
mutate(konsentrasi_nutrisi= as.factor(konsentrasi_nutrisi),jenis_kompos= as.factor(jenis_kompos),ulangan= as.factor(ulangan))
str(uprak)
summary(uprak)
analisis <- aov(serapan_nitrogen ~ konsentrasi_nutrisi*jenis_kompos + ulangan, data = uprak)
str(analisis)
summary(analisis)
