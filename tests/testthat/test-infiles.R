library(htmrenamer)
# context("testing infile generatiors")


test_that("96 well plate infile - genreated as data frame", {

    # Initialize
    testdir     <- tempdir()
    infile_path <- paste0(testdir, "/testplate.txt")
    if(file.exists(infile_path)) unlink(infile_path)
    
    # Load test infile
    infile_url  <- "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/01_DMI6000_PC/testplate.txt"
    download.file(url=infile_url,destfile = infile_path, method = "auto")
    
    # Read standard data
    infile_target <- read.infile.df(infile_path)
    
    # Generate infile with htmrenamer
    infile_test       <- newinfile.df(numrow = 8, numcol = 12, show = FALSE)
    infile_test$data1 <- paste0(rep(LETTERS[1:8], each=12), formatC(rep(1:12, 8), width = 2, flag = "0"))
    infile_test$data2 <- formatC(1:96, width = 3, flag = "0")
    
    # Clean up
    if(file.exists(infile_path)) unlink(infile_path)
    
    expect_identical(infile_target, infile_test)
    
})
