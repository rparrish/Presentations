#'
#' Demo of RStudio


tax_rate <- .08

item <- c("soda", "sandwich", "book")

prices <- c(1.50, 6.35, 34.95)

tax <- prices * tax_rate
tax


add_tax <- function(price, tax_rate) {
    round(price + (price * tax_rate), 2)
}


subtotal <- add_tax(prices, tax_rate)
subtotal

invoice <- data.frame(item, prices, subtotal)
invoice
