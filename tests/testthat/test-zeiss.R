# context("renaming files and checking results - Zeiss")
setwd("C:/users/Hugo/documents/GitHub/htmrenamer")


test_that("renaming confocal files", {
    
    
    # Initialize packages
    library(htmrenamer)
    library(XML)
    library(xlsx)
    library(tiff)
    library(tools)
    
    # Test data
    path_dataset_raw     <- "./sample_data/Zeiss/confocal_raw/images"
    path_dataset_renamed <- "./sample_data/Zeiss/confocal_renamed/zeiss"
    path_infile          <- "./sample_data/Zeiss/zeiss.txt"
    
    # Set up folders which will contain test results
    plate_name <- sub("\\..*?$", "", basename(path_infile))
    testfolder      <- tempdir()
    if(dir.exists(paste0(testfolder, "/plate_name"))) unlink(testfolder, recursive = T)
    if(!dir.exists(testfolder)) dir.create(testfolder, recursive = T)
    
    
    
    # Rename files
    rename_zeiss(sourcefolder = path_dataset_raw,
                 targetfolder = testfolder,
                 infilepath = path_infile,
                 numrow = 8, 
                 numcol = 12, 
                 REGEXvalidimages = "^.*?s.*?t.*?\\.tif$", 
                 REGEXscenenum = "^.*/.*_s(.*)t.*\\.tif$", 
                 REGEXtimenum = "^.*/.*_s.*t(.*)\\.tif$", 
                 printToGUI = FALSE, 
                 move = FALSE)
    
    
    # Get checksums
    
    dataset_dir   <- paste0(testfolder, "/", plate_name)
    tarfile       <- paste0(testfolder, "/images.tar")
    
    # Test dataset
    files_test    <- list.files(dataset_dir, pattern = ".*tif$", full.names = T, include.dirs = T, recursive = T)
    files_test    <- files_test[!grepl("renamer\\.log$", files_test)]          # Exclude log file (this file may change depenging on the machine this code is run on)
    if(file.exists(tarfile)) unlink(tarfile)
    tar(tarfile, files_test)
    checksum_test <- md5sum(tarfile)
    unlink(dataset_dir, recursive = T)        # Delete test dataset
    unlink(tarfile)                           # Delete tar of test dataset
    
    # Reference dataset
    file.copy(path_dataset_renamed, dirname(dataset_dir), recursive = T)        # Copy reference dataset to the same context as the test dataset
    files_ref     <- list.files(dataset_dir, pattern = ".*tif$", full.names = T, include.dirs = T, recursive = T)
    files_ref     <- files_ref[!grepl("renamer\\.log$", files_ref)]          # Exclude log file (this file may change depenging on the machine this code is run on)
    if(file.exists(tarfile)) unlink(tarfile)
    tar(tarfile, files_ref)
    checksum_ref <- md5sum(tarfile)
    unlink(dataset_dir, recursive = T)        # Delete reference dataset
    unlink(tarfile)                           # Delete tar of reference dataset
    
    
    # Compare checksums
    expect_match(checksum_ref, checksum_test)
    
})
