
# Nama Lengkap  :SHIFA NUR ASTI'AH
# NPM           :255001111007
# Kelas         :C

# ==================== Buat analisis anda dibawah ini ==================== #


pacman::p_load(dplyr, tibble, agricolae, openxlsx)

data_jumlah_biomassa <- read_xlsx("data.xlsx")
summary(data_jumlah_biomassa)
str(data_jumlah_biomassa)

data_shifa <- data_jumlah_biomassa|>
  mutate(
    f1= as.factor(jumlah_benih),
    f2= as.factor(jenis_poc),
    ulangan= as.factor(ulangan)
  )
jumlah_biomassa <- aov (jumlah_biomassa ~ f1 * f2 + ulangan,
                        data = data_shifa)
summary(jumlah_biomassa)

dmrt_ulangan <- duncan.test(jumlah_biomassa, trt = c ("ulangan"))
dmrt_ulangan $groups

dmrt_interaksi <- duncan.test(jumlah_biomassa, trt= c ("f1","f2"))
dmrt_interaksi $groups





