
# Nama Lengkap  : KEISYA NANDYA LESTARI
# NPM           : 255001111116
# Kelas         : E

# ==================== Buat analisis anda dibawah ini ==================== #
if (!("pacman"))%in% (installed.packages)) (install.packages("pacman"))

pacman::p_load(dplyr, agricolae, openxlxs)

df <- read.xlsx("data.xlsx, sheet = "1")


#Meringkas data
df |> str()

df |> summary()

#Merapikan data
df <- df |>
 rename(
 faktor1 = f1,
 faktor2 = f2,
 ulangan = rep
 ) |>
 mutate(
 faktor1 = as.factor(faktor1),
 faktor2 = as.factor(faktor2),
 ulangan = as.faktor(ulangan
 )

 #Meninjau ulang data
 df |> str()

 df |> summary()

 #ANOVA
 model <- aov(serapan_fosfor ~ faktor1 = faktor2 + ulangan, data = df)

 model |. summary()


 # uji lanjut semua faktor 1 pada setiap faktor 2
 faktor2 <- df df faktor2 |>
 unique(

 faktor2

 for (f in faktor 2) {
 dd <- df |>
 filter(faktor2 = f)
 model






