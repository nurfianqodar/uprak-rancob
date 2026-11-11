
# Nama Lengkap  :HIJRIANTI ARNIA
# NPM           :255001111089
# Kelas         :B

# ==================== Buat analisis anda dibawah ini ==================== #
install.packages(c("readxl","dplyr","agricolae","tibble"))
library(readxl)
library(dplyr)
library(agricolae)
library(tibble)
df<-read.xlsx("data.xlsx",sheet=pertama)
df<read_excel(file.choose())
df<-read_xlsx("data.xlsx",sheet = 1)
view(df)
str(df)
summary(df)
df<-mutate (df,
            dosis_kompos=as.factor(dosis_kompos),
            jenis_tanah=as.factor(jenis_tanah),
            ulangan=as.factor(ulangan)
            )
model<-aov(volume_akar~dosis_kompos+jenis_tanah+ulangan,data=df)
summary(model)
dmrt1<-duncan.test(model,trt="dosis_kompos")
dmrt1$groups
dmrt2<-duncan.test(model,trt="jenis_tanah")
dmrt2$groups
df$perlakuan<-
  interaction(df$dosis_kompos,df$jenis_tanah)
model2<-aov(volume_akar~perlakuan+ulangan,data=df)
dmrtInteraksi<-duncan.test(model2,"perlakuan")
dmrtInteraksi$groups
jenis_tanah<-df$jenis_tanah|>
  unique()
jenis_tanah
for(f in jenis_tanah){
  dd<-df|>
    filter(jenis_tanah==f)
  model<-aov(volume_akar~dosis_kompos=ulangan,data=dd)
  dmrt<-duncan.test(model,trt="dosis_kompos")
  tabel<-dmrt$groups|>
    as.data.frame()|>
    rownames_to_column("dosis_kompos")
  paste0("dosis_kompos pada",f,"\n")|>
    cat(sep="")
  print(tabel)
    cat("\n\n\")
    }
}
