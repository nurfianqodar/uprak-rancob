
# Nama Lengkap  :RAISSA HERIDYA PUTRI
# NPM           :255001111016
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #
if (!requiredNamespace("pacman", quietly = TRUE)) {
  install.packages("pacman")
pacman::p_load(agricolae, openxlsx, dplyr)
df <- read.xlsx("data.xlsx","sheet = 1")
str(df)
head(df)
summary(df)

df <- df |>
mutate(
ulangan = as.factor(ulangan),
faktor1 = as.factor(faktor1),
faktor2 = as.factor(faktor2)
)
model <- aov(
hasil ~ ulangan + faktor1 * faktor 2,
data = df
)

summary (model)

