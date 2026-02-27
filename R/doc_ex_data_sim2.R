#' Données changement climatique - SIM quotidienne (extrait pédagogique)
#'
#' `ex_data_sim2` est un jeu de données d'exemple des données quotidiennes du modèle de simulation des schémas de surface (Safran - Isba).
#' Il contient un sous-ensemble spatial de points sur une période 1958-2026. Ce jeu est fourni à des fins pédagogiques pour illustrer l'utilisation des fonctions du package.
#'
#' @docType data
#' @name ex_data_sim2
#' @format A data frame with 98624 rows and 8 variables:
#' \describe{
#'   \item{LAMBX}{Coordonnée X (projection Lambert II étendue)}
#'   \item{LAMBY}{Coordonnée Y (projection Lambert II étendue)}
#'   \item{DATE}{Date (AAAAMMJJ)}
#'   \item{PRENEI}{Précipitations solides - cumul quotidien ]06UTC-06UTC] (mm)}
#'   \item{PRELIQ}{Précipitations liquides - cumul quotidien ]06UTC-06UTC] (mm)}
#'   \item{T}{Température - moyenne quotidienne ]00UTC-00UTC] (°C)}
#'   \item{TINF_H}{Température minimale des 24 températures horaires - période ]18UTC-18UTC] (°C)}
#'   \item{TSUP_H}{Température maximale des 24 températures horaires - période ]06UTC-06UTC] (°C)}
#' }
#' @source Météo-France Données changement climatique - SIM quotidienne https://www.data.gouv.fr/datasets/donnees-changement-climatique-sim-quotidienne
#' @examples
#' data(ex_data_sim2)
#' head(ex_data_sim2)
"ex_data_sim2"
