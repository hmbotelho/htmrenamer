# Helper functions for unit testing

helloworld <- function() "hello"

# Downloads test data available locally
copy_test_data1 <- function(testfolder, zip_raw_path, delete_zip_files = TRUE){
    
    # Initialize packages
    library(htmrenamer)
    
    
    # Initialize variables
    testfolder        <- gsub("\\\\", "/", testfolder)
    zip_raw_path_from <- zip_raw_path
    zip_raw_path_to   <- paste0(testfolder, "/", basename(zip_raw_path))
    unzipped_raw_path <- paste0(testfolder, "/raw")
    infile_path       <- paste0(testfolder, "/testplate.txt")
    
    
    # Initialize test folder
    if(dir.exists(testfolder)){
        if(dir.exists(unzipped_raw_path)) unlink(unzipped_raw_path, recursive = T)
        if(file.exists(zip_raw_path_to)) unlink(zip_raw_path_to, recursive = T)
        if(file.exists(infile_path)) unlink(infile_path, recursive = T)
    } else{
        dir.create(testfolder, recursive = T)
    }
    
    
    # Copy test data
    file.copy(from = zip_raw_path_from, to = zip_raw_path_to)
    
    
    # Unzip files
    unzip(zipfile = zip_raw_path_to, exdir = testfolder)
    if(delete_zip_files){
        unlink(zip_raw_path_to)
    }
}

# Downloads test data available locally
copy_test_data2 <- function(testfolder, zip_raw_path, zip_ren_path, delete_zip_files = TRUE){
    
    # Initialize packages
    library(htmrenamer)
    
    
    # Initialize variables
    testfolder        <- gsub("\\\\", "/", testfolder)
    zip_raw_path_from <- zip_raw_path
    zip_raw_path_to   <- paste0(testfolder, "/", basename(zip_raw_path))
    zip_ren_path_from <- zip_ren_path
    zip_ren_path_to   <- paste0(testfolder, "/", basename(zip_ren_path))
    unzipped_raw_path <- paste0(testfolder, "/raw")
    unzipped_ren_path <- paste0(testfolder, "/renamed")
    infile_path       <- paste0(testfolder, "/testplate.txt")
    
    
    # Initialize test folder
    if(dir.exists(testfolder)){
        if(dir.exists(unzipped_raw_path)) unlink(unzipped_raw_path, recursive = T)
        if(dir.exists(unzipped_ren_path)) unlink(unzipped_ren_path, recursive = T)
        if(file.exists(zip_raw_path_to)) unlink(zip_raw_path_to, recursive = T)
        if(file.exists(zip_ren_path_to)) unlink(zip_ren_path_to, recursive = T)
        if(file.exists(infile_path)) unlink(infile_path, recursive = T)
    } else{
        dir.create(testfolder, recursive = T)
    }
    
    
    # Copy test data
    file.copy(from = zip_raw_path_from, to = zip_raw_path_to)
    file.copy(from = zip_ren_path_from, to = zip_ren_path_to)
    
    
    # Unzip files
    unzip(zipfile = zip_raw_path_to, exdir = testfolder)
    unzip(zipfile = zip_ren_path_to, exdir = testfolder)
    if(delete_zip_files){
        unlink(zip_raw_path_to)
        unlink(zip_ren_path_to)
    }
}

# Copy test data available online
download_test_data1 <- function(testfolder, zip_raw_url, delete_zip_files = TRUE){
    
    # Initialize packages
    library(htmrenamer)
    
    
    # Initialize variables
    testfolder        <- gsub("\\\\", "/", testfolder)
    zip_raw_path      <- paste0(testfolder, "/", basename(zip_raw_url))
    unzipped_raw_path <- paste0(testfolder, "/raw")
    infile_path       <- paste0(testfolder, "/testplate.txt")
    
    
    # Initialize test folder
    if(dir.exists(testfolder)){
        if(dir.exists(unzipped_raw_path)) unlink(unzipped_raw_path, recursive = T)
        if(file.exists(zip_raw_path)) unlink(zip_raw_path, recursive = T)
        if(file.exists(infile_path)) unlink(infile_path, recursive = T)
    } else{
        dir.create(testfolder, recursive = T)
    }
    
    
    # Download test data
    download.file(url=zip_raw_url,destfile = zip_raw_path, method = "auto")
    
    
    # Unzip files
    unzip(zipfile = zip_raw_path, exdir = testfolder)
    if(delete_zip_files){
        unlink(zip_raw_path)
    }
}

# Copy test data available online
download_test_data2 <- function(testfolder, zip_raw_url, zip_ren_url, delete_zip_files = TRUE){
    
    # Initialize packages
    library(htmrenamer)
    
    
    # Initialize variables
    testfolder        <- gsub("\\\\", "/", testfolder)
    zip_raw_path      <- paste0(testfolder, "/", basename(zip_raw_url))
    zip_ren_path      <- paste0(testfolder, "/", basename(zip_ren_url))
    unzipped_raw_path <- paste0(testfolder, "/raw")
    unzipped_ren_path <- paste0(testfolder, "/renamed")
    infile_path       <- paste0(testfolder, "/testplate.txt")
    
    
    # Initialize test folder
    if(dir.exists(testfolder)){
        if(dir.exists(unzipped_raw_path)) unlink(unzipped_raw_path, recursive = T)
        if(dir.exists(unzipped_ren_path)) unlink(unzipped_ren_path, recursive = T)
        if(file.exists(zip_raw_path)) unlink(zip_raw_path, recursive = T)
        if(file.exists(zip_ren_path)) unlink(zip_ren_path, recursive = T)
        if(file.exists(infile_path)) unlink(infile_path, recursive = T)
    } else{
        dir.create(testfolder, recursive = T)
    }
    
    
    # Download test data
    download.file(url=zip_raw_url,destfile = zip_raw_path, method = "auto")
    download.file(url=zip_ren_url,destfile = zip_ren_path, method = "auto")
    
    
    # Unzip files
    unzip(zipfile = zip_raw_path, exdir = testfolder)
    unzip(zipfile = zip_ren_path, exdir = testfolder)
    if(delete_zip_files){
        unlink(zip_raw_path)
        unlink(zip_ren_path)
    }
}

# Check if data is the same
compare_datasets <- function(dir1, dir2, exclude_regex = "/renamer\\.log$"){
    
    # Initialize packages
    library(tools)
    
    
    # Initialize variables
    output <- character()                                             # This variable will contain all mismatches between the standard and test datasets
    files1 <- list.files(dir1, recursive = T, full.names = T)
    files1 <- files1[!grepl(exclude_regex, files1)]          # This file may change depenging on the machine this code is run on
    files1 <- sort(files1)
    files2 <- list.files(dir2, recursive = T, full.names = T)
    files2 <- files2[!grepl(exclude_regex, files2)]          # This file may change depenging on the machine this code is run on
    files2 <- sort(files2)
    
    # Check number of files
    if(length(files1) != length(files2)){
        output <- c(output, paste0("Different number of files in the datasets. [dir1]: ", length(files1), " files. [dir2]: ", length(files1), " files."))
    }
    
    # Check file identity
    for(i in 1:length(files1)){
        file1 <- files1[i]
        file2 <- sub(paste0("^", dir1), dir2, files2[i])
        
        if(!all(file.exists(file1), file.exists(file2))){
            output <- c(output, paste0("wrong correspondence: '", file1, "' & '", file2, "'"))
        }
        
        if(md5sum(file1) != md5sum(file2)){
            output <- c(output, paste0("Files are not identical: '", file1, "' & '", file2, "'"))
        }
        
    }
    
    output
}