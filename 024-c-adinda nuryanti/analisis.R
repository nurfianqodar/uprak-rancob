
# Nama Lengkap  :ADINDA NURYANTI
# NPM           :255001111024
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #
pacman::p_load("agricolae,tibble,dplyr")
df<-read_xlsx("data.xlsx", sheet=1)
summary(df)
df<- df |> dplyr :: mutate(faktor1=as.factor(frekuensi_penyiraman),
  faktor2=as.factor(media_tanam),
  ulangan=ulangan
)
model<-aov(serapan_fosfor ~ frekuensi_penyiraman * media_tanam + ulangan, data= df)
summary(model)

uji_duncan<- agricolae:: duncan , test(model,"frekuensi_penyiraman"
                                         alpha =0,05 ,group =TRUE)
print (uji_duncan$groups)
uji_duncan<-agricolae:: duncan,test(model,"media_tanam",alpha =0,05 ,group =TRUE)
