library(htmrenamer)
source("./helper_functions.R")
# context("renaming files and checking results - Olympus")



test_that("Renaming Olympus FV1000 confocal files #01: TC dataset", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir,
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/olympus/01_TC/raw.zip",
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/olympus/01_TC/renamed.zip",
                        delete_zip_files = TRUE)

    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    
    rename_olympus(sourcefolder     = path_raw_img, 
                   targetfolder     = testdir, 
                   infilepath       = path_infile, 
                   numrow           = 8, 
                   numcol           = 12, 
                   REGEXvalidimages = "^.*(\\d{4})_(\\d{2}).oib$", 
                   printMessages    = FALSE, 
                   printFiles       = FALSE, 
                   printToGUI       = FALSE, 
                   move             = FALSE)


    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img,
                                   dir2 = path_ren_img,
                                   exclude_regex = "/renamer\\.log$")

    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)

    expect_identical(mismatches, character(0))
})
