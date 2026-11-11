
# Nama Lengkap  :DEA MAULIDA PUTRI
# NPM           :255001111092
# Kelas         : B

# ==================== Buat analisis anda dibawah ini ==================== #

install.packages ( character.only = TRUE)

pacman::p_load (agricolae, dplyr, tibble, open.xlsx)

data <- read.xlsx (sheet = 1)

view (data)
str (data)

# 1. RAL
## 1.1 pratinjau data
### muat data


# memuat data

df <- df|> mutate (ulangan = as.character (ulangan) )

df <- summary ()

df <-
  is.na () |>
  colsums

data$perlakuan <- interaction (factor 1, factor 2)

model <- aov









