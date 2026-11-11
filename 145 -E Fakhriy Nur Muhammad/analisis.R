
# Nama Lengkap  :FAKHRIY NUR MUHAMMAD
# NPM           :255001111145
# Kelas         :E

# ==================== Buat analisis anda dibawah ini ==================== #
if (!("pacman" %in% installed.packages())) {
  isntall.packages("pacman")
}
pacman::p_load(dplyr, tibble, agricolae, openxlsx)

library(dplyr)
library(tibble)
library(agricolae)
library(openxlsx)

df < - read.xlsx("data.xlsx", sheet = "sheet1")

model < - aov(luas_daun ~ faktor1 * faktor2 + ulangan, data) = df

df | > str()



df |> summary()
