#' Install and load dependencies
#'
#' Makes sure the target package is both installed and loaded into memory. Avoids unnecessary re-installs and re-loadings
#'
#' @param pckgname character, package name.
#'
#' @return \code{TRUE} if package is loaded successfully. \code{FALSE} otherwise.
#'
setup.dependency <- function(pckgname){

    # If the package is not installed, install it
    if(!(pckgname %in% installed.packages())){
        install.packages(pckgname)
    }

    # If the package is not loaded, load it.
    if(!(pckgname %in% loadedNamespaces())){
        library(pckgname, character.only = TRUE)
    }

    pckgname %in% loadedNamespaces()
}




#' Create empty infile (data frame)
#'
#' Creates an empty microscope infile template, which can be printed to the console and/or saved as a file.
#' The output is structured as a data frame.
#' See the \strong{Note} section for a description of the infile structure.
#'
#' @param numrow integer, the number of rows in the multiwell plate. The default value is 8 (i.e. 96 well plate).
#' @param numcol integer, the number of columns in the multiwell plate. The default value is 12 (i.e. 96 well plate).
#' @param show logical, indicating whether or not to print the result to the console.
#' @param saveto character. If specified, the empty infile template is saved in a file at this location.
#'
#' @return Data frame with empty infile template.
#'
#' @note The microscope infile is a text file with the following structure:\cr
#'
#'     \code{001--A--01--00--00--data1--data2}\cr
#'     \code{002--A--02--01--00--data1--data2}\cr
#'     \code{003--A--03--02--00--data1--data2}\cr
#'
#' In the infile, metadata fields are separated by a double dash (\code{--}). The meaning of the metadata fields is the following:
#' \itemize{
#'   \item Well number
#'   \item Row label (A, B, ...)
#'   \item Column label (01, 02, 03, ...)
#'   \item Column label (00, 01, 02, ...)
#'   \item Row label (00, 01, 02, ...)
#'   \item Experimental data 1
#'   \item Experimental data 2
#' }
#'
#' Wells are numbered in ascending order, line by line. In the case of a 96 well plate, wells are numbered as shown:
#'
#' \code{-----1---2---3---4---5---6---7---8---9--10--11--12-}  
#' \code{---------------------------------------------------}  
#' \code{A | 001 002 003 004 005 006 007 008 009 010 011 012}  
#' \code{B | 013 014 015 016 017 018 019 020 021 022 023 024}  
#' \code{C | 025 026 027 028 029 030 031 032 033 034 035 036}  
#' \code{D | 037 038 039 040 041 042 043 044 045 046 047 048}  
#' \code{E | 049 050 051 052 053 054 055 056 057 058 059 060}  
#' \code{F | 061 062 063 064 065 066 067 068 069 070 071 072}  
#' \code{G | 073 074 075 076 077 078 079 080 081 082 083 084}  
#' \code{H | 085 086 087 088 089 090 091 092 093 094 095 096}  
#'
#' The experimental data fields may contain any relevant information describing the well contents.
#'
#' @seealso
#' Function \code{\link{newinfile.char}} creates an empty infile in the form of a character vector.\cr
#' Function \code{\link{read.infile.df}} reads infile text files from disk.\cr
#'
#' @examples
#'
#' # Infile template for a 96 well plate
#' newinfile.df()
#'
#' # Save 384 well plate infile template to the working directory.
#' # The CSV file extension is recommended.
#' newinfile.df(numrow = 16, numcol = 24, saveto = "./infile_template.csv")
#'
#' @export
newinfile.df <- function(numrow = 8, numcol = 12, show = FALSE, saveto = character()){

    # sanity checks
    if(!is.numeric(numrow)) stop("numrow is not numeric")
    if(!is.numeric(numcol)) stop("numcol is not numeric")
    if(numrow - as.integer(numrow) != 0) stop("numrow must be an integer value")
    if(numcol - as.integer(numcol) != 0) stop("numrow must be an integer value")
    if(!is.character(saveto)) stop("saveto must be character")

    numwells <- numrow * numcol

    # Determine how if well numbers should be represented with 3 or 4 digits
    widthwellnums <- ifelse(numwells < 999, 3, 4)

    # Create template (data frame)
    infile.df <- data.frame(WellNum = formatC(1:numwells, width = widthwellnums, flag = "0"),
                            Row     = rep(LETTERS[1:numrow], each=numcol),
                            Column  = formatC(rep(1:numcol, numrow), width = 2, flag = "0"),
                            U_coord = formatC(rep(0:(numcol-1), numrow), width = 2, flag = "0"),
                            V_coord = formatC(rep(0:(numrow-1), each=numcol), width = 2, flag = "0"),
                            data1   = rep("data1", numwells),
                            data2   = rep("data2", numwells),
                            stringsAsFactors = FALSE)

    if(show){
        # print the empty template to the console
        print.data.frame(infile.df, row.names = FALSE)
    }

    if(!missing(saveto)){
        # save the empty template to a text file
        if(!dir.exists(dirname(saveto))){
            dir.create(dirname(saveto), recursive = TRUE)
        }
        write.csv(infile.df, saveto, quote = FALSE, row.names = FALSE)
    }

    # return the infile
    invisible(infile.df)
}









#' Create empty infile (character vector)
#'
#' Creates an empty microscope infile template, which can be printed to the console and/or saved as a file.
#' The output is structured as a character vector.
#' See the \strong{Note} section for a description of the infile structure.
#'
#' @param numrow integer, the number of rows in the multiwell plate. The default value is 8 (i.e. 96 well plate).
#' @param numcol integer, the number of columns in the multiwell plate. The default value is 12 (i.e. 96 well plate).
#' @param show logical, indicating whether or not to print the result to the console.
#' @param saveto character. If specified, the empty infile template is saved in a file at this location.
#'
#' @return Character vector with empty infile template.
#'
#' @note The microscope infile is a text file with the following structure:\cr
#'
#'     \code{001--A--01--00--00--data1--data2}\cr
#'     \code{002--A--02--01--00--data1--data2}\cr
#'     \code{003--A--03--02--00--data1--data2}\cr
#'
#' In the infile, metadata fields are separated by a double dash (\code{--}). The meaning of the metadata fields is the following:
#' \itemize{
#'   \item Well number
#'   \item Row label (A, B, ...)
#'   \item Column label (01, 02, 03, ...)
#'   \item Column label (00, 01, 02, ...)
#'   \item Row label (00, 01, 02, ...)
#'   \item Experimental data 1
#'   \item Experimental data 2
#' }
#'
#' Wells are numbered in ascending order, line by line. In the case of a 96 well plate, wells are numbered as shown:
#'
#' \code{-----1---2---3---4---5---6---7---8---9--10--11--12-}
#' \code{---------------------------------------------------}
#' \code{A | 001 002 003 004 005 006 007 008 009 010 011 012}
#' \code{B | 013 014 015 016 017 018 019 020 021 022 023 024}
#' \code{C | 025 026 027 028 029 030 031 032 033 034 035 036}
#' \code{D | 037 038 039 040 041 042 043 044 045 046 047 048}
#' \code{E | 049 050 051 052 053 054 055 056 057 058 059 060}
#' \code{F | 061 062 063 064 065 066 067 068 069 070 071 072}
#' \code{G | 073 074 075 076 077 078 079 080 081 082 083 084}
#' \code{H | 085 086 087 088 089 090 091 092 093 094 095 096}
#'
#' The experimental data fields may contain any relevant information describing the well contents.
#'
#' @seealso
#' Function \code{\link{newinfile.df}} creates an empty infile in the form of a data frame.\cr
#' Function \code{\link{read.infile.df}} reads infile text files from disk.\cr
#'
#' @examples
#'
#' # Infile template for a 96 well plate
#' newinfile.char()
#'
#' # Save 384 well plate infile template to the working directory.
#' # The TXT file extension is recommended.
#' newinfile.char(numrow = 16, numcol = 24, saveto = "./infile_template.txt")
#'
#' @export
newinfile.char <- function(numrow = 8, numcol = 12, show = FALSE, saveto = character()){

    # sanity checks
    if(!is.numeric(numrow)) stop("numrow is not numeric")
    if(!is.numeric(numcol)) stop("numcol is not numeric")
    if(numrow - as.integer(numrow) != 0) stop("numrow must be an integer value")
    if(numcol - as.integer(numcol) != 0) stop("numrow must be an integer value")
    if(!is.character(saveto)) stop("saveto must be character")

    numwells <- numrow * numcol

    # Determine how if well numbers should be represented with 3 or 4 digits
    widthwellnums <- ifelse(numwells < 999, 3, 4)

    # Create template (character vector)
    WellNum <- formatC(1:numwells, width = widthwellnums, flag = "0")
    Row     <- rep(LETTERS[1:numrow], each=numcol)
    Column  <- formatC(rep(1:numcol, numrow), width = 2, flag = "0")
    U_coord <- formatC(rep(0:(numcol-1), numrow), width = 2, flag = "0")
    V_coord <- formatC(rep(0:(numrow-1), each=numcol), width = 2, flag = "0")
    data1   <- rep("data1", numwells)
    data2   <- rep("data2", numwells)
    infile.char <- sapply(1:numwells, function(i){
        paste(WellNum[i], Row[i], Column[i], U_coord[i], V_coord[i], data1[i], data2[i], sep = "--")
    })

    if(show){
        # print the empty template to the console
        for(i in 1:numwells){
            cat(infile.char[i], "\n")
        }
    }

    if(!missing(saveto)){
        # save the empty template to a text file
        if(!dir.exists(dirname(saveto))){
            dir.create(dirname(saveto), recursive = TRUE)
        }
        writeLines(infile.char, saveto)
    }

    # return the infile
    invisible(infile.char)
}







#' Read microscope infiles
#'
#' Imports a text file representing a microscope infile as a data frame. Skips all lines which do not match the infile structure.
#' See \code{\link{newinfile.df}} or \code{\link{newinfile.char}} for a description of the infile structure.
#'
#' @param infilepath character, the path to the infile.
#'
#' @return Data frame with infile.
#'
#' @seealso
#' Function \code{\link{newinfile.df}} creates an empty infile in the form of a data frame.\cr
#' Function \code{\link{newinfile.char}} creates an empty infile in the form of a character vector.\cr
#'
#' @examples
#'
#' # Create infile in disk
#' tempfile <- tempfile()
#' newinfile.char(saveto = tempfile)
#'
#' # Read infile
#' myinfile <- read.infile.df(tempfile)
#' head(myinfile)
#'
#' # Delete infile file from disk
#' file.remove(tempfile)
#'
#' @export
read.infile.df <- function(infilepath){

    pattern <- "^(\\d\\d\\d\\d?)--([[:upper:]][[:upper:]]?)--(\\d\\d)--(\\d\\d)--(\\d\\d)--(.*?)\\s*--(.*\\S??)\\s*$"

    # Extract information one line at a time.
    # Discards lines which don't match the pattern.
    # Trims trailing whitespaces in 'data1' and 'data2'
    df <- lapply(readLines(infilepath), function(x){

        if(!grepl(pattern, x)) return(NULL)

        data.frame(WellNum = gsub(pattern, "\\1", x),
                   Row     = gsub(pattern, "\\2", x),
                   Column  = gsub(pattern, "\\3", x),
                   U_coord = gsub(pattern, "\\4", x),
                   V_coord = gsub(pattern, "\\5", x),
                   data1   = gsub(pattern, "\\6", x),
                   data2   = gsub(pattern, "\\7", x),
                   stringsAsFactors = FALSE)
    })

    do.call("rbind", df)

}




#' Print to renamer GUI
#'
#' Prints a message to the console and the renamer tool GUI and/or the R console.
#' When printing to the console, just calls the print function.
#' @param message character, the message to be printed.
#' @param printToGUI logical, indicating whether or not to print the message to the gtext widget on the renamer GUI.
#' @param printToConsole logical, indicating whether or not to print the message to the console.
#'
#' @export
echo <- function(message, printToGUI = TRUE, printToConsole = TRUE){
    if(printToConsole) print(message, quote = FALSE)
    if(printToGUI)     insert(logWindow, message)
}
