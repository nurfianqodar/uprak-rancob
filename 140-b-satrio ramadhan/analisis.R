
# Nama Lengkap  :SATRIO RAMADHAN
# NPM           :255001111140
# Kelas         :B

# ==================== Buat analisis anda dibawah ini ==================== #

if(!("pacman"installed.packages))
pacman::p_load(dplyr,tibble,agricolae,openxlsx)
library(dplyr)
library(tibble)
library(agricolae)
library(openxlsx)
df<-read.xlsx("data.xlxs")
library(openxlsx)
model<-aov(dosis_kcl ~ media_tanam * ulangan,data=df)
df|<str()
df<-df|>
  rename(
    dosis_kcl=f1,
    media_tanam=f2,
    ulangan=ulangan)
mutate(faktor1=as.factor (faktor1),
       faktor2=as.faktror(faktor2),
       ulangan=as.factor(ulangan)
       )



if(!("pacman"%in%installed.packages())){install.packages("pacman")}
pacman::p_load(dplyr, tibble, agriclae, openxlsx)
library(dplyr)
library(tibble)
library(agricolae)
library(openxlsx)
df<-read.xlsx("data.xlsx")
