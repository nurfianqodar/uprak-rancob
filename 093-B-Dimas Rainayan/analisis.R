
#amaengkapIMASAINAYAN
#PM55001111093
#elas

#==============uatnalisisndaibawahni===============df

if (!("pacman"%in% installed.packages())) {intall.packages("pacman")
}
  pacman::p_load(tibble,agricolae,openxlsx)

  df <- read.xlsx("data.xlsx")
  df  |> summary()
df <- df |>  mutate(ulangan=as.character(ulangan))


df <- df |>  rename(
  faktor1=Konsentrasi_nutrisi,
  faktor2=jenis_mulsa,
  ulangan=ulangan,
  kadar_kalium_daun=kadar_kalium_daun
) |> mutate( faktor1=as.factor(factor1),
             faktor2=as.factor(factor2),
             ulangan=as.factor(ulangan)
             Kadar_kalium_daun= as.factor(kadae_kalium_daun)
