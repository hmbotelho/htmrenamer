#' Olympus renamer GUI
#'
#' Displays the renamer tool GUI for Olympus OIB files.
#' The actual renaming process is performed by function rename_olympus().
#'
#' @return Null
#'
#' @seealso
#' \code{\link{rename_olympus}} is the function which implements the actual renaming algorithm.\cr
#' \code{\link{rename_leica_gui}} for the Leica renamer GUI.\cr
#' \code{\link{rename_zeiss_gui}} for the Zeiss renamer GUI.\cr
#'
#' @export
#' @importFrom gWidgets2 addSpace gbutton ggroup glabel gprogressbar gspinbutton gtext gwindow insert svalue
#' @importFrom tcltk tk_choose.dir tk_choose.files
#' @import utils
#' 
rename_olympus_gui <- function(){
    
    # library(gWidgets2tcltk)
    # library(utils)
    
    #####################################################################################################
    # Initialize variables
    #####################################################################################################
    sourcefolder <- "<not specified>"
    targetfolder <- "<not specified>"
    infile <- "<not specified>"
    plate <- "96 well"
    
    
    
    #####################################################################################################
    # Construct dialog box
    #####################################################################################################
    
    # Launch dialog box
    mainWindow <- gWidgets2::gwindow(paste0("Olympus File Renamer Tool    -    htmrenamer v", utils::packageVersion("htmrenamer")))
    size(mainWindow) <- c(300,660)
    
    # Define groups
    groupMainWindow    <- gWidgets2::ggroup(spacing = 0, horizontal = FALSE, container = mainWindow)
    groupTopButtons    <- gWidgets2::ggroup(spacing = 1, container = groupMainWindow)
    groupWellLayout    <- gWidgets2::ggroup(spacing = 1, horizontal = FALSE, container = groupMainWindow)
    groupWellLayoutR   <- gWidgets2::ggroup(spacing = 1, container = groupWellLayout)
    groupWellLayoutC   <- gWidgets2::ggroup(spacing = 1, container = groupWellLayout)
    groupLabels1       <- gWidgets2::ggroup(spacing = 1, container = groupMainWindow)
    groupLabels2       <- gWidgets2::ggroup(spacing = 1, container = groupMainWindow)
    groupLabels3       <- gWidgets2::ggroup(spacing = 1, container = groupMainWindow)
    groupLabels4       <- gWidgets2::ggroup(spacing = 1, container = groupMainWindow)
    groupLog           <- gWidgets2::ggroup(horizontal = FALSE, container = groupMainWindow)
    groupProgressBar   <- gWidgets2::ggroup(spacing = 1, horizontal = FALSE, container = groupMainWindow)
    groupBottomButtons <- gWidgets2::ggroup(horizontal = FALSE, container = groupMainWindow)
    
    
    # Generate top buttons
    gWidgets2::gbutton("Select Input Folder", container = groupTopButtons, handler = function(h,...) {
        sourcefolder <<- if(Sys.info()["sysname"] == "Windows"){
            utils::choose.dir(default = getwd(), caption = "Where are the raw images?")
        } else{
            tcltk::tk_choose.dir(default = getwd(), caption = "Where are the raw images?")
        }
        gWidgets2::svalue(labelsourcefolder) <- sourcefolder
        print(paste0("Input folder: ", sourcefolder))
    })
    gWidgets2::gbutton("Select Output Folder", container = groupTopButtons, handler = function(h,...) {
        targetfolder <<- if(Sys.info()["sysname"] == "Windows"){
            utils::choose.dir(default = getwd(), caption = "Where do you want to save the images?")
        } else{
            tcltk::tk_choose.dir(default = getwd(), caption = "Where do you want to save the images?")
        }
        gWidgets2::svalue(labeltargetfolder) <- targetfolder
        print(paste0("Output folder: ", targetfolder))
    })
    gWidgets2::gbutton("Select Microscope Infile", container = groupTopButtons, handler = function(h,...) {
        infile <<- if(Sys.info()["sysname"] == "Windows"){
            utils::choose.files(default = "", caption = "Select the in-file", multi = FALSE)
        } else{
            tcltk::tk_choose.files(default = "", caption = "Select the in-file", multi = FALSE)
        }
        gWidgets2::svalue(labelInFile) <- infile
        print(paste0("In-file: ", infile))
    })
    gWidgets2::addSpace(groupTopButtons, 3)
    
    
    # Generate spin buttons
    gWidgets2::addSpace(groupWellLayout, 3)
    gWidgets2::glabel("Number of Rows:        ", container = groupWellLayoutR)
    numrow <- gWidgets2::gspinbutton(from = 1,to = 32, by = 1, value = 8, container = groupWellLayoutR, handler = function(h, ...){
        plate <<- paste0(gWidgets2::svalue(numrow) * gWidgets2::svalue(numcol), " well")
        gWidgets2::svalue(labelPlateType) <- plate
    })
    gWidgets2::glabel("Number of Columns: ", container = groupWellLayoutC)
    numcol <- gWidgets2::gspinbutton(from = 1,to = 48, by = 1, value = 12, container = groupWellLayoutC, handler = function(h, ...){
        plate <<- paste0(gWidgets2::svalue(numrow) * gWidgets2::svalue(numcol), " well")
        gWidgets2::svalue(labelPlateType) <- plate
    })
    
    
    # Generate text labels (folder & filenames)
    gWidgets2::addSpace(groupLabels1, 3)
    gWidgets2::glabel("Input Folder:   ", container = groupLabels1)
    labelsourcefolder <- gWidgets2::glabel(sourcefolder, container = groupLabels1)
    gWidgets2::addSpace(groupLabels1, 3)
    gWidgets2::addSpace(groupLabels2, 3)
    gWidgets2::glabel("Output Folder:", container = groupLabels2)
    labeltargetfolder <- gWidgets2::glabel(targetfolder, container = groupLabels2)
    gWidgets2::addSpace(groupLabels2, 3)
    gWidgets2::addSpace(groupLabels3, 3)
    gWidgets2::glabel("Mic-In File:      ", container = groupLabels3)
    labelInFile <- gWidgets2::glabel(infile, container = groupLabels3)
    gWidgets2::addSpace(groupLabels3, 3)
    gWidgets2::addSpace(groupLabels4, 3)
    gWidgets2::glabel("Plate type:       ", container = groupLabels4)
    labelPlateType <- gWidgets2::glabel(plate, container = groupLabels4)
    gWidgets2::addSpace(groupLabels4, 3)
    
    
    # Generate log window
    logWindow <<- gWidgets2::gtext("May 2022\nHugo Botelho\nhmbotelho@fc.ul.pt\n\nA typical file has a name like 'Image0010_01.oib'\n\n", container = groupLog, width = 100, height = 300)
    
    
    # Generate progress bar
    ProgressBar <<- gWidgets2::gprogressbar(value=0, container = groupProgressBar)
    
    
    # This button triggers all file-related actions
    gWidgets2::gbutton("Start renaming", container = groupBottomButtons, handler = function(h,...) {
        if (sourcefolder == "<not specified>"){
            gWidgets2::insert(logWindow,"No input folder!\n")
        } else if (targetfolder == "<not specified>"){
            gWidgets2::insert(logWindow,"No output folder!\n")
        } else if (infile == "<not specified>"){
            gWidgets2::insert(logWindow,"No infile!\n")
        } else {
            gWidgets2::insert(logWindow,"Starting Transfer !\n")
            
            
            rename_olympus(sourcefolder     = sourcefolder, 
                           targetfolder     = targetfolder, 
                           infilepath       = infile, 
                           numrow           = gWidgets2::svalue(numrow), 
                           numcol           = gWidgets2::svalue(numcol), 
                           REGEXvalidimages = "^.*(\\d{4})_(\\d{2}).oib$", 
                           printMessages    = TRUE, 
                           printFiles       = TRUE, 
                           printToGUI       = TRUE, 
                           move             = FALSE)
            
            gWidgets2::insert(logWindow,"\nRenaming Ended\n")
        }
    })
    
    
}


















#' Olympus renamer
#'
#' Renaming of Olympus OIB files according to a microscope infile. See \code{\link{newinfile.df}} or \code{\link{newinfile.char}} for a description of the infile structure.
#' @param sourcefolder character, the folder with raw images
#' @param targetfolder character, folder where to place renamed files. A subfolder with the same name as the infile will be created by the function and must not exist previously.
#' @param infilepath character, location of the microscope infile
#' @param numrow integer, number of rows in the multi well plate
#' @param numcol integer, number of columns in the multi well plate
#' @param REGEXvalidimages character, regular expression matching all files which should be renamed. Captures (\code{(\1)}) the scene number (i.e. well number) and (\code{(\2)}) the time number in a time lapse.
#' @param printMessages, logical, print messages in the console?
#' @param printFiles, logical, print file-by-file progress in the console?
#' @param printToGUI logical, print messages to the renamer GUI?
#' @param move logical, move (rather than copy) raw images?
#'
#' @return Renamed files, metadata and log file
#'
#' @return Null
#'
#' @seealso
#' \code{\link{rename_olympus_gui}} for interacting with this function using a GUI.
#'
#' @export
#' @importFrom gWidgets2 svalue
#' 
rename_olympus <- function(sourcefolder, targetfolder, infilepath, numrow, numcol, REGEXvalidimages = "^.*(\\d{4})_(\\d{2}).oib$", printMessages = TRUE, printFiles = TRUE, printToGUI = FALSE, move = FALSE){
    
    # library(RBioFormats)
    
    # read Infile
    infilename   <- gsub("(.+?)\\.[^\\.]+$", "\\1", basename(infilepath))
    InFile <- read.infile.df(infilepath)
    
    
    
    targetsubfolder <- paste0(targetfolder, "/", infilename)
    
    # Read raw image folder and store all filenames in a data.frame
    allimages <- list.files(sourcefolder, pattern = REGEXvalidimages, full.names = TRUE, recursive = TRUE)
    allimages <- allimages[!grepl("/Append/", allimages)]
    
    renamer <- data.frame(oldname   = allimages,
                          newname   = character(length(allimages)),
                          basepath  = targetsubfolder,
                          platename = infilename,
                          scenenum  = character(length(allimages)),
                          wellnum   = character(length(allimages)),
                          timenum   = character(length(allimages)),
                          stringsAsFactors = FALSE)
    
    
    # Fill data.frame with scene numbers
    renamer$scenenum <- gsub(REGEXvalidimages, "\\1", renamer$oldname)
    
    
    # Fill data.frame with well numbers
    well2scene <- data.frame(wellnum  = 1:(numrow*numcol),
                             scenenum = as.numeric(t(matrix_snake(1:(numrow*numcol), numrow, numcol, byrow=FALSE))))
    renamer$wellnum <- sapply(renamer$scenenum, function(x){
        formatC(
            x     = well2scene[which(well2scene$scenenum == as.numeric(x)), "wellnum"],
            width = 3,
            flag  = "0"
        )
        
    })
    
    
    # Fill data.frame with time numbers
    renamer$timenum   <- formatC(x     = sapply(renamer$oldname, function(x) as.numeric(gsub(REGEXvalidimages, "\\2", x)) - 1),
                                 flag  = "0",
                                 width = 4)
    
    
    # Exclude files which are not mentioned in the InFile
    files.within.infile <- sapply(renamer$wellnum, function(x) x %in% InFile$WellNum)
    renamer <- renamer[files.within.infile,]
    
    # Fill data.frame with the path of the renamed files
    renamer$newname  <- apply(renamer, 1, function(x){
        
        temp         <- InFile[which(InFile$WellNum == x["wellnum"]),]
        
        wellpath     <- paste0("W0", temp[1,"WellNum"], "--", temp[1,"data1"], "--", temp[1,"data2"])
        pospath      <- paste0("P001--", temp[1,"data1"], "--", temp[1,"data2"])
        filename     <- paste0(infilename, "--", temp[1, "data1"], "--", temp[1, "data2"], "--W0", temp[1, "WellNum"], "--P001--T", x["timenum"], "--C00.tif")
        
        paste(targetsubfolder, wellpath, pospath, filename, sep = "/")
    })
    
    
    
    ## Sanity check
    # Check if all wells are properly annotated
    files.no.annotation <- renamer[which(renamer == "", arr.ind = TRUE)[1], "oldname"]
    if(!is.null(nrow(files.no.annotation))){
        msg <- paste0("Missing annotation for ", length(files.no.annotation), " files. Consider checking the number of rows and columns, as well as the infile. These are the files affected: ", paste(files.no.annotation, collapse = " ; "))
        
        echo(msg, printToGUI = printToGUI, printToConsole = printMessages)
        stop(msg)
    }
    
    
    
    # Create target subfolder
    dir.create(targetsubfolder, showWarnings = FALSE, recursive = TRUE)
    LogFile <- file(paste0(targetsubfolder, "/renamer.log"), "w")
    
    
    ## Go through the list and copy files
    ## Write log file as the files are renamed
    totalcopies <- nrow(renamer)
    copiedfiles <- 0
    
    cat("Raw Filename|Renamed Filename", file= LogFile, sep="\n", append=TRUE)
    for(i in 1:nrow(renamer)){
        
        OldFile <- renamer[i, "oldname"]
        NewFile <- renamer[i, "newname"]
        
        copiedfiles <- copiedfiles + 1
        progress <- copiedfiles / totalcopies * 100
        progressTxt <- paste0(substr(formatC(progress, mode = "character"), 1, 5), "%")
        
        if (file.exists(OldFile)){
            if(!dir.exists(dirname(NewFile))){
                dir.create(dirname(NewFile), recursive = TRUE)
            }
            
            
            # Read *.oib image
            img = RBioFormats::read.image(OldFile, normalize = FALSE)
            
            # Get image parameters
            sizeX <- img@metadata$coreMetadata$sizeX
            sizeY <- img@metadata$coreMetadata$sizeY
            sizeZ <- img@metadata$coreMetadata$sizeZ
            sizeC <- img@metadata$coreMetadata$sizeC
            sizeT <- img@metadata$coreMetadata$sizeT
            pixelType <- img@metadata$coreMetadata$pixelType
            pixelWidth <- as.numeric(img@metadata$globalMetadata$`[Reference Image Parameter] WidthConvertValue`)
            pixelHeight <- as.numeric(img@metadata$globalMetadata$`[Reference Image Parameter] HeightConvertValue`)
            pixelsizeunit <- img@metadata$globalMetadata$`[Reference Image Parameter] WidthUnit`
            
            
            
            # Save images
            
                # Split channels
                for(C in seq_len(sizeC)){
                    
                    # Update channel number
                    chnum <- formatC(C-1, width=2, flag="0")
                    substring(NewFile, nchar(NewFile)-5, nchar(NewFile)-4) <- chnum
                    
                    # Save file
                    RBioFormats::write.image(img[,,C], NewFile, force = TRUE, pixelType = pixelType)
                    
                    # Display progress
                    msg <- paste0(progressTxt, "   Renamed file: ", NewFile)
                    echo(msg, printToGUI = printToGUI, printToConsole = printFiles)
                    cat(paste0(OldFile, "|", NewFile), file= LogFile, sep="\n", append=TRUE)
                    if(printToGUI) gWidgets2::svalue(ProgressBar) <- progress
                    
                }
            
            
            # Delete OldFile, if required
            if(move) file.remove(OldFile)
            
            
        } else{
            msg <- paste0("File does not exist: ", OldFile, "\n")
            warning(msg)
            echo(msg, printToGUI = printToGUI, printToConsole = printMessages)
            if(printToGUI) gWidgets2::svalue(ProgressBar) <<- progress
        }
        
    }
    
    close(LogFile)
    print("Renaming Ended")
    
}
