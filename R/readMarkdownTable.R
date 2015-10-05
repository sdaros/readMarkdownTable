#' Help readMarkdownTable
#'
#' This package will read a markdown formatted table into a data frame.
#' The user must provide the input file and line range of the table.
#' @param file Input file
#' @param start the line number where the table header starts
#' @param end the last line in the table (last observation)
#' @note the file should be given as a character vector (not a connection)
#' @author Stefano Da Ros
#' @export
readMarkdownTable <-
function(file, start, end) {
table <- readLines(file)[start:end]
header <- strsplit(table[1], split="|", fixed = TRUE)[[1]]
data <- read.table(file, skip = (start+1), nrows = (end - start - 1), sep = "|")
names(data) <- trimws(header)
return(data)
}
