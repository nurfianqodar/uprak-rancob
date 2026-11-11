
# Nama Lengkap  :Samuel Heryawan Tamba
# NPM           :255001111029
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #

if(!requireNamespace("pacman", quietly = TRUE)) {install.packages("pacman")}
pacman::p_load(agricolae, openxlsx, dplyr)

df <- read.xlsx("data.xlsx", sheet = 1)
str(df)
head(df)
summary(df)

df <- df |> mutate(lama_penyinaran = as.factor(lama_penyinaran), jenis_benih = as.factor(jenis_benih), ulangan= as.factor(ulangan))
summary(df)

model <- aov(indeks_luas_daun ~ ulangan + lama_penyinaran * jenis_benih, data= df)
summary(model)

df_error <- df.residual(model)
ms_error <- deviance(model) / df_error

for (lv in levels(df$lama_penyinaran)) {cat("\nlama_penyinaran pada Jenis-benih")
  sub <- droplevels(df[df$jenis_benih==lv])
  res <- duncan.test(sub$indeks_luas_daun, DFerror = df_error, MSerror = ms_error, alpha = 0,05)
  }

for (lv in levels(df$jenis_benih)) {cat("\njenis_benih pada lama_penyinaran")
  sub <- droplevels(df[df$lama_penyinaran==lv])
  res <- duncan.test(sub$indeks_luas_daun, DFerror = df_error, MSerror = ms_error, alpha = 0,05)
  }
