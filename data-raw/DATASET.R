library(dplyr)

##########################################################################################################################################################################
# Données quotidiennes : T

data = read.table("C:/workspace/sim/QUOT_SIM2_1958-1959.csv",
                     header = TRUE, sep = ";", dec = ".")

ex_data_sim2 = data %>%
  select(LAMBX, LAMBY, DATE, T) %>%
  filter(LAMBX > 6000 & LAMBX < 7000)

usethis::use_data(ex_data_sim2, overwrite = TRUE)

checkhelper::use_data_doc(
  name = "ex_data_sim2"
)

##########################################################################################################################################################################
#