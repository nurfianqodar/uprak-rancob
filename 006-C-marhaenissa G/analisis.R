
# Nama Lengkap  :MARHAENISSA GUNAWAN
# NPM           :255001111006
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #
if(!requireNamespace("pacman",quietly=TRUE)){
  install.packages("pacman")
}
pacman::p_load(dplyr,tibble,agricolae,openxlsx)
df<-read.xlsx("data.xlsx",sheet="data_pengamatan")
str<-(df)
summary<-(df)

df<-df|>
rename(
faktor1=volume_air
faktor2=jenis_poc
rep=ulangan
|>
mutate<- (across(c(faktor1,faktor2,rep),as.factor))
)
model<- aov(kandungan_klorofil~faktor1*faktor2+rep, data=df)
summary(model)

