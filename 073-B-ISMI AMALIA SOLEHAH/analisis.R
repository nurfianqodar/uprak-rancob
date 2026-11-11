
# Nama Lengkap  :ISMI AMALIA SOLEHAH
# NPM           :255001111073
# Kelas         :B

# ==================== Buat analisis anda dibawah ini ==================== #


if(!("pacman" % in% installed.packages())) {
  install.packages("pacman")
}
pacman::p_load(tidyverse, agricolae, openxlsx)
ismi<-read.xlsx("data.xlsx")
summary(ismi)
str(ismi)

ismi1<-ismi|>
  mutate(
    jarak_tanam=as.factor(jarak_tanam),
    jenis_herbisida=as.factor(jenis_herbisida),
    ulangan=as.factor(ulangan)
  )
uni<-aov(berat_kering_tanaman~jarak_tanam*jenis_herbisida+ulangan,data=ismi1)
summmary(uni)

jenis_herbisida<-ismi1$jenis_herbisida|>
  unique()
for(f in jenis_herbisida){
  bakwan<-ismi1|>
    filter(jenis_herbisida=f)
  model<-aov(jenis_herbisida~jarak_tanam,data=bakwa)
  dmrt<-duncan.test(model,trt="jarak_tanam")
  tabel<-dmrt$groups|>
    as.data.frame()|>
    rounames_to_column
}

