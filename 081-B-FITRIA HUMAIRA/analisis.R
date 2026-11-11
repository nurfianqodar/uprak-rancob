
# Nama Lengkap  : FITRIA HUMAIRA
# NPM           : 255001111081
# Kelas         : B

# ==================== Buat analisis anda dibawah ini ==================== #


library (openxlsx)

df <- read.xlsx("081-B-FITRIA HUMAIRA.xlsx", sheet = 1)
df <- df

mutate (
interval_pemupukan = as.factor (interval_pemupukan),
jenis_insektisida = as.factor (jenis_insektisida),
ulangan = as.factor (ulangan)
)

model <- aov(
laju_fotosintesis ~ ulangan +
interval_pemupukan
jenis_insektisida,
data = df

summary(model)






