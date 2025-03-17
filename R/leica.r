#' Image export software
#'
#' Determines whether images coming from a Leica microscope were generated with the MatrixScreener or Navigator software.
#'
#' @param folder character, Leica export folder.
#'
#' @return character, the name of the software which generated the images.
#'
#' @export
#' 
whichLeicaSoftware <- function(folder){
    
    allfiles   <- list.files(folder, recursive = T)
    allfolders <- list.dirs(folder, recursive = T)
    
    # Criteria for MatrixScreener images
    if(any(grepl(".*AdditionalData$", allfolders))) return("MatrixScreener")
       
    
    # Criteria for Navigator images
    if(any(grepl(".*[A-Z]{1,}\\d{1,}.*_.*ch\\d{2,}\\.tif$", allfiles))) return("Navigator")
    
    
    # Roll-back
    "Navigator"
}






#' Find Leica MatrixScreener XML and LRP files
#'
#' Analyzes the Leica MatrixScreener 'AdditionalData' folder and returns the file names of {ScanningTemplate} files
#'
#' @param folder character, Leica MatrixScreener export folder.
#'
#' @return character vector with file names.
#'
#' @note There must be exactly one copy of these files:\cr
#' \itemize{
#'   \item\code{\{ScanningTemplate\}templatename.xml}\cr
#'   \item\code{\{ScanningTemplate\}templatename.lrp}\cr
#' }
#'
#' @export
#' 
getfiles.XML.LRP <- function(folder){

    # There must be exactly one copy of these files:
    #   * {ScanningTemplate}templatename.xml
    #   * {ScanningTemplate}templatename.lrp

    files.scanningtemplate <- list.files(folder, pattern = "^.*\\{ScanningTemplate\\}.*?\\.(xml|lrp)", full.names = TRUE)
    available.templates    <- unique(gsub("^(.*\\{ScanningTemplate\\}.*?)\\.(xml|lrp)", "\\1", files.scanningtemplate))

    okfiles.scanningtemplate <- character(0)
    for(template in available.templates){
        if(file.exists(paste0(template, ".xml")) & file.exists(paste0(template, ".lrp"))){
            okfiles.scanningtemplate <- c(okfiles.scanningtemplate, template)
        }
    }

    if(length(okfiles.scanningtemplate) == 0){
        stop(paste0("Could not find matching {ScanningTemplate}*.xml and {ScanningTemplate}*.lrp files in '", xmlfolder, "'"))
    }

    if(length(okfiles.scanningtemplate) > 1){
        stop(paste0("Found more than one set of matching {ScanningTemplate}*.xml and {ScanningTemplate}*.lrp files in '", xmlfolder, "'"))
    }

    c(XML = paste0(okfiles.scanningtemplate, ".xml"), LRP = paste0(okfiles.scanningtemplate, ".lrp"))
}









#' Leica renamer GUI
#'
#' Displays the renamer tool GUI for Leica LAS X MatrixsSreener exports.
#' The actual renaming process is performed by function rename_leica().
#'
#' @return Null
#'
#' @seealso
#' \code{\link{rename_leica}} is the function which implements the actual renaming algorithm.\cr
#' \code{\link{rename_zeiss_gui}} for the Zeiss renamer GUI.\cr
#'
#' @export
#' @importFrom gWidgets2 addSpace gbutton gcheckbox ggroup glabel gprogressbar gtext insert svalue gwindow
#' @importFrom tcltk tk_choose.dir tk_choose.files
#' @import utils
#' 
rename_leica_gui <- function(){

    # Launch dialog box
    mainWindow <- gWidgets2::gwindow(paste0("Leica File Renamer Tool    -    htmrenamer v", utils::packageVersion("htmrenamer")))
    size(mainWindow) <- c(300,620)

    # Define groups
    groupMainWindow <- gWidgets2::ggroup(spacing = 0, horizontal = FALSE, container = mainWindow)

    groupTopButtons <- gWidgets2::ggroup(spacing = 1, horizontal = TRUE, container = groupMainWindow)

    gWidgets2::addSpace(groupTopButtons, 3)
    gWidgets2::gbutton("Select Input Folder", container = groupTopButtons, handler = function(h,...) {
        sourcefolder <- if(Sys.info()["sysname"] == "Windows"){
                            utils::choose.dir(default = getwd(), caption = "Where are the raw images?")
                        } else{
                            tcltk::tk_choose.dir(default = getwd(), caption = "Where are the raw images?")
                        }
        gWidgets2::svalue(labelsourcefolder) <- sourcefolder
        print(paste0("Input folder: ", gWidgets2::svalue(labelsourcefolder)))
    })
    gWidgets2::gbutton("Select Output Folder", container = groupTopButtons, handler = function(h,...) {
        targetfolder <- if(Sys.info()["sysname"] == "Windows"){
                            utils::choose.dir(default = getwd(), caption = "Where do you want to save the images?")
                        } else{
                            tcltk::tk_choose.dir(default = getwd(), caption = "Where do you want to save the images?")
                        }
        gWidgets2::svalue(labeltargetfolder) <- targetfolder
        print(paste0("Output folder: ", gWidgets2::svalue(labeltargetfolder)))
    })
    gWidgets2::gbutton("Select Microscope Infile", container = groupTopButtons, handler = function(h,...) {
        infilepath <- if(Sys.info()["sysname"] == "Windows"){
                        utils::choose.files(default = "", caption = "Select the in-file", multi = FALSE)
                      } else{
                        tcltk::tk_choose.files(default = "", caption = "Select the in-file", multi = FALSE)
                      }
        gWidgets2::svalue(labelInFile) <- infilepath
        print(paste0("In-file: ", gWidgets2::svalue(labelInFile)))
    })

    groupLabels1 <- gWidgets2::ggroup(spacing = 1, horizontal = TRUE, container = groupMainWindow)

    gWidgets2::addSpace(groupLabels1, 3)
    gWidgets2::glabel("Input Folder:   ", container = groupLabels1)
    labelsourcefolder <- gWidgets2::glabel("<not specified>", container = groupLabels1)
    gWidgets2::addSpace(groupLabels1, 3)

    groupLabels2 <- gWidgets2::ggroup(spacing = 1, horizontal = TRUE, container = groupMainWindow)

    gWidgets2::addSpace(groupLabels2, 3)
    gWidgets2::glabel("Output Folder:", container = groupLabels2)
    labeltargetfolder <- gWidgets2::glabel("<not specified>", container = groupLabels2)
    gWidgets2::addSpace(groupLabels2, 3)

    groupLabels3 <- gWidgets2::ggroup(spacing = 1, horizontal = TRUE, container = groupMainWindow)

    gWidgets2::addSpace(groupLabels3, 3)
    gWidgets2::glabel("Mic-In File:      ", container = groupLabels3)
    labelInFile <- gWidgets2::glabel("<not specified>", container = groupLabels3)
    gWidgets2::addSpace(groupLabels3, 3)

    groupLog <- gWidgets2::ggroup(horizontal = FALSE, container = groupMainWindow)

    logWindow <<- gWidgets2::gtext("For MatrixScreener and Navigator files.\nSeptember 2020\nHugo Botelho\nhmbotelho@fc.ul.pt\n\n", width = 100, height = 300, container = groupLog)

    groupProgressBar <- gWidgets2::ggroup(spacing = 1, horizontal = FALSE, container = groupMainWindow)

    ProgressBar <<- gWidgets2::gprogressbar(value=0, container = groupProgressBar)

    groupBottomButtons <- gWidgets2::ggroup(horizontal = FALSE, container = groupMainWindow)

    gWidgets2::gbutton("Start renaming", container = groupBottomButtons, handler = function(h,...) {
        if (gWidgets2::svalue(labelsourcefolder) == "<not specified>"){
            gWidgets2::insert(logWindow,"Please select a source folder!\n")
            print("Please select a source folder!")
        } else if (gWidgets2::svalue(labeltargetfolder) == "<not specified>"){
            gWidgets2::insert(logWindow,"Please select an output folder!\n")
            print("Please select an output folder!")
        } else if (gWidgets2::svalue(labelInFile) == "<not specified>"){
            gWidgets2::insert(logWindow,"Please select an infile!\n")
            print("Please select an infile!")
        } else if(!dir.exists(gWidgets2::svalue(labelsourcefolder))){
            gWidgets2::insert(logWindow,"The source folder you selected does not exist!\n")
            print(paste0("The source folder you selected does not exist: ", gWidgets2::svalue(labelsourcefolder)))
        } else if(!dir.exists(gWidgets2::svalue(labeltargetfolder))){
            gWidgets2::insert(logWindow,"The output folder you selected does not exist!\n")
            print(paste0("The output folder you selected does not exist: ", gWidgets2::svalue(labeltargetfolder)))
        } else if(!file.exists(gWidgets2::svalue(labelInFile))){
            gWidgets2::insert(logWindow,"The Microscope In-File you selected does not exist!\n")
            print(paste0("The Microscope In-File you selected does not exist: ", gWidgets2::svalue(labelInFile)))
        } else {
            gWidgets2::insert(logWindow,"Starting renaming !\n")
            print("Starting renaming!", quote = F)

            #Start renaming
            rename_leica(sourcefolder      = gWidgets2::svalue(labelsourcefolder),
                         targetfolder      = gWidgets2::svalue(labeltargetfolder),
                         infilepath        = gWidgets2::svalue(labelInFile),
                         compress          = gWidgets2::svalue(compressFiles),
                         move              = FALSE,
                         outputDescriptors = gWidgets2::svalue(writeDescriptors),
                         printMessages     = TRUE, 
                         printFiles        = TRUE,
                         printToGUI        = TRUE)

        }
    })

    writeDescriptors <- gWidgets2::gcheckbox("Output experiment descriptors?", checked = TRUE, container = groupMainWindow)

    compressFiles <- gWidgets2::gcheckbox("Lossless compression?", checked = TRUE, container = groupMainWindow)
    # moveFiles <- gWidgets2::gcheckbox("Move files?", checked = FALSE, container = groupMainWindow)

}










#' Leica renamer
#'
#' Renaming of Leica files according to a microscope infile. Auto-detects the software which generated the images to call the apropriate renamer function. See \code{\link{newinfile.df}} or \code{\link{newinfile.char}} for a description of the infile structure.
#' @param sourcefolder character, the folder with raw images.
#' @param targetfolder character, folder where to place renamed files. A subfolder wih the same name as the infile will be created by the function and must not exist previously.
#' @param infilepath character, location of the microscope infile
#' @param compress logical, compress raw images?
#' @param move logical, move (rather than copy) raw images?
#' @param outputDescriptors logical, save plain text files with experimental metadata?
#' @param printMessages, logical, print messages in the console?
#' @param printFiles, logical, print file-by-file progress in the console?
#' @param printToGUI logical, print messages to the renamer GUI?
#'
#' @return None, this function just calls another function to perform the renaming.
#'
#' @seealso
#' \code{\link{rename_leica_gui}} for interacting with this function using a GUI.
#'
#' @export
#' 
rename_leica <- function(sourcefolder, targetfolder, infilepath, compress = FALSE, move = FALSE, outputDescriptors = TRUE, printMessages = TRUE, printFiles = TRUE, printToGUI = FALSE){
    
    software <- whichLeicaSoftware(sourcefolder)
    
    if(software == "MatrixScreener"){
        echo("Processing files as Leica MatrixScreener outputs...", printToGUI = printToGUI, printToConsole = printMessages)
        rename_leica_matrixscreener(sourcefolder      = sourcefolder, 
                                    targetfolder      = targetfolder, 
                                    infilepath        = infilepath, 
                                    compress          = compress, 
                                    move              = move, 
                                    outputDescriptors = outputDescriptors, 
                                    printMessages     = printMessages,
                                    printFiles        = printFiles,
                                    printToGUI        = printToGUI)
    }
        
    if(software == "Navigator"){
        echo("Processing files as Leica Navigator outputs...", printToGUI = printToGUI, printToConsole = printMessages)
        rename_leica_navigator(sourcefolder      = sourcefolder, 
                               targetfolder      = targetfolder, 
                               infilepath        = infilepath, 
                               compress          = compress, 
                               move              = move, 
                               outputDescriptors = outputDescriptors, 
                               printMessages     = printMessages,
                               printFiles        = printFiles,
                               printToGUI        = printToGUI)
    }
}










#' Leica renamer (MatrixScreener)
#'
#' Renaming of Leica MatrixScreener files according to a microscope infile. See \code{\link{newinfile.df}} or \code{\link{newinfile.char}} for a description of the infile structure.
#' @param sourcefolder character, the folder with raw images. The folder usually has the folllowing name structure: \code{demoplate_01--2019_01_01_12_00_00}
#' @param targetfolder character, folder where to place renamed files. A subfolder wih the same name as the infile will be created by the function and must not exist previously.
#' @param infilepath character, location of the microscope infile
#' @param compress logical, compress raw images?
#' @param move logical, move (rather than copy) raw images?
#' @param outputDescriptors logical, save plain text files with experimental metadata?
#' @param printMessages, logical, print messages in the console?
#' @param printFiles, logical, print file-by-file progress in the console?
#' @param printToGUI logical, print messages to the renamer GUI?
#'
#' @return Renamed files, metadata and log file
#'
#' @seealso
#' \code{\link{rename_leica_gui}} for interacting with this function using a GUI.
#'
#' @export
#' @importFrom gWidgets2 svalue
#' @importFrom tiff readTIFF writeTIFF
#' @importFrom utils write.csv
#' @importFrom openxlsx createWorkbook addWorksheet writeData saveWorkbook
#' @importFrom XML getNodeSet names.XMLNode xmlAttrs xmlChildren xmlGetAttr xmlName xmlRoot xmlSApply xmlTreeParse xmlValue xpathSApply
#' 
rename_leica_matrixscreener <- function(sourcefolder, targetfolder, infilepath, compress = FALSE, move = FALSE, outputDescriptors = TRUE, printMessages = TRUE, printFiles = TRUE, printToGUI = FALSE){

    # library(XML)
    # if(compress) library(tiff)
    # if(outputDescriptors) library(openxlsx)

    echo("Determining renaming parameters...", printToGUI = printToGUI, printToConsole = printMessages)
    echo("", printToGUI = printToGUI, printToConsole = printMessages)





    ### Initialize variables which apparently are not in the Leica xml files
    TokenEPos    <- "E"
    TokenEDigits <- 2
    Eee          <- 0





    ### Initialize file- and folder-related variables
    echo("Analyzing MatrixScreener folder structure", printToGUI = printToGUI, printToConsole = printMessages)

    sourcefolder <- gsub("\\\\", "/", sourcefolder)
    sourcefolder <- ifelse(endsWith(sourcefolder, "/"), sourcefolder, paste0(sourcefolder, "/"))
    targetfolder <- gsub("\\\\", "/", targetfolder)
    infilepath   <- gsub("\\\\", "/", infilepath)
    xmlfolder    <- paste0(sourcefolder, "AdditionalData")

    file.lif2ome <- paste0(xmlfolder, "/LIF2OME.xml")
    if(!file.exists(file.lif2ome)){
        msg <- paste0("LIF2OME.xml file does not exist: ", file.lif2ome)
        echo(msg, printToGUI = printToGUI, printToConsole = printMessages)
        stop(msg)
    }

    file.xml     <- getfiles.XML.LRP(xmlfolder)["XML"]
    if(!file.exists(file.xml)){
        msg <- "Scanning template file does not exist: {ScanningTemplate}xxxxx.xml"
        echo(msg, printToGUI = printToGUI, printToConsole = printMessages)
        stop(msg)
    }

    file.lrp     <- getfiles.XML.LRP(xmlfolder)["LRP"]
    if(!file.exists(file.lrp)){
        msg <- "Leica settings file does not exist: {ScanningTemplate}xxxxx.lrp"
        echo(msg, printToGUI = printToGUI, printToConsole = printMessages)
        stop(msg)
    }

    echo("Found all MatrixScreener data files", printToGUI = printToGUI, printToConsole = printMessages)
    echo("", printToGUI = printToGUI, printToConsole = printMessages)





    ### Infile
    echo(paste0("Parsing microscope In-File: ", infilepath), printToGUI = printToGUI, printToConsole = printMessages)

    infile.df       <- read.infile.df(infilepath)
    ren.expname     <- gsub(".*/(.+?)(\\.[^.]*$|$)", "\\1", infilepath)
    targetsubfolder <- paste0(targetfolder, "/", ren.expname, "/")

    echo("Finished parsing microscope In-File", printToGUI = printToGUI, printToConsole = printMessages)





    ### File LIF2OME.xml
    echo(paste0("Parsing file ", file.lif2ome), printToGUI = printToGUI, printToConsole = printMessages)

    doc <- XML::xmlTreeParse(file.lif2ome, useInternal = TRUE)
    top <- XML::xmlRoot(doc)
    formats                   <- XML::xpathSApply(top, "//Format/*", XML::xmlValue)
    names(formats)            <- XML::xpathSApply(top, "//Format/*", XML::xmlName)
    tokens                    <- XML::xpathSApply(top, "//TokenNames/*", XML::xmlValue)
    names(tokens)             <- XML::xpathSApply(top, "//TokenNames/*", XML::xmlName)
    SlideFolderName           <- XML::xpathSApply(doc, "//SlideFolderName", XML::xmlValue)
    names(SlideFolderName)    <- "SlideFolderName"
    WellFolderName            <- XML::xpathSApply(doc, "//WellFolderName", XML::xmlValue)
    names(WellFolderName)     <- "WellFolderName"
    FieldFolderName           <- XML::xpathSApply(doc, "//FieldFolderName", XML::xmlValue)
    names(FieldFolderName)    <- "FieldFolderName"
    SubfieldFolderName        <- XML::xpathSApply(doc, "//SubfieldFolderName", XML::xmlValue)
    names(SubfieldFolderName) <- "SubfieldFolderName"
    AFJobFolderName           <- XML::xpathSApply(doc, "//AFJobFolderName", XML::xmlValue)
    names(AFJobFolderName)    <- "AFJobFolderName"
    MetadataFolderName        <- XML::xpathSApply(doc, "//MetaDataFolderName", XML::xmlValue)
    names(MetadataFolderName) <- "MetadataFolderName"

    # "NameSettings" contains settings for generating filenames and folder names
    NameSettings <- c(formats,
                      tokens,
                      SlideFolderName,
                      WellFolderName,
                      FieldFolderName,
                      SubfieldFolderName,
                      AFJobFolderName,
                      MetadataFolderName)

    echo(paste0("Finished parsing ", file.lif2ome), printToGUI = printToGUI, printToConsole = printMessages)





    #    # Get extra settings
    #    ScanWellArray         <- as.data.frame(t(sapply(XML::getNodeSet(top, "//ScanWellArray/*"), XML::xmlAttrs)), stringsAsFactors = FALSE)
    #    ScanWellArray$SlideNo <- as.integer(ScanWellArray$SlideNo) - 1
    #    ScanWellArray$WellX   <- as.integer(ScanWellArray$WellX) - 1
    #    ScanWellArray$WellY   <- as.integer(ScanWellArray$WellY) - 1
    #    ScanFieldArray        <- sapply(XML::getNodeSet(top, "//Properties/*"), XML::xmlValue)
    #    names(ScanFieldArray) <- sapply(XML::getNodeSet(top, "//Properties/*"), XML::xmlName)


    # Clean Global Environment
    rm(doc, top, formats, tokens, SlideFolderName, WellFolderName, FieldFolderName, SubfieldFolderName, AFJobFolderName, MetadataFolderName)





    ### File {Scanning Template}xxx.lrp
    # Generate list "ImagingSettings", which has the following strucure
    #
    #    ImagingSettings (list)
    #               |
    #                |---Job1 (list)
    #                |         |-- JobDescriptor (vector)
    #                |         |-- Channels (data.frame)
    #                |              |-- C00
    #                |                  ...
    #                |                  ...
    #                |
    #                |---Job2 (list)
    #                |         |-- JobDescriptor (vector)
    #                |         |-- Channels (data.frame)
    #                |             |-- C00 | C01 | C02
    #                |                 ...   ...   ...
    #               ...                ...   ...   ...

    echo(paste0("Parsing file ", file.lrp), printToGUI = printToGUI, printToConsole = printMessages)

    ImagingSettings <- list()
    doc             <- XML::xmlTreeParse(file.lrp, useInternal = TRUE)
    top             <- XML::xmlRoot(doc)
    AllJobsNode     <- XML::getNodeSet(top, "//LDM_Block_Sequence_Block")
    LASXversion        <- gsub("^<!--LAS.* (\\d.*)-->$", "\\1", readLines(file.lrp)[5])
    names(LASXversion) <- "LASXversion"

    # Get settings from each imaging job
    JobCount <- length(AllJobsNode)
    JobInfo  <- data.frame(row.names = c("name", "modality", "sequentialmode", "channelcount"),
                           stringsAsFactors = FALSE)
    for(i in 1:JobCount){
        jobname       <- XML::xmlAttrs(AllJobsNode[[i]])[["BlockID"]]
        seqtype       <- ifelse(XML::names.XMLNode(AllJobsNode[[i]]) == "LDM_Block_Sequential", "sequential", "non sequential")
        
        jobmodality   <- if(seqtype == "non sequential"){
            
            # non sequential
            if(is.null(AllJobsNode[[i]][["LDM_Block"]])) stop(paste0("Unknown modality for Job ", i, " [BlockID=\"", jobname, "\"]"))
            
            switch(XML::names.XMLNode(AllJobsNode[[i]][["LDM_Block"]]),
                   ATLCameraSettingDefinition   = "widefield",
                   ATLConfocalSettingDefinition = "confocal")
        } else {
            
            # sequential
            if(is.null(AllJobsNode[[i]][["LDM_Block_Sequential"]][["LDM_Block_Sequential_Master"]])) stop(paste0("Unknown modality for Job ", i, " [BlockID=\"", jobname, "\"]"))
            
            switch(XML::names.XMLNode(AllJobsNode[[i]][["LDM_Block_Sequential"]][["LDM_Block_Sequential_Master"]]),
                   ATLCameraSettingDefinition   = "widefield",
                   ATLConfocalSettingDefinition = "confocal")
        }

        if(jobmodality == "widefield"){

            # Basic settings
            newjob <- data.frame(c(name           = as.character(XML::xmlSApply(AllJobsNode[[i]], XML::xmlAttrs)),
                                   modality       = "widefield",
                                   sequentialmode = "non sequential",
                                   channelcount   = length(XML::xmlChildren(AllJobsNode[[i]][["LDM_Block"]][["ATLCameraSettingDefinition"]][["WideFieldChannelConfigurator"]]))))
            names(newjob) <- jobname
            JobInfo <- cbind(JobInfo, newjob)

            # Advanced settings
            JobDescriptors <- c(XML::xmlAttrs(AllJobsNode[[i]]),
                                XML::xmlSApply(AllJobsNode[[i]], XML::xmlAttrs),
                                XML::xmlAttrs(AllJobsNode[[i]][["LDM_Block"]][["ATLCameraSettingDefinition"]]),
                                XML::xmlAttrs(AllJobsNode[[i]][["LDM_Block"]][["ATLCameraSettingDefinition"]][["CameraFormat"]]),
                                XML::xmlAttrs(AllJobsNode[[i]][["LDM_Block"]][["ATLCameraSettingDefinition"]][["WideFieldChannelConfigurator"]]),
                                LASXversion)

            # Create data frame "ChannelDescriptors". Each column is one imaging channel
            ChannelDescriptors <- XML::xpathSApply(AllJobsNode[[i]], "LDM_Block/ATLCameraSettingDefinition/WideFieldChannelConfigurator/WideFieldChannelInfo", XML::xmlAttrs)
            ChannelDescriptors <- as.data.frame(ChannelDescriptors, stringsAsFactors = FALSE)
            colnames(ChannelDescriptors) <- paste0("C", formatC(0:(ncol(ChannelDescriptors)-1), width = as.numeric(NameSettings["TokenFieldCPosDigits"]), flag="0"))
            temp               <- as.data.frame(matrix(rep(LASXversion, ncol(ChannelDescriptors)), 1, ncol(ChannelDescriptors), dimnames = list("LASXversion")))
            colnames(temp)     <- colnames(ChannelDescriptors)
            ChannelDescriptors <- rbind(ChannelDescriptors, temp)

            BlockID <- JobDescriptors["BlockID"]
            ImagingSettings[[BlockID]] <- list(JobDescriptors = JobDescriptors, Channels = ChannelDescriptors)

            # Determine the image bit depth. This information is required for the compression step.
            bitdepth <- max(sapply(ImagingSettings, function(x) as.integer(x$JobDescriptors["Resolution"])), na.rm = TRUE)
            
            # These images should be stored in a 16bit container: 10bit, 12bit, 14bit
            bitdepth <- ceiling(bitdepth/8)*8

            # Clean environment
            rm(jobname, newjob, i)
            rm(JobDescriptors, ChannelDescriptors, BlockID)
        }

        if(jobmodality == "confocal"){
            
            if(seqtype == "non sequential"){
                
                # Basic settings
                newjob <- data.frame(c(name           = as.character(XML::xmlSApply(AllJobsNode[[i]], XML::xmlAttrs)),
                                       modality       = "confocal",
                                       sequentialmode = seqtype,
                                       channelcount   = sum(XML::xpathSApply(AllJobsNode[[i]], "LDM_Block/ATLConfocalSettingDefinition/DetectorList/Detector", XML::xmlGetAttr, 'IsActive') == "1")))
                names(newjob) <- jobname
                JobInfo <- cbind(JobInfo, newjob)
                
                # Advanced settings
                JobDescriptors <- c(XML::xmlAttrs(AllJobsNode[[i]]),
                                    XML::xmlSApply(AllJobsNode[[i]], XML::xmlAttrs),
                                    XML::xmlAttrs(AllJobsNode[[i]][["LDM_Block"]][["ATLConfocalSettingDefinition"]]),
                                    unlist(lapply(XML::xmlChildren(AllJobsNode[[i]][["LDM_Block"]][["ATLConfocalSettingDefinition"]][["Spectro"]]), XML::xmlAttrs)),
                                    unlist(lapply(XML::xmlChildren(AllJobsNode[[i]][["LDM_Block"]][["ATLConfocalSettingDefinition"]][["AotfList"]]), function(x) XML::xmlAttrs(x[["LaserLineSetting"]]))),
                                    unlist(lapply(XML::xmlChildren(AllJobsNode[[i]][["LDM_Block"]][["ATLConfocalSettingDefinition"]][["DetectorList"]]), XML::xmlAttrs)),
                                    unlist(lapply(XML::xmlChildren(AllJobsNode[[i]][["LDM_Block"]][["ATLConfocalSettingDefinition"]][["LaserArray"]]), XML::xmlAttrs)),
                                    LASXversion)
                
                # Create data frame "ChannelDescriptors". Each column is one imaging channel
                ChannelDescriptors <- XML::xpathSApply(AllJobsNode[[i]], "LDM_Block/ATLConfocalSettingDefinition/DetectorList/Detector", XML::xmlAttrs)
                ChannelDescriptors <- ChannelDescriptors[sapply(ChannelDescriptors, function(x) x["IsActive"] == "1")]
                ChannelDescriptors <- if(class(ChannelDescriptors) == "list"){
                    
                    allnames               <- lapply(ChannelDescriptors, names)
                    commonnames            <- Reduce(intersect, allnames)
                    ChannelDescriptorsTemp <- lapply(ChannelDescriptors, function(x) x[commonnames])
                    ChannelDescriptorsTemp <- lapply(ChannelDescriptorsTemp, as.data.frame, stringsAsFactors = FALSE)
                    do.call(cbind, ChannelDescriptorsTemp)
                    
                } else{
                    as.data.frame(ChannelDescriptors, stringsAsFactors = FALSE)
                }
                colnames(ChannelDescriptors) <- paste0("C", formatC(0:(ncol(ChannelDescriptors)-1), width = as.numeric(NameSettings["TokenFieldCPosDigits"]), flag="0"))
                temp               <- as.data.frame(matrix(rep(LASXversion, ncol(ChannelDescriptors)), 1, ncol(ChannelDescriptors), dimnames = list("LASXversion")))
                colnames(temp)     <- colnames(ChannelDescriptors)
                ChannelDescriptors <- rbind(ChannelDescriptors, temp)
                
                
                
                
                BlockID <- JobDescriptors["BlockID"]
                ImagingSettings[[BlockID]] <- list(JobDescriptors = JobDescriptors, Channels = ChannelDescriptors)
                
                # Determine the image bit depth. This information is required for the compression step.
                bitdepth <- max(sapply(ImagingSettings, function(x) as.integer(x$JobDescriptors["BitSize"])), na.rm = TRUE)
                
                # Clean environment
                rm(jobname, newjob, i)
                rm(JobDescriptors, ChannelDescriptors, BlockID)
                
            }
            
            if(seqtype == "sequential"){

                # Basic settings
                SeqNames <- XML::xpathSApply(AllJobsNode[[i]], "LDM_Block_Sequential/LDM_Block_Sequential_List/ATLConfocalSettingDefinition", XML::xmlAttrs)["UserSettingName",]
                SeqCount <- length(SeqNames)
                newjob   <- data.frame(c(name           = as.character(XML::xmlSApply(AllJobsNode[[i]], XML::xmlAttrs))[3],
                                         modality       = "confocal",
                                         sequentialmode = seqtype,
                                         sequencecount  = SeqCount))
                names(newjob) <- jobname
                JobInfo <- cbind(JobInfo, newjob)
                
                # Advanced settings
                AllSeqNodeMaster <- XML::getNodeSet(AllJobsNode[[i]], "//LDM_Block_Sequential//LDM_Block_Sequential_Master")
                AllSeqNode       <- XML::getNodeSet(AllJobsNode[[i]], "//LDM_Block_Sequential//LDM_Block_Sequential_List")
                
                JobDescriptors   <- XML::xmlAttrs(AllJobsNode[[i]])
                temp             <- as.character(XML::xmlSApply(AllJobsNode[[i]], XML::xmlAttrs))
                names(temp)      <- rownames(XML::xmlSApply(AllJobsNode[[i]], XML::xmlAttrs))
                JobDescriptors   <- c(JobDescriptors,
                                      temp,
                                      XML::xmlAttrs(AllSeqNode[[1]][["ATLConfocalSettingDefinition"]]))
                ChannelDescriptors <- NULL

                
                for(s in 1:length(SeqNames)){

                    ThisSeqNodeMaster  <- XML::getNodeSet(AllJobsNode[[i]], "//LDM_Block_Sequential//LDM_Block_Sequential_Master//ATLConfocalSettingDefinition")[[1]]
                    ThisSeqNode        <- XML::getNodeSet(AllJobsNode[[i]], "//LDM_Block_Sequential//LDM_Block_Sequential_List//ATLConfocalSettingDefinition")[[s]]
                    DetectorListMaster <- lapply(XML::xmlChildren(ThisSeqNodeMaster[["DetectorList"]]), XML::xmlAttrs)
                    
                    allnames           <- lapply(DetectorListMaster, names)
                    commonnames        <- Reduce(intersect, allnames)
                    DetectorDfMaster   <- lapply(DetectorListMaster, function(x) x[commonnames])
                    DetectorDfMaster   <- as.data.frame(DetectorDfMaster, stringsAsFactors = FALSE)
                    colnames(DetectorDfMaster) <- as.character(DetectorDfMaster["Name",])
                    DetectorDfMaster   <- DetectorDfMaster[-c(1:6),]

                    JobDescriptors     <- c(JobDescriptors,
                                            unlist(lapply(XML::xmlChildren(ThisSeqNode[["Spectro"]]), XML::xmlAttrs)),
                                            unlist(lapply(XML::xmlChildren(ThisSeqNode[["AotfList"]]), function(x) XML::xmlAttrs(x[["LaserLineSetting"]]))),
                                            unlist(lapply(XML::xmlChildren(ThisSeqNode[["DetectorList"]]), XML::xmlAttrs)),
                                            unlist(DetectorListMaster),
                                            unlist(lapply(XML::xmlChildren(ThisSeqNode[["LaserArray"]]), XML::xmlAttrs)),
                                            LASXversion)

                    # Create data frame "ChannelDescriptors". Each column is one imaging channel
                    ChannelDescriptors0 <- XML::xpathApply(ThisSeqNode, "DetectorList/Detector", XML::xmlAttrs)
                    ChannelDescriptors0 <- ChannelDescriptors0[sapply(ChannelDescriptors0, function(x) x["IsActive"] == "1")]
                    ChannelDescriptors0 <- if(class(ChannelDescriptors0) == "list"){
                        
                        allnames               <- lapply(ChannelDescriptors0, names)
                        commonnames            <- Reduce(intersect, allnames)
                        ChannelDescriptorsTemp <- lapply(ChannelDescriptors0, function(x) x[commonnames])
                        ChannelDescriptorsTemp <- lapply(ChannelDescriptorsTemp, as.data.frame, stringsAsFactors = FALSE)
                        do.call(cbind, ChannelDescriptorsTemp)
                        
                    } else{
                        as.data.frame(ChannelDescriptors0, stringsAsFactors = FALSE)
                    }
                    temp1               <- DetectorDfMaster[,as.character(ChannelDescriptors0["Name",]), drop=FALSE]
                    temp2               <- as.data.frame(matrix(rep(LASXversion, ncol(ChannelDescriptors0)), 1, ncol(ChannelDescriptors0), dimnames = list("LASXversion")))
                    colnames(temp1)     <- colnames(ChannelDescriptors0)
                    colnames(temp2)     <- colnames(ChannelDescriptors0)
                    ChannelDescriptors0 <- do.call(rbind, list(ChannelDescriptors0, temp1, temp2))


                    ChannelDescriptors <- if(is.null(ChannelDescriptors)){
                        # Initialize information on C00, ...
                        ChannelDescriptors0
                    } else{
                        # Previous channels exist. Add further ones.
                        cbind(ChannelDescriptors, ChannelDescriptors0)
                    }
                    colnames(ChannelDescriptors) <- paste0("C", formatC(0:(ncol(ChannelDescriptors)-1), width = as.numeric(NameSettings["TokenFieldCPosDigits"]), flag="0"))

                    
                    BlockID <- JobDescriptors["BlockID"]
                    ImagingSettings[[BlockID]] <- list(JobDescriptors = JobDescriptors, Channels = ChannelDescriptors)
                    
                    # Determine the image bit depth. This information is required for the compression step.
                    bitdepth <- max(sapply(ImagingSettings, function(x) as.integer(x$JobDescriptors["BitSize"])), na.rm = TRUE)
                    
                    # Clean environment
                    if(exists("jobname")) rm(jobname)
                    if(exists("newjob")) rm(newjob)
                    if(exists("BlockID")) rm(BlockID)

                }

            }
            
        }

    }

    
    echo(paste0("Finished parsing ", file.lrp), printToGUI = printToGUI, printToConsole = printMessages)

    # Clean Global Environment
    rm(jobmodality, seqtype, doc, top, AllJobsNode)




    ### File {Scanning Template}xxx.xml
    echo(paste0("Parsing file ", file.xml), printToGUI = printToGUI, printToConsole = printMessages)

    doc <- XML::xmlTreeParse(file.xml, useInternal = TRUE)
    top <- XML::xmlRoot(doc)

    # Major template settings
    TemplateProperties        <- c(as.character(XML::xpathSApply(top, "//Properties", XML::xmlAttrs)), XML::xpathSApply(top, "//Properties/*", XML::xmlValue))
    names(TemplateProperties) <- c(rownames(XML::xpathSApply(top, "//Properties", XML::xmlAttrs)), XML::xpathSApply(top, "//Properties/*", XML::xmlName))

    # Data frame "FieldsAll": contains filename settings for each field
    FieldsAll                <- XML::xmlSApply(top[["ScanFieldArray"]], XML::xmlAttrs)
    FieldsAll                <- as.data.frame(t(FieldsAll), stringsAsFactors = FALSE)
    class(FieldsAll$JobId)   <- "character"
    class(FieldsAll$SlideNo) <- "numeric"
    class(FieldsAll$WellX)   <- "numeric"
    class(FieldsAll$WellY)   <- "numeric"
    class(FieldsAll$FieldX)  <- "numeric"
    class(FieldsAll$FieldY)  <- "numeric"

    # Embed field coordinates
    xyz       <- XML::getNodeSet(top, "//ScanFieldData")
    xyz       <- lapply(xyz, function(x) XML::xmlSApply(x, XML::xmlValue))
    xyz       <- do.call("rbind", xyz)
    FieldsAll <- cbind(FieldsAll, xyz)

    # Embed well numbers
    FieldsAll$WellX   <- FieldsAll$WellX - 1
    FieldsAll$WellY   <- FieldsAll$WellY - 1
    FieldsAll         <- FieldsAll[order(FieldsAll$WellY, FieldsAll$WellX),]
    FieldsAll$WellNum <- paste0(FieldsAll$WellY, "_", FieldsAll$WellX)
    FieldsAll$WellNum <- match(FieldsAll$WellNum, unique(FieldsAll$WellNum))

    # Embed position numbers
    FieldsAll$FieldX  <- FieldsAll$FieldX - 1
    FieldsAll$FieldY  <- FieldsAll$FieldY - 1
    FieldsAll         <- FieldsAll[order(FieldsAll$FieldY, FieldsAll$FieldX),]
    FieldsAll$PosNum  <- paste0(FieldsAll$FieldY, "_", FieldsAll$FieldX)
    FieldsAll$PosNum  <- match(FieldsAll$PosNum, unique(FieldsAll$PosNum))

    # Order data frame
    FieldsAll         <- FieldsAll[order(FieldsAll$WellNum, FieldsAll$PosNum),]

    # Embed imaging modality
    FieldsAll$Modality <- apply(FieldsAll, 1, function(x){
        if(!(x["JobId"] %in% names(JobInfo))) return("unknown")
        as.character(JobInfo["modality", x["JobId"]])
    })

    # Embed InFile data
    FieldsAll$data1 <- apply(FieldsAll, 1, function(x){
        U <- formatC(as.numeric(x["WellX"]), width = 2, flag = "0")
        V <- formatC(as.numeric(x["WellY"]), width = 2, flag = "0")
        array.coord <- which(infile.df$U_coord == U & infile.df$V_coord == V)
        if(length(array.coord) == 0) return("___NOT_IN_INFILE___")
        infile.df$data1[array.coord]
    })
    FieldsAll$data2 <- apply(FieldsAll, 1, function(x){
        U <- formatC(as.numeric(x["WellX"]), width = 2, flag = "0")
        V <- formatC(as.numeric(x["WellY"]), width = 2, flag = "0")
        array.coord <- which(infile.df$U_coord == U & infile.df$V_coord == V)
        if(length(array.coord) == 0) return("___NOT_IN_INFILE___")
        infile.df$data2[array.coord]
    })

    if(class(FieldsAll$data1) == "list"){
        msg <- "Error parsing column 'data1' in infile. Weird characters may be found in the 'FieldsAll' table."
        echo(msg, printToGUI = printToGUI, printToConsole = printMessages)
        FieldsAll$data1<-as.character(FieldsAll$data1)
    }
    if(class(FieldsAll$data2) == "list"){
        msg <- "Error parsing column 'data2' in infile. Weird characters may be found in the 'FieldsAll' table."
        echo(msg, printToGUI = printToGUI, printToConsole = printMessages)
        FieldsAll$data2<-as.character(FieldsAll$data2)
    }

    # Embed imaging job data
    FieldsAll$HowManyChannels <- apply(FieldsAll, 1, function(x){
        JobNum <- as.character(x["JobId"])
        # Remove trailing and leading whitespaces
        JobNum <- gsub("^ ??(\\S*) ??$", "\\1", JobNum)
        if(!JobNum %in% names(ImagingSettings)) return("")
        ncol(ImagingSettings[[JobNum]][["Channels"]])})
    FieldsAll$ImagingJobOrder <- apply(FieldsAll, 1, function(x){
        JobNum <- as.character(x["JobId"])
        # Remove trailing and leading whitespaces
        JobNum <- gsub("^ ??(\\S*) ??$", "\\1", JobNum)
        if(JobNum           == "0" |
           x["JobName"]     == "No Job Assigned" |
           x["Enabled"]     == "false" |
           x["JobAssigned"] == "false") return("")
        sum(x["IsDriftCompensationField"] == "true")})
    FieldsAll$HowManySections <- apply(FieldsAll, 1, function(x){
        JobNum <- as.character(x["JobId"])
        # Remove trailing and leading whitespaces
        JobNum <- gsub("^ ??(\\S*) ??$", "\\1", JobNum)
        if(JobNum           == "0" |
           x["JobName"]     == "No Job Assigned" |
           x["Enabled"]     == "false" |
           x["JobAssigned"] == "false") return("")
        ImagingSettings[[JobNum]][["JobDescriptors"]]["Sections"]})
    FieldsAll$HowManyTimes    <- apply(FieldsAll, 1, function(x){
        JobNum <- as.character(x["JobId"])
        # Remove trailing and leading whitespaces
        JobNum <- gsub("^ ??(\\S*) ??$", "\\1", JobNum)
        if(JobNum           == "0" |
           x["JobName"]     == "No Job Assigned" |
           x["Enabled"]     == "false" |
           x["JobAssigned"] == "false") return("")
        TemplateProperties["ExperimentLoopCount"]})
    class(FieldsAll$HowManyChannels) <- "numeric"
    class(FieldsAll$ImagingJobOrder) <- "numeric"
    class(FieldsAll$HowManySections) <- "numeric"
    class(FieldsAll$HowManyTimes)    <- "numeric"

    # Subset the fields which were imaged
    FieldsActive <- FieldsAll[(FieldsAll$JobName != "No Job Assigned") & (FieldsAll$Enabled == "true") & (FieldsAll$JobAssigned == "true"),]

    echo(paste0("Finished parsing ", file.xml), printToGUI = printToGUI, printToConsole = printMessages)
    echo("", printToGUI = printToGUI, printToConsole = printMessages)

    # Clean Global Environment
    rm(doc, top, xyz)





    ### Create target folder

    if(dir.exists(targetsubfolder)){
        msg <- paste0("Folder ", targetsubfolder, " already exists! Aborting renaming process.")
        echo(msg, printToGUI = printToGUI, printToConsole = printMessages)
        stop(msg)
    }
    dir.create(targetsubfolder)





    ### Save setttings to text files
    if(outputDescriptors){
        echo("Exporting experiment descriptors...", printToGUI = printToGUI, printToConsole = printMessages)

        # Save 1: Field Settings
        utils::write.csv(FieldsAll,    paste0(targetsubfolder, "Fields_all.csv"), row.names = FALSE)
        utils::write.csv(FieldsActive, paste0(targetsubfolder, "Fields_active.csv"), row.names = FALSE)

        # Save 2: ImagingSettings list
        targetxlsxChannels <- paste0(targetsubfolder, "settings_channels.xlsx")
        targetxlsxJobs     <- paste0(targetsubfolder, "settings_jobs.xlsx")
        wbChannels         <- openxlsx::createWorkbook()
        wbJobs             <- openxlsx::createWorkbook()

        for(job in 1:length(ImagingSettings)){
            JobName     <- paste0(NameSettings["TokenFieldJPos"], formatC(as.numeric(names(ImagingSettings)[job]), width=NameSettings["TokenFieldJPosDigits"], flag="0"))
            ch_job      <- paste0("channels_", JobName)
            JobSettings <- data.frame(names(ImagingSettings[[job]][[1]]),
                                      ImagingSettings[[job]][[1]],
                                      stringsAsFactors = TRUE)
            colnames(JobSettings) <- c("Setting", JobName)
            openxlsx::addWorksheet(wbJobs, JobName)
            openxlsx::writeData(wbJobs, sheet = JobName, JobSettings)
            
            ChannelSettings <- ImagingSettings[[job]][[2]]
            openxlsx::addWorksheet(wbChannels, ch_job)
            openxlsx::writeData(wbChannels, sheet = ch_job, rowNames = TRUE, ChannelSettings)
        }
        openxlsx::saveWorkbook(wbJobs, targetxlsxJobs, overwrite = T)
        openxlsx::saveWorkbook(wbChannels, targetxlsxChannels, overwrite = T)

        # Save 3: Other settings
        utils::write.csv(data.frame(Setting = names(TemplateProperties), Value = TemplateProperties), paste0(targetsubfolder, "template_properties.csv"), row.names = FALSE)
        utils::write.csv(data.frame(Setting = names(NameSettings), Value = NameSettings), paste0(targetsubfolder, "settings_filenames.csv"), row.names = FALSE)


        # Clean up Global Environment
        rm(targetxlsxChannels, targetxlsxJobs, wbJobs, wbChannels, job, JobName, ch_job, JobSettings, ChannelSettings)

        echo("Finished exporting experiment descriptors", printToGUI = printToGUI, printToConsole = printMessages)
        echo("", printToGUI = printToGUI, printToConsole = printMessages)
    }






    ### Copy/move renamed files


    # Initialize
    echo("Starting file renaming...", printToGUI = printToGUI, printToConsole = printMessages)

    images.total <- sum(apply(FieldsActive, 1, function(x) prod(as.numeric(x[c("HowManyChannels","HowManySections","HowManyTimes")]))))
    images.done  <- 0
    LogFileName  <- paste0(targetsubfolder, "renamer.log")
    LogFile      <- file(LogFileName, "w")
    msg          <- paste0("Logging renaming to: ", LogFileName)
    echo(msg , printToGUI = printToGUI, printToConsole = printMessages)
    if(compress) cat("Lossless tiff compression using 'Deflate'", file= LogFile, sep="\n", append=TRUE)
    cat("Raw Filename|Renamed Filename", file= LogFile, sep="\n", append=TRUE)
    msg <- paste0("Found ", images.total, " files to be renamed")
    echo(msg, printToGUI = printToGUI, printToConsole = printMessages)
    echo("", printToGUI = printToGUI, printToConsole = printMessages)

    # Go through all fields and copy/move files
    for(field in 1:nrow(FieldsActive)){

        raw.chunk.SlideF <- NameSettings["SlideFolderName"]
        raw.chunk.Slide  <- paste0(NameSettings["Separator"],
                                   NameSettings["TokenSlideNumber"],
                                   formatC(FieldsActive[field, "SlideNo"], width = as.numeric(NameSettings["TokenSlideNumberDigits"]), flag = "0"))
        raw.chunk.WellX  <- paste0(NameSettings["Separator"],
                                   NameSettings["TokenWellXPos"],
                                   formatC(FieldsActive[field, "WellX"], width = as.numeric(NameSettings["TokenWellXPosDigits"]), flag = "0"))
        raw.chunk.WellY  <- paste0(NameSettings["Separator"],
                                   NameSettings["TokenWellYPos"],
                                   formatC(FieldsActive[field, "WellY"], width = as.numeric(NameSettings["TokenWellYPosDigits"]), flag = "0"))
        raw.chunk.FieldX <- paste0(NameSettings["Separator"],
                                   NameSettings["TokenFieldXPos"],
                                   formatC(FieldsActive[field, "FieldX"], width = as.numeric(NameSettings["TokenFieldXPosDigits"]), flag = "0"))
        raw.chunk.FieldY <- paste0(NameSettings["Separator"],
                                   NameSettings["TokenFieldYPos"],
                                   formatC(FieldsActive[field, "FieldY"], width = as.numeric(NameSettings["TokenFieldYPosDigits"]), flag = "0"))
        raw.chunk.Image  <- if(grepl("^(?:\\n)? *$", NameSettings["TokenImageName"])){
            "image"
        } else{
            NameSettings["TokenImageName"]
        }
        raw.chunk.JobID  <- paste0(NameSettings["Separator"],
                                   NameSettings["TokenFieldJPos"],
                                   formatC(FieldsActive[field, "JobId"], width = as.numeric(NameSettings["TokenFieldJPosDigits"]), flag = "0"))
        raw.chunk.Eee    <- paste0(NameSettings["Separator"],
                                   TokenEPos,
                                   formatC(Eee, width = TokenEDigits, flag = "0"))
        raw.chunk.Order  <- paste0(NameSettings["Separator"],
                                   NameSettings["TokenFieldOrderOfJobInField"],
                                   formatC(FieldsActive[field, "ImagingJobOrder"], width=NameSettings["TokenFieldOrderOfJobInFieldPosDigits"], flag="0"))

        raw.SlideFolder <- if(grepl("^(?:\\n)? *$", NameSettings["SlideFolderName"])){
            # matches "\n        " or "        " or ""
            ""
        } else{
            paste0(NameSettings["SlideFolderName"],
                   raw.chunk.Slide,
                   "/")
        }
        raw.WellFolder  <- if(grepl("^(?:\\n)? *$", NameSettings["WellFolderName"])){
            # matches "\n        " or "        " or ""
            ""
        } else{
            paste0(NameSettings["WellFolderName"],
                   raw.chunk.WellX,
                   raw.chunk.WellY,
                   "/")
        }
        raw.FieldFolder <- if(grepl("^(?:\\n)? *$", NameSettings["FieldFolderName"])){
            # matches "\n        " or "        " or ""
            ""
        } else{
            paste0(NameSettings["FieldFolderName"],
                   raw.chunk.FieldX,
                   raw.chunk.FieldY,
                   "/")
        }

        ren.chunk.WellNum <- paste0("W", formatC(FieldsActive[field, "WellNum"], width = 4, flag = "0"))
        ren.chunk.PosNum  <- paste0("P", formatC(FieldsActive[field, "PosNum"], width = 3, flag = "0"))
        ren.chunk.data1   <- paste0("--", FieldsActive[field, "data1"])
        ren.chunk.data2   <- paste0("--", FieldsActive[field, "data2"])

        for(time in 0:(FieldsActive[field,"HowManyTimes"]-1)){

            raw.chunk.Loop <- paste0(NameSettings["Separator"],
                                     NameSettings["TokenLoopCount"],
                                     formatC(time, width = NameSettings["TokenLoopCountDigits"], flag="0"))

            raw.chunk.Time <- paste0(NameSettings["Separator"],
                                     NameSettings["TokenFieldTPos"],
                                     formatC(time, width = NameSettings["TokenFieldTPosDigits"], flag="0"))

            ren.chunk.Time <- paste0("--T", formatC(time, width = 4, flag = "0"))

            for(section in 0:(FieldsActive[field,"HowManySections"]-1)){

                # Naming of images with no Z dimension:
                # Widefield <!--LAS-AF 1.1.0.12420--> image--L0000--S00--U00--V00--J08--E00--O01--X00--Y00--T0000--C00.ome.tif
                # Widefield <!--LAS X 3.1.0.15537-->  I--L0000--S00--U00--V00--J08--E00--O00--X00--Y00--T0000--C00.ome.tif
                # Confocal  <!--LAS X 3.5.5.19976-->  I--L0000--S00--U00--V03--J08--E00--O00--X00--Y00--T0000--Z00--C00.ome.tif
                raw.chunk.Section <- if(FieldsActive[field,"HowManySections"] == 1 & FieldsActive[field,"Modality"] == "widefield"){
                    ""
                } else{
                    paste0(NameSettings["Separator"],
                           NameSettings["TokenFieldZPos"],
                           formatC(section, width = NameSettings["TokenFieldZPosDigits"], flag="0"))
                }

                ren.chunk.Section <- if(FieldsActive[field,"HowManySections"] == 1 & FieldsActive[field, "Modality"] == "widefield"){
                    ""
                }else{
                    paste0("--Z", formatC(time, width = 3, flag = "0"))
                }

                for(channel in 0:(FieldsActive[field,"HowManyChannels"]-1)){

                    raw.chunk.Channel <- paste0(NameSettings["Separator"],
                                                NameSettings["TokenFieldCPos"],
                                                formatC(channel, width = NameSettings["TokenFieldCPosDigits"], flag="0"))
                    raw.chunk.FileExt <- paste0(".ome.", NameSettings["FileType"])

                    ren.chunk.Channel <- paste0("--C", formatC(channel, width = 2, flag = "0"))

                    ## These are the files before and after renaming
                    path.old <- paste0(sourcefolder,
                                       raw.SlideFolder,
                                       raw.WellFolder,
                                       raw.FieldFolder,
                                       raw.chunk.Image,
                                       raw.chunk.Loop,
                                       raw.chunk.Slide,
                                       raw.chunk.WellX,
                                       raw.chunk.WellY,
                                       raw.chunk.JobID,
                                       raw.chunk.Eee,
                                       raw.chunk.Order,
                                       raw.chunk.FieldX,
                                       raw.chunk.FieldY,
                                       raw.chunk.Time,
                                       raw.chunk.Section,
                                       raw.chunk.Channel,
                                       ".ome.tif")
                    path.ren <- paste0(targetsubfolder,
                                       ren.chunk.WellNum,
                                       ren.chunk.data1,
                                       ren.chunk.data2,
                                       "/",
                                       ren.chunk.PosNum,
                                       ren.chunk.data1,
                                       ren.chunk.data2,
                                       "/",
                                       ren.expname,
                                       ren.chunk.data1,
                                       ren.chunk.data2,
                                       "--",
                                       ren.chunk.WellNum,
                                       "--",
                                       ren.chunk.PosNum,
                                       ren.chunk.Time,
                                       ren.chunk.Section,
                                       ren.chunk.Channel,
                                       ".ome.tif")

                    ####################
                    #  Copy/move file  #
                    ####################
                    raw.size <- file.size(path.old)

                    # First, check if the file exists
                    if (file.exists(path.old)){

                        if(!dir.exists(dirname(path.ren))){
                            dir.create(dirname(path.ren), recursive = TRUE)
                        }


                        # Copy the file, with or without compression
                        if(compress){
                            # Compress file
                            img <- tiff::readTIFF(path.old, native = FALSE, all = TRUE, convert = FALSE, info = TRUE, as.is = FALSE)
                            tiff::writeTIFF(img, path.ren, bits.per.sample = bitdepth, compression = "deflate", reduce = FALSE)
                            rm(img)
                        } else{
                            # If no compression is needed, use the file size to check that the copy was well done
                            while(is.na(file.size(path.ren)) | file.size(path.ren) != raw.size){
                                file.copy(path.old, path.ren, overwrite = TRUE)
                            }
                        }

                        # Delete the original file, if requested
                        if(move) file.remove(path.old)


                        images.done     <- images.done + 1
                        images.progress <- images.done / images.total * 100
                        progress.Txt    <- paste0(sprintf("%7.3f", images.progress), "%",
                                                  "   Renamed file: ",
                                                  path.ren)
                        rename.Txt      <- paste0(path.old, "|", path.ren)

                        # Write progress to Log file
                        cat(rename.Txt, file= LogFile, sep="\n", append=TRUE)

                        # Show progress
                        echo(progress.Txt, printToGUI = printToGUI, printToConsole = printFiles)
                        if(printToGUI) gWidgets2::svalue(ProgressBar) <- images.progress




                    } else{
                        # If the file does not exist, let the user know

                        images.done     <- images.done + 1
                        images.progress <- images.done / images.total * 100
                        progress.Txt    <- paste0(sprintf("%7.3f", images.progress), "%",
                                                  "   --FILE NOT FOUND: ",
                                                  path.old)
                        rename.Txt      <- paste0(path.old, "|", "NOT FOUND")

                        # Write progress to Log file
                        cat(rename.Txt, file= LogFile, sep="\n", append=TRUE)

                        # Show progress
                        echo(progress.Txt, printToGUI = printToGUI, printToConsole = printFiles)
                        if(printToGUI) gWidgets2::svalue(ProgressBar) <- images.progress
                    }




                    # Clean up Global Environment
                    rm(channel,
                       images.progress,
                       path.old,
                       path.ren,
                       progress.Txt,
                       raw.chunk.Channel,
                       raw.chunk.FileExt,
                       raw.size,
                       ren.chunk.Channel)


                }

                # Clean up Global Environment
                rm(section,
                   raw.chunk.Section,
                   ren.chunk.Section)

            }

            # Clean up Global Environment
            rm(time,
               raw.chunk.Loop,
               raw.chunk.Time,
               ren.chunk.Time)

        }

        # Clean up Global Environment
        rm(field,
           raw.chunk.SlideF,
           raw.chunk.Slide,
           raw.chunk.WellX,
           raw.chunk.WellY,
           raw.chunk.FieldX,
           raw.chunk.FieldY,
           raw.chunk.Image,
           raw.chunk.JobID,
           raw.chunk.Eee,
           raw.chunk.Order,
           raw.SlideFolder,
           raw.WellFolder,
           raw.FieldFolder,
           ren.chunk.WellNum,
           ren.chunk.PosNum,
           ren.chunk.data1,
           ren.chunk.data2)

    }

    close(LogFile)
    echo("", printToGUI = printToGUI, printToConsole = printMessages)
    echo("Renaming ended!", printToGUI = printToGUI, printToConsole = printMessages)


    # Clean up Global Environment
    rm(images.done,
       images.total)

}










#' Leica renamer (Navigator)
#'
#' Renaming of Leica Navigator files according to a microscope infile. See \code{\link{newinfile.df}} or \code{\link{newinfile.char}} for a description of the infile structure.
#' @param sourcefolder character, the folder with raw images. Images must have been exported as tif files.
#' @param targetfolder character, folder where to place renamed files. A subfolder wih the same name as the infile will be created by the function and must not exist previously.
#' @param infilepath character, location of the microscope infile
#' @param compress logical, compress raw images?
#' @param move logical, move (rather than copy) raw images?
#' @param outputDescriptors logical, save plain text files with experimental metadata?
#' @param printMessages, logical, print messages in the console?
#' @param printFiles, logical, print file-by-file progress in the console?
#' @param printToGUI logical, print messages to the renamer GUI?
#'
#' @return Renamed files, metadata and log file
#'
#' @seealso
#' \code{\link{rename_leica_gui}} for interacting with this function using a GUI.
#'
#' @export
#' @importFrom gWidgets2 svalue
#' @importFrom tiff readTIFF writeTIFF
#' 
rename_leica_navigator <- function(sourcefolder, targetfolder, infilepath, compress = FALSE, move = FALSE, outputDescriptors = TRUE, printMessages = TRUE, printFiles = TRUE, printToGUI = FALSE){

    echo("Determining renaming parameters...", printToGUI = printToGUI, printToConsole = printMessages)
    echo("The 'Output descriptors' option is not available", printToGUI = printToGUI, printToConsole = printMessages)
    echo("", printToGUI = printToGUI, printToConsole = printMessages)
    
    # if(compress) library(tiff)

    sourcefolder <- gsub("\\\\", "/", sourcefolder)
    sourcefolder <- gsub("(.*)/$", "\\1", sourcefolder)
    targetfolder <- gsub("\\\\", "/", targetfolder)
    targetfolder <- gsub("(.*)/$", "\\1", targetfolder)
    infilepath   <- gsub("\\\\", "/", infilepath)
    
    
    
    # read Infile
    msg <- paste0("Parsing microscope In-File: ", infilepath)
    echo(msg, printToGUI = printToGUI, printToConsole = printMessages)
    
    infile.df       <- read.infile.df(infilepath)
    infilename      <- gsub(".*/(.+?)(\\.[^.]*$|$)", "\\1", infilepath)
    targetsubfolder <- paste0(targetfolder, "/", infilename)
    
    echo("Finished parsing microscope In-File", printToGUI = printToGUI, printToConsole = printMessages)
    
    

    # Navigator may use a variety of schemas when exporting tif images, depending on the version
    # Detect Navigator export schema
    allimages <- character(0)
    navigatorschema <- 0
    
    
    if(length(allimages) == 0){
        #### SCHEMA 1 ####
        REGEXvalidimages <- ".*([A-Z]{1,2})(\\d{1,2})(-(\\d{1,}))?_(t(\\d{1,}))?_?(z(\\d{1,}))?_?c?h?(\\d{2})?\\.tif$"
        
        # This matches the following:
        # 
        # "TileScan 1_A1-1_z0_ch00.tif"
        # "TileScan 2_A1-1_t0_z0_ch00.tif"
        # "TileScan 3_A1-1_z0_ch00.tif"
        # "TileScan 4_A1_z0_ch00.tif"
        # "TileScan 5_A1_ch00.tif"
        # "TileScan 6_A1_t0_z0_ch00.tif"
        # "TileScan 7_A1_t0_ch00.tif"
        # "TileScan 1_A1-1_z0.tif"
        # "A1-1_z0_ch00.tif"
        # "A1-1_z0.tif"
        
        allimages <- list.files(sourcefolder, pattern = REGEXvalidimages, full.names = TRUE, recursive = TRUE)
        navigatorschema <- 1
    }
    
    if(length(allimages) == 0){
        #### SCHEMA 2 ####
        REGEXvalidimages <- ".*([a-zA-Z0-9]{1,})_([A-Z]){1,}_(\\d{1,})_t(\\d{1,})_s(\\d{1,})(_ch(\\d\\d)){0,1}\\.tif$"
        
        # This matches the following:
        # 
        # "Mosaico xy_Mosaico_xy_B_3_t1_s03.tif"
        # "Mosaico xy_Mosaico_xy_B_3_t0_s15_ch01.tif"

        allimages <- list.files(sourcefolder, pattern = REGEXvalidimages, full.names = TRUE, recursive = TRUE)
        navigatorschema <- 2
    }
    
    if(length(allimages) == 0){
        #### SCHEMA 3 ####
        REGEXvalidimages <- ".*/([a-zA-Z]{1,})/([0-9]{1,})/([0-9]{1,})_t(\\d{1,})_s(\\d{1,})(_ch(\\d\\d)){0,1}\\.tif$"
        
        # This matches the following:
        # 
        # "C:/Mosaico_xy/C/3/3_t0_s00.tif"
        # "C:/Mosaico_xy/C/3/3_t0_s00_ch00.tif"
        
        temp_allimages  <- list.files(sourcefolder, pattern = ".tif$", full.names = TRUE, recursive = TRUE)
        allimages       <- temp_allimages[grepl(REGEXvalidimages, temp_allimages)]
        navigatorschema <- 3
    }
    
    if(length(allimages) == 0){
        navigatorschema <- 0
    }
    
    
    if(navigatorschema == 0){
        stop("Unknown Navigator tif export schema")
    } else{
        echo(paste0("Parsing Navigator images using Schema ", navigatorschema), printToGUI = printToGUI, printToConsole = printMessages)
    }
    
    

    # Read raw image folder and store all filenames in a data.frame
    renamer <- data.frame(oldname    = allimages,
                          newname    = character(length(allimages)),
                          coordAlpha = character(length(allimages)),
                          coordNum   = character(length(allimages)),
                          posNum     = character(length(allimages)),
                          timeNum    = character(length(allimages)),
                          zNum       = character(length(allimages)),
                          channelNum = character(length(allimages)),
                          stringsAsFactors = FALSE)
    
    
    # Fill data.frame
    if(navigatorschema == 1){
        renamer$coordAlpha <- gsub(REGEXvalidimages, "\\1", basename(renamer$oldname))
        renamer$coordNum   <- gsub(REGEXvalidimages, "\\2", basename(renamer$oldname))
        renamer$posNum     <- gsub(REGEXvalidimages, "\\4", basename(renamer$oldname))
        renamer$timeNum    <- gsub(REGEXvalidimages, "\\6", basename(renamer$oldname))
        renamer$zNum       <- gsub(REGEXvalidimages, "\\8", basename(renamer$oldname))
        renamer$channelNum <- gsub(REGEXvalidimages, "\\9", basename(renamer$oldname))
    }
    
    if(navigatorschema == 2){
        renamer$coordAlpha <- gsub(REGEXvalidimages, "\\2", basename(renamer$oldname))
        renamer$coordNum   <- gsub(REGEXvalidimages, "\\3", basename(renamer$oldname))
        renamer$posNum     <- gsub(REGEXvalidimages, "\\5", basename(renamer$oldname))
        renamer$timeNum    <- gsub(REGEXvalidimages, "\\4", basename(renamer$oldname))
        renamer$zNum       <- "000"         # Z-stacks not supported yet!
        renamer$channelNum <- gsub(REGEXvalidimages, "\\7", basename(renamer$oldname))
    }
    
    if(navigatorschema == 3){
        renamer$coordAlpha <- gsub(REGEXvalidimages, "\\1", renamer$oldname)
        renamer$coordNum   <- gsub(REGEXvalidimages, "\\2", renamer$oldname)
        renamer$posNum     <- gsub(REGEXvalidimages, "\\5", renamer$oldname)
        renamer$timeNum    <- gsub(REGEXvalidimages, "\\4", renamer$oldname)
        renamer$zNum       <- "000"         # Z-stacks not supported yet!
        renamer$channelNum <- gsub(REGEXvalidimages, "\\7", renamer$oldname)
    }
    
    if(all(renamer$posNum == ""))     renamer$posNum <- 0
    if(all(renamer$timeNum == ""))    renamer$timeNum <- 0
    if(all(renamer$zNum == ""))       renamer$zNum <- 0
    if(all(renamer$channelNum == "")) renamer$channelNum <- 0
    
    # Deal with missing information
    renamer$coordNum   <- formatC(as.integer(renamer$coordNum), width=2, flag="0")
    renamer$posNum     <- formatC(as.integer(renamer$posNum), width=3, flag="0")
    renamer$timeNum    <- formatC(as.integer(renamer$timeNum), width=4, flag="0")
    renamer$zNum       <- formatC(as.integer(renamer$zNum), width=3, flag="0")
    renamer$channelNum <- formatC(as.integer(renamer$channelNum), width=2, flag="0")
    
    
    renamer$newname    <- apply(renamer, 1, function(x){
        
        temp     <- which(infile.df$Row == x["coordAlpha"] & infile.df$Column == x["coordNum"])
        
        wellpath <- paste0("W", formatC(as.integer(infile.df[temp, "WellNum"]), width=4, flag="0"), "--", infile.df[temp, "data1"], "--", infile.df[temp, "data2"])
        pospath  <- paste0("P", x["posNum"], "--", infile.df[temp, "data1"], "--", infile.df[temp, "data2"])
        filename <- paste0(infilename, "--", infile.df[temp, "data1"], "--", infile.df[temp, "data2"], "--W", formatC(as.integer(infile.df[temp, "WellNum"]), width=4, flag="0"), "--", "P", x["posNum"], "--T", x["timeNum"], "--Z", x["zNum"], "--C", x["channelNum"], ".tif")
        
        paste(targetsubfolder, wellpath, pospath, filename, sep = "/")
    })
    

    
    # Create target subfolder
    dir.create(targetsubfolder, showWarnings = FALSE, recursive = TRUE)
    LogFile <- file(paste0(targetsubfolder, "/renamer.log"), "w")
    
    
    
    ## Go through the list and copy files
    ## Write log file as the files are renamed
    totalcopies <- nrow(renamer)
    copiedfiles <- 0
    
    if(compress) cat("Lossless tiff compression using 'Deflate'", file= LogFile, sep="\n", append=TRUE)
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
            
            if(compress){
                # Compress and copy
                img <- tiff::readTIFF(OldFile, native = FALSE, all = TRUE, convert = FALSE, info = TRUE, as.is = FALSE)
                bitdepth <- attr(img[[1]], "bits.per.sample")
                tiff::writeTIFF(img, NewFile, bits.per.sample = bitdepth, compression = "deflate", reduce = FALSE)
                rm(img)
                
            } else{
                # Do not compress. Just copy
                
                file.copy(OldFile, NewFile, overwrite = TRUE)
                
                # Make sure the file has been copied correctly
                while(file.size(OldFile) != file.size(NewFile)){
                    file.copy(OldFile, NewFile, overwrite = TRUE)
                    msg <- paste0(progressTxt, "   Copy error! Retry copy: ", NewFile)
                    echo(msg, printToGUI = printToGUI, printToConsole = printMessages)
                }
            }
            
            
            # Delete OldFile, if required
            if(move) file.remove(OldFile)
            
            msg <- paste0(progressTxt, "   Renamed file: ", NewFile)
            echo(msg, printToGUI = printToGUI, printToConsole = printFiles)
            cat(paste0(OldFile, "|", NewFile), file= LogFile, sep="\n", append=TRUE)
            if(printToGUI) gWidgets2::svalue(ProgressBar) <- progress
            
        } else{
            msg <- paste0("File does not exist: ", OldFile)
            echo(msg, printToGUI = printToGUI, printToConsole = printMessages)
            warning(msg)
            if(printToGUI) gWidgets2::svalue(ProgressBar) <<- progress
        }
        
    }
    
    close(LogFile)
    echo("Renaming Ended", printToGUI = printToGUI, printToConsole = printMessages)
}
