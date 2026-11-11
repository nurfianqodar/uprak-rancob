
# Nama Lengkap  :AZZAHRA HELMALIA PUTRI
# NPM           :255001111119
# Kelas         : D

# ==================== Buat analisis anda dibawah ini ==================== #

if (requireNamespace("pacman", quretly = true)

pacman::p_load (tidyverse, agricolae, openxlsx)
azzahra<-read.xlsx('RAK_E.xlsx')
summary(azzahra)
str(azzahra)

azzahra1<-azzahra
mutate()
 konsentrasi_poc_buah_pisang=as.factor(konsentrasi_poc_buah_pisang)
 dosis_kompos_hijauan=as.factor(dosis_kompos_hijauan)
 ulangan=as.factor(ulangan)
 uni<-aov (panjang_daun~konsentrasi_poc_buah_pisang_dosis_kompos_hijauan=ulangan, data=azzahra1
  summary(uni)

  for (f in dosis_kompos_hijauan)
