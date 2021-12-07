library(htmrenamer)
source("./helper_functions.R")
perform_lengthy_tests <- TRUE
test_compression      <- TRUE
# context("renaming files and checking results - Leica")





test_that("Detect source software: Leica MatrixScreener #01: DMI6000 PC dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/01_DMI6000_PC/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "MatrixScreener")
})

test_that("Detect source software: Leica MatrixScreener #02: DMI6000 PC dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/02_DMI6000_PC/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "MatrixScreener")
})

test_that("Detect source software: Leica MatrixScreener #03: DMI6000 TC dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/03_DMI6000_TC/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "MatrixScreener")
})

test_that("Detect source software: Leica MatrixScreener #04: DMI6000 TC dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/04_DMI6000_TC/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "MatrixScreener")
})

test_that("Detect source software: Leica MatrixScreener #05: DMI6000 TC dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/05_DMI6000_TC/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "MatrixScreener")
})

test_that("Detect source software: Leica MatrixScreener #06: SP8 TC dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/06_SP8_TC/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "MatrixScreener")
})

test_that("Detect source software: Leica MatrixScreener #07: SP8 TC dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/07_SP8_TC/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "MatrixScreener")
})

test_that("Detect source software: Leica MatrixScreener #08: SP8 PC dataset", {
    
    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/08_SP8_PC/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "MatrixScreener")
})





test_that("Detect source software: Leica Navigator #01: PZC dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/01_PZC/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #02: PTZC dataset", {

    skip_if(!perform_lengthy_tests, message = "long test")
    
    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/02_PTZC/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #03: PZC dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/03_PZC/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #04: ZC dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/04_ZC/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #05: C dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/05_C/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #06: TZC dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/06_TZC/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #07: TC dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/07_TC/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #08: PZC, export nothing dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/08_nothing/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #09: PZC, export overlap dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/09_overl/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #10: PZC, export compress dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/10_comp/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #11: PZC, export compress+overlay dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/11_comp_overl/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #12: PZC, export directories dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/12_dir/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #13: PZC, export directories+compress dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/13_dir_comp/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #14: PZC, export directories+compress+overlay dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/14_dir_comp_overl/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #15: PZC, export raw dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/15_raw/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #16: PZC, export raw+directories dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/16_raw_dir/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #17: PZC, export raw+directories+overlay dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/17_raw_dir_overl/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #18: PZC, export raw+directories+compress dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/18_raw_dir_comp/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})

test_that("Detect source software: Leica Navigator #19: PZC, export raw+directories+overlay+compress dataset", {

    # Download data
    testdir     <- tempdir()
    path_infile <- paste0(testdir, "./testplate.txt")
    cat("Test folder:", testdir)
    download_test_data1(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/19_raw_dir_overl_comp/raw.zip", 
                        delete_zip_files = TRUE)
    
    # Test software detection
    path_raw_img  <- paste0(testdir, "/raw")
    software_name <- whichLeicaSoftware(path_raw_img)
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(software_name, "Navigator")
})





test_that("Renaming Leica MatrixScreener #01: DMI6000 PC dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/01_DMI6000_PC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/01_DMI6000_PC/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = FALSE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})

test_that("Renaming Leica MatrixScreener #02: DMI6000 PC dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/02_DMI6000_PC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/02_DMI6000_PC/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = FALSE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})

test_that("Renaming Leica MatrixScreener #03: DMI6000 TC dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/03_DMI6000_TC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/03_DMI6000_TC/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder = path_raw_img, 
                                targetfolder = testdir, 
                                infilepath = path_infile, 
                                compress = FALSE, 
                                move = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages = FALSE, 
                                printFiles = FALSE, 
                                printToGUI = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})

test_that("Renaming Leica MatrixScreener #04: DMI6000 TC dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/04_DMI6000_TC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/04_DMI6000_TC/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = FALSE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})

test_that("Renaming Leica MatrixScreener #05: DMI6000 TC dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/05_DMI6000_TC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/05_DMI6000_TC/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = FALSE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})

test_that("Renaming Leica MatrixScreener #06: SP8 TC dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/06_SP8_TC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/06_SP8_TC/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = FALSE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})

test_that("Renaming Leica MatrixScreener #07: SP8 TC dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/07_SP8_TC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/07_SP8_TC/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = FALSE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})

test_that("Renaming Leica MatrixScreener #08: SP8 PC dataset (no compression)", {
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/08_SP8_PC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/08_SP8_PC/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = FALSE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})





test_that("Renaming Leica Navigator files #01: PZC dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/01_PZC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/01_PZC/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #02: PTZC dataset (no compression)", {

    skip_if(!perform_lengthy_tests, message = "long test")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/02_PTZC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/02_PTZC/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #03: PZC dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/03_PZC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/03_PZC/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #04: ZC dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/04_ZC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/04_ZC/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #05: C dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/05_C/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/05_C/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #06: TZC dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/06_TZC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/06_TZC/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #07: TC dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/07_TC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/07_TC/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #08: PZC, export nothing dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/08_nothing/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/08_nothing/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #09: PZC, export overlap dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/09_overl/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/09_overl/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #10: PZC, export compress dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/10_comp/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/10_comp/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #11: PZC, export compress+overlay dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/11_comp_overl/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/11_comp_overl/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #12: PZC, export directories dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/12_dir/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/12_dir/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #13: PZC, export directories+compress dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/13_dir_comp/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/13_dir_comp/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #14: PZC, export directories+compress+overlay dataset", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/14_dir_comp_overl/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/14_dir_comp_overl/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #15: PZC, export raw dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/15_raw/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/15_raw/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #16: PZC, export raw+directories dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/16_raw_dir/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/16_raw_dir/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #17: PZC, export raw+directories+overlay dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/17_raw_dir_overl/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/17_raw_dir_overl/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #18: PZC, export raw+directories+compress dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/18_raw_dir_comp/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/18_raw_dir_comp/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #19: PZC, export raw+directories+overlay+compress dataset (no compression)", {

    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/19_raw_dir_overl_comp/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/19_raw_dir_overl_comp/renamed.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = FALSE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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





test_that("Renaming Leica MatrixScreener #01: DMI6000 PC dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/01_DMI6000_PC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/01_DMI6000_PC/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = TRUE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})

test_that("Renaming Leica MatrixScreener #02: DMI6000 PC dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/02_DMI6000_PC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/02_DMI6000_PC/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = TRUE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})

test_that("Renaming Leica MatrixScreener #03: DMI6000 TC dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/03_DMI6000_TC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/03_DMI6000_TC/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = TRUE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})

test_that("Renaming Leica MatrixScreener #04: DMI6000 TC dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/04_DMI6000_TC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/04_DMI6000_TC/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = TRUE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})

test_that("Renaming Leica MatrixScreener #05: DMI6000 TC dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/05_DMI6000_TC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/05_DMI6000_TC/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = TRUE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})

test_that("Renaming Leica MatrixScreener #06: SP8 TC dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/06_SP8_TC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/06_SP8_TC/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = TRUE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})

test_that("Renaming Leica MatrixScreener #07: SP8 TC dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/07_SP8_TC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/07_SP8_TC/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = TRUE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})

test_that("Renaming Leica MatrixScreener #08: SP8 PC dataset (lossless compression)", {
    
    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/08_SP8_PC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_matrixscreener/08_SP8_PC/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_matrixscreener(sourcefolder      = path_raw_img, 
                                targetfolder      = testdir, 
                                infilepath        = path_infile, 
                                compress          = TRUE, 
                                move              = FALSE, 
                                outputDescriptors = TRUE, 
                                printMessages     = FALSE, 
                                printFiles        = FALSE, 
                                printToGUI        = FALSE)
    
    # Compare outputs
    path_ren_img <- paste0(testdir, "/testplate")
    path_ref_img <- paste0(testdir, "/renamed")
    mismatches <- compare_datasets(dir1 = path_ref_img, 
                                   dir2 = path_ren_img, 
                                   exclude_regex = "(/renamer\\.log$|\\.csv$|\\.xlsx$)")
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_active.csv")), file.exists(paste0(testdir, "/testplate/Fields_active.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_active.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/Fields_all.csv")), file.exists(paste0(testdir, "/testplate/Fields_all.csv")))){
        mismatches <- c(mismatches, "missing 'Fields_all.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_channels.xlsx")), file.exists(paste0(testdir, "/testplate/settings_channels.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_channels.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_filenames.csv")), file.exists(paste0(testdir, "/testplate/settings_filenames.csv")))){
        mismatches <- c(mismatches, "missing 'settings_filenames.csv'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/settings_jobs.xlsx")), file.exists(paste0(testdir, "/testplate/settings_jobs.xlsx")))){
        mismatches <- c(mismatches, "missing 'settings_jobs.xlsx'")
    }
    if(!all(file.exists(paste0(testdir, "/renamed/template_properties.csv")), file.exists(paste0(testdir, "/testplate/template_properties.csv")))){
        mismatches <- c(mismatches, "missing 'template_properties.csv'")
    }
    
    # Clean up
    if(dir.exists(path_raw_img)) unlink(path_raw_img, recursive = T)
    if(dir.exists(path_ren_img)) unlink(path_ren_img, recursive = T)
    if(dir.exists(path_ref_img)) unlink(path_ref_img, recursive = T)
    if(file.exists(path_infile)) unlink(path_infile)
    
    expect_identical(mismatches, character(0))
})





test_that("Renaming Leica Navigator files #01: PZC dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/01_PZC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/01_PZC/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #02: PTZC dataset (lossless compression)", {

    skip_if(!perform_lengthy_tests, message = "long test")
    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/02_PTZC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/02_PTZC/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #03: PZC dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/03_PZC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/03_PZC/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #04: ZC dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/04_ZC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/04_ZC/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #05: C dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/05_C/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/05_C/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #06: TZC dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/06_TZC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/06_TZC/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #07: TC dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/07_TC/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/07_TC/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #08: PZC, export nothing dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/08_nothing/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/08_nothing/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #09: PZC, export overlap dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/09_overl/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/09_overl/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #10: PZC, export compress dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/10_comp/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/10_comp/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #11: PZC, export compress+overlay dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/11_comp_overl/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/11_comp_overl/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #12: PZC, export directories dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/12_dir/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/12_dir/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #13: PZC, export directories+compress dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/13_dir_comp/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/13_dir_comp/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #14: PZC, export directories+compress+overlay dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/14_dir_comp_overl/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/14_dir_comp_overl/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #15: PZC, export raw dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/15_raw/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/15_raw/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #16: PZC, export raw+directories dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/16_raw_dir/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/16_raw_dir/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #17: PZC, export raw+directories+overlay dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/17_raw_dir_overl/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/17_raw_dir_overl/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #18: PZC, export raw+directories+compress dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/18_raw_dir_comp/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/18_raw_dir_comp/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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

test_that("Renaming Leica Navigator files #19: PZC, export raw+directories+overlay+compress dataset (lossless compression)", {

    skip_if(!test_compression, message = "will not test compression")
    
    # Download data
    testdir <- tempdir()
    cat("Test folder:", testdir)
    download_test_data2(testfolder = testdir, 
                        zip_raw_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/19_raw_dir_overl_comp/raw.zip", 
                        zip_ren_url = "https://github.com/hmbotelho/htmrenamer_testdata/raw/master/leica_navigator/19_raw_dir_overl_comp/renamed_deflate.zip", 
                        delete_zip_files = TRUE)
    
    # Rename files
    path_raw_img <- paste0(testdir, "/raw")
    path_infile  <- paste0(testdir, "/testplate.txt")
    rename_leica_navigator(sourcefolder      = path_raw_img, 
                           targetfolder      = testdir, 
                           infilepath        = path_infile, 
                           compress          = TRUE, 
                           move              = FALSE, 
                           outputDescriptors = TRUE, 
                           printMessages     = FALSE, 
                           printFiles        = FALSE, 
                           printToGUI        = FALSE)
    
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
