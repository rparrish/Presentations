#'
#' Demo of RStudio

#' @param price the price for an item
#' @param tax_rate the tax rate as a decimal
#'
#' export



add_tax <- function(price, tax_rate) {
    round(price + (price * tax_rate), 2)
}


