
# Nama Lengkap  :MOHAMMAD DWI ARDIANSYAH
# NPM           :255001111157
# Kelas         :E

# ==================== Buat analisis anda dibawah ini ==================== #

if(!("pacman" %in% installed.packages())){
  install.packages("pacman")
}
pacman::p_load(agricolae, dplyr, openxlsx)
#Input data'
data <- read_xlsx("data.xlsx" , sheet = "Sheet1")
summary(data)
str(data)
dar<-data|>
  rename(
    f1 = konsentrasi_
  )
