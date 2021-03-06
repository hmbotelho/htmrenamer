% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generic.R
\name{read.infile.df}
\alias{read.infile.df}
\title{Read microscope infiles}
\usage{
read.infile.df(infilepath)
}
\arguments{
\item{infilepath}{character, the path to the infile.}
}
\value{
Data frame with infile.
}
\description{
Imports a text file representing a microscope infile as a data frame. Skips all lines which do not match the infile structure.
See \code{\link{newinfile.df}} or \code{\link{newinfile.char}} for a description of the infile structure.
}
\examples{

# Create infile in disk
tempfile <- tempfile()
newinfile.char(saveto = tempfile)

# Read infile
myinfile <- read.infile.df(tempfile)
head(myinfile)

# Delete infile file from disk
file.remove(tempfile)

}
\seealso{
Function \code{\link{newinfile.df}} creates an empty infile in the form of a data frame.\cr
Function \code{\link{newinfile.char}} creates an empty infile in the form of a character vector.\cr
}
