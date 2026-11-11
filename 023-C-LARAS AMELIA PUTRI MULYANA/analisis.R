
# Nama Lengkap  :LARAS AMELIA PUTRI MULYANA
# NPM           :255001111023
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #
pacman::p_load(dplyr,agricolae,openxlsx)

laras <- read_xlsx("data.xlsx")

summary(laras)
str(laras)

laras1<-laras |>

  mutate(
    f1=dosis_npk,
    f2=metode_irigasi,
    ulangan=ulangan
  )|>
  mutate(
    f1=as.factor(f1),
    f2=as.factor(f2),
    ulangan=as.factor(ulangan)

  )
laras<- aov(kadar_nitrogen_daun ~ f1*f2 + ulangan, data=laras1)
summary(laras)

dmrt_f1<-duncan.test(laras,trt="f1")
dmrt_f1 $groups

dmrt_f2 <-duncan.test(laras,trt="f2")
dmrt_f2 $groups

dmrt_interaksi<-duncan.test(laras,trt=c ("f1","f2"))
dmrt_interaksi $groups
