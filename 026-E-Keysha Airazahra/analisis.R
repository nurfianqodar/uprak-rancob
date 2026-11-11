
# Nama Lengkap  :KEYSHA AIRAZAHRA
# NPM           :255001111026
# Kelas         :E

# ==================== Buat analisis anda dibawah ini ==================== #
install.packages("pacman")

pacman::p_load(dplyr, tibble, agricolae, openxlsx)
df <- read.xlsx("data.xlsx", sheet = "1")

df > str()
df >summary()

df<- df >
  rename(data)
    faktor1 = varietas
    faktor2 = ulangan
    faktor3 = kadar_nitrogen_daun
  ) >
  mutate()
    faktor1 = as.factor(faktor1),
    faktor2 = as.factor(faktor2),
    ulangan = ulangan
  )
df > str()

df > summary()

model <- aov (faktor1 * faktor2 + ulangan, data = df)

model > summary()

faktor2 <- df$faktor2 >

  unique(

faktor2

for (f in faktor2) {}
  dd <- df >
    filter(faktor2 == f)
  model <- aov(kadar_nitrogen_daun ~ faktor1, data = dd)
  dmrt <- duncan.test(model,trt = "faktor1")
  tabel <- dmrt$groups >
  rownames_to_column("faktor1")

  paste0("faktor 1 pada kadar_nitrogen_daun",f,"n") > cat(sep = "")

  print(tabel)

  cat("\n\")
  )
