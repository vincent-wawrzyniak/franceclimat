library(dplyr)

##########################################################################################################################################################################
# Données quotidiennes : SIM - Dataset pédagogique ex_data_sim2

library(DBI)
library(duckdb)
library(usethis)

# --------------------------------------------------------------------
# 1️⃣ Extraction depuis le parquet avec DuckDB
# --------------------------------------------------------------------
con <- dbConnect(duckdb())

ex_data_sim2 <- dbGetQuery(con, "
  SELECT t.LAMBX, t.LAMBY, t.DATE, t.PRENEI, t.PRELIQ, t.T, t.TINF_H, t.TSUP_H
  FROM read_parquet('C:/workspace/sim/ALL_sim2.parquet') t
  INNER JOIN (
    VALUES
      (7880, 20890),
      (7960, 20890),
      (7880, 20810),
      (7960, 20810)
  ) AS pts(LAMBX, LAMBY)
  ON t.LAMBX = pts.LAMBX
  AND t.LAMBY = pts.LAMBY
")

dbDisconnect(con, shutdown = TRUE)

# --------------------------------------------------------------------
# 2️⃣ Sauvegarde du dataset dans data/ (format .rda)
# --------------------------------------------------------------------
usethis::use_data(ex_data_sim2, overwrite = TRUE)

# --------------------------------------------------------------------
# 3️⃣ Écriture de la doc Roxygen complète dans R/
# --------------------------------------------------------------------
doc_file <- "R/doc_ex_data_sim2.R"

cat(
  "#' Données changement climatique - SIM quotidienne (extrait pédagogique)
#'
#' `ex_data_sim2` est un jeu de données d'exemple des données quotidiennes du modèle de simulation des schémas de surface (Safran - Isba).
#' Il contient un sous-ensemble spatial de points sur une période 1958-2026. Ce jeu est fourni à des fins pédagogiques pour illustrer l'utilisation des fonctions du package.
#'
#' @docType data
#' @name ex_data_sim2
#' @format A data frame with 98624 rows and 8 variables:
#' \\describe{
#'   \\item{LAMBX}{Coordonnée X (projection Lambert II étendue)}
#'   \\item{LAMBY}{Coordonnée Y (projection Lambert II étendue)}
#'   \\item{DATE}{Date (AAAAMMJJ)}
#'   \\item{PRENEI}{Précipitations solides - cumul quotidien ]06UTC-06UTC] (mm)}
#'   \\item{PRELIQ}{Précipitations liquides - cumul quotidien ]06UTC-06UTC] (mm)}
#'   \\item{T}{Température - moyenne quotidienne ]00UTC-00UTC] (°C)}
#'   \\item{TINF_H}{Température minimale des 24 températures horaires - période ]18UTC-18UTC] (°C)}
#'   \\item{TSUP_H}{Température maximale des 24 températures horaires - période ]06UTC-06UTC] (°C)}
#' }
#' @source Météo-France Données changement climatique - SIM quotidienne https://www.data.gouv.fr/datasets/donnees-changement-climatique-sim-quotidienne
#' @examples
#' data(ex_data_sim2)
#' head(ex_data_sim2)
\"ex_data_sim2\"
",
  file = doc_file
)

##########################################################################################################################################################################
#




##########################################################################################################################################################################
# Données quotidiennes : SIM

library(DBI)
library(duckdb)

con <- dbConnect(duckdb())

# 4 points sur le secteur de Lyon

ex_data_sim2 <- dbGetQuery(con, "
  SELECT t.LAMBX, t.LAMBY, t.DATE, t.PRENEI, t.PRELIQ, t.T, t.TINF_H, t.TSUP_H
  FROM read_parquet('C:/workspace/sim/ALL_sim2.parquet') t
  INNER JOIN (
    VALUES
      (7880, 20890),
      (7960, 20890),
      (7880, 20810),
      (7960, 20810)
  ) AS pts(LAMBX, LAMBY)
  ON t.LAMBX = pts.LAMBX
  AND t.LAMBY = pts.LAMBY
")

dbDisconnect(con, shutdown = TRUE)

# Ajout donnees dans le fichier data (format rda)
usethis::use_data(ex_data_sim2, overwrite = TRUE)

##########################################################################################################################################################################
#