
# Nama Lengkap  :NAZWA NURSABANI
# NPM           :255001111125
# Kelas         :E

# ==================== Buat analisis anda dibawah ini ==================== #
#instal pacman
if (!("pacman" %in% installed.packages())){
  install.packages("pacman")
}
#membuat packages
 pacman : : p-load (dplyr,tibble,agricolae,openxlsx)
 df <- read.xlsx("data.xlxsx",= sheet"analisis.R")
 #meringkas datanya
 df l> str()
 df l> summary.()
 merapihkan data untuk dianalisis
 df<- df I>
   faktor 1 = f1
   faktor 2 = f2
   ulangan = rep(
   ) l>
     mutate (
       factor 1 = as.factor(factor 1)
       factor 2 = as.factor(factor 2)
       ulangan = as.factor (ulangan)
     )
   meninjau data ulangan
   df l> str()
   df l> summary()
   mencari aov(analisis.R)
   model <- aov (tinggi-tanaman ~ faktor 1*faktor 2 + ulangan,data =df)
   model <- summary()
