# context("testing infile generatiors")
setwd("C:/users/Hugo/documents/GitHub/htmrenamer")


test_that("96 well plate infile - genreated as data frame", {
    
    # Initialize packages
    library(htmrenamer)
    
    # Load test infile
    infile_target_path <- "./sample_data/Leica/leica.txt"
    infile_target <- read.infile.df(infile_target_path)
    
    # Generate infile with htmrenamer
    infile_test <- newinfile.df(numrow = 8, numcol = 12, show = FALSE)
    infile_test$data1 <- paste0("compound", formatC(rep(1:12, 8), width = 2, flag = "0"))
    infile_test$data2 <- paste0(rep(0:7, each = 12), "uM")
    
    expect_identical(infile_target, infile_test)
    
})