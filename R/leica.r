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
rename_leica_gui <- function(){

    setup.dependency("gWidgets2tcltk")

    # Launch dialog box
    mainWindow <- gwindow("Leica File Renamer Tool")
    size(mainWindow) <- c(300,620)

    # Define groups
    groupMainWindow <- ggroup(spacing = 0, horizontal = FALSE, container = mainWindow)

    groupTopButtons <- ggroup(spacing = 1, horizontal = TRUE, container = groupMainWindow)

    addSpace(groupTopButtons, 3)
    gbutton("Select Input Folder", container = groupTopButtons, handler = function(h,...) {
        sourcefolder <- if(Sys.info()["sysname"] == "Windows"){
                            choose.dir(default = getwd(), caption = "Where are the raw images?")
                        } else{
                            tcltk::tk_choose.dir(default = getwd(), caption = "Where are the raw images?")
                        }
        gWidgets2::svalue(labelsourcefolder) <- sourcefolder
        print(paste0("Input folder: ", gWidgets2::svalue(labelsourcefolder)))
    })
    gbutton("Select Output Folder", container = groupTopButtons, handler = function(h,...) {
        targetfolder <- if(Sys.info()["sysname"] == "Windows"){
                            choose.dir(default = getwd(), caption = "Where do you want to save the images?")
                        } else{
                            tcltk::tk_choose.dir(default = getwd(), caption = "Where do you want to save the images?")
                        }
        gWidgets2::svalue(labeltargetfolder) <- targetfolder
        print(paste0("Output folder: ", gWidgets2::svalue(labeltargetfolder)))
    })
    gbutton("Select Microscope Infile", container = groupTopButtons, handler = function(h,...) {
        infilepath <- if(Sys.info()["sysname"] == "Windows"){
                        choose.files(default = "", caption = "Select the in-file", multi = FALSE)
                      } else{
                        tcltk::tk_choose.files(default = "", caption = "Select the in-file", multi = FALSE)
                      }
        gWidgets2::svalue(labelInFile) <- infilepath
        print(paste0("In-file: ", gWidgets2::svalue(labelInFile)))
    })

    groupLabels1 <- ggroup(spacing = 1, horizontal = TRUE, container = groupMainWindow)

    addSpace(groupLabels1, 3)
    glabel("Input Folder:   ", container = groupLabels1)
    labelsourcefolder <- glabel("<not specified>", container = groupLabels1)
    addSpace(groupLabels1, 3)

    groupLabels2 <- ggroup(spacing = 1, horizontal = TRUE, container = groupMainWindow)

    addSpace(groupLabels2, 3)
    glabel("Output Folder:", container = groupLabels2)
    labeltargetfolder <- glabel("<not specified>", container = groupLabels2)
    addSpace(groupLabels2, 3)

    groupLabels3 <- ggroup(spacing = 1, horizontal = TRUE, container = groupMainWindow)

    addSpace(groupLabels3, 3)
    glabel("Mic-In File:      ", container = groupLabels3)
    labelInFile <- glabel("<not specified>", container = groupLabels3)
    addSpace(groupLabels3, 3)

    groupLog <- ggroup(horizontal = FALSE, container = groupMainWindow)

    logWindow <<- gtext("Leica file renamer tool\nMay 2019\nHugo Botelho\nhmbotelho@fc.ul.pt\n\n", width = 100, height = 300, container = groupLog)

    groupProgressBar <- ggroup(spacing = 1, horizontal = FALSE, container = groupMainWindow)

    ProgressBar <<- gprogressbar(value=0, container = groupProgressBar)

    groupBottomButtons <- ggroup(horizontal = FALSE, container = groupMainWindow)

    gbutton("Start renaming", container = groupBottomButtons, handler = function(h,...) {
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
            gWidgets2::insert(logWindow,"Starting Transfer !\n")
            print("Starting Transfer!")

            #Start transfer
            rename_leica(sourcefolder      = gWidgets2::svalue(labelsourcefolder),
                         targetfolder      = gWidgets2::svalue(labeltargetfolder),
                         infilepath        = gWidgets2::svalue(labelInFile),
                         compress          = gWidgets2::svalue(compressFiles),
                         # move              = gWidgets2::svalue(moveFiles),
                         outputDescriptors = gWidgets2::svalue(writeDescriptors),
                         printToGUI        = TRUE)

        }
    })

    writeDescriptors <- gcheckbox("Output experiment descriptors?", checked = TRUE, container = groupMainWindow)

    compressFiles <- gcheckbox("Lossless compression?", checked = TRUE, container = groupMainWindow)
    # moveFiles <- gcheckbox("Move files?", checked = FALSE, container = groupMainWindow)

}









#' Leica renamer
#'
#' Renaming of Leica MatrixScreener files according to a microscope infile. See \code{\link{newinfile.df}} or \code{\link{newinfile.char}} for a description of the infile structure.
#' @param sourcefolder character, the folder with raw images. The folder usually has the folllowing name structure: \code{demoplate_01--2019_01_01_12_00_00}
#' @param targetfolder character, folder where to place renamed files. A subfolder wih the same name as the infile will be created by the function and must not exist previously.
#' @param infilepath character, location of the microscope infile
#' @param compress logical, compress raw images?
#' @param move logical, move (rather than copy) raw images?
#' @param outputDescriptors logical, save plain text files with experimental metadata?
#' @param printToGUI logical, print messages to the renamer GUI?
#'
#' @return Renamed files, metadata and log file
#'
#' @return Null
#'
#' @seealso
#' \code{\link{rename_leica_gui}} for interacting with this function using a GUI.
#'
#' @export
rename_leica <- function(sourcefolder, targetfolder, infilepath, compress = FALSE, move = FALSE, outputDescriptors = TRUE, printToGUI = TRUE){

    setup.dependency("XML")
    if(compress) setup.dependency("tiff")
    if(outputDescriptors) setup.dependency("xlsx")

    echo("Preparing renaming...", printToGUI)
    echo("", printToGUI)





    ### Initialize variables which apparently are not in the Leica xml files
    TokenEPos    <- "E"
    TokenEDigits <- 2
    Eee          <- 0





    ### Initialize file- and folder-related variables
    echo("Analyzing MatrixScreener folder structure", printToGUI)

    sourcefolder <- gsub("\\\\", "/", sourcefolder)
    sourcefolder <- ifelse(endsWith(sourcefolder, "/"), sourcefolder, paste0(sourcefolder, "/"))
    targetfolder <- gsub("\\\\", "/", targetfolder)
    infilepath   <- gsub("\\\\", "/", infilepath)
    xmlfolder    <- paste0(sourcefolder, "AdditionalData")

    file.lif2ome <- paste0(xmlfolder, "/LIF2OME.xml")
    if(!file.exists(file.lif2ome)){
        echo(paste0("LIF2OME.xml file does not exist: ", file.lif2ome), printToGUI)
        stop(paste0("LIF2OME.xml file does not exist: ", file.lif2ome))
    }

    file.xml     <- getfiles.XML.LRP(xmlfolder)["XML"]
    if(!file.exists(file.xml)){
        echo("Scanning template file does not exist: {ScanningTemplate}xxxxx.xml", printToGUI)
        stop("Scanning template file does not exist: {ScanningTemplate}xxxxx.xml")
    }

    file.lrp     <- getfiles.XML.LRP(xmlfolder)["LRP"]
    if(!file.exists(file.lrp)){
        echo("Leica settings file does not exist: {ScanningTemplate}xxxxx.lrp", printToGUI)
        stop("Leica settings file does not exist: {ScanningTemplate}xxxxx.lrp")
    }

    echo("Found all MatrixScreener data files", printToGUI)
    echo("", printToGUI)





    ### Infile
    echo(paste0("Parsing microscope In-File: ", infilepath), printToGUI)

    infile.df       <- read.infile.df(infilepath)
    ren.expname     <- gsub(".*/(.+?)(\\.[^.]*$|$)", "\\1", infilepath)
    targetsubfolder <- paste0(targetfolder, "/", ren.expname, "/")

    echo("Finished parsing microscope In-File", printToGUI)





    ### File LIF2OME.xml
    echo(paste0("Parsing file ", file.lif2ome), printToGUI)

    doc <- xmlTreeParse(file.lif2ome, useInternal = TRUE)
    top <- xmlRoot(doc)
    formats                   <- xpathSApply(top, "//Format/*", xmlValue)
    names(formats)            <- xpathSApply(top, "//Format/*", xmlName)
    tokens                    <- xpathSApply(top, "//TokenNames/*", xmlValue)
    names(tokens)             <- xpathSApply(top, "//TokenNames/*", xmlName)
    SlideFolderName           <- xpathSApply(doc, "//SlideFolderName", xmlValue)
    names(SlideFolderName)    <- "SlideFolderName"
    WellFolderName            <- xpathSApply(doc, "//WellFolderName", xmlValue)
    names(WellFolderName)     <- "WellFolderName"
    FieldFolderName           <- xpathSApply(doc, "//FieldFolderName", xmlValue)
    names(FieldFolderName)    <- "FieldFolderName"
    SubfieldFolderName        <- xpathSApply(doc, "//SubfieldFolderName", xmlValue)
    names(SubfieldFolderName) <- "SubfieldFolderName"
    AFJobFolderName           <- xpathSApply(doc, "//AFJobFolderName", xmlValue)
    names(AFJobFolderName)    <- "AFJobFolderName"
    MetadataFolderName        <- xpathSApply(doc, "//MetaDataFolderName", xmlValue)
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

    echo(paste0("Finished parsing ", file.lif2ome), printToGUI)





    #    # Get extra settings
    #    ScanWellArray         <- as.data.frame(t(sapply(getNodeSet(top, "//ScanWellArray/*"), xmlAttrs)), stringsAsFactors = FALSE)
    #    ScanWellArray$SlideNo <- as.integer(ScanWellArray$SlideNo) - 1
    #    ScanWellArray$WellX   <- as.integer(ScanWellArray$WellX) - 1
    #    ScanWellArray$WellY   <- as.integer(ScanWellArray$WellY) - 1
    #    ScanFieldArray        <- sapply(getNodeSet(top, "//Properties/*"), xmlValue)
    #    names(ScanFieldArray) <- sapply(getNodeSet(top, "//Properties/*"), xmlName)


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

    echo(paste0("Parsing file ", file.lrp), printToGUI)

    ImagingSettings <- list()
    doc             <- xmlTreeParse(file.lrp, useInternal = TRUE)
    top             <- xmlRoot(doc)
    AllJobsNode     <- getNodeSet(top, "//LDM_Block_Sequence_Block")
    LASXversion     <- gsub("^<!--LAS X (.*)-->$", "\\1", readLines(file.lrp)[5])
    names(LASXversion) <- "LASXversion"

    # Get settings from each imaging job
    JobCount <- length(AllJobsNode)
    JobInfo  <- data.frame(row.names = c("name", "modality", "channelcount"),
                           stringsAsFactors = FALSE)
    for(i in 1:JobCount){
        jobname       <- xmlAttrs(AllJobsNode[[i]])[["BlockID"]]
        jobmodality   <- switch(names.XMLNode(AllJobsNode[[i]][["LDM_Block"]]),
                                ATLCameraSettingDefinition   = "widefield",
                                ATLConfocalSettingDefinition = "confocal")
        if(is.null(jobmodality)) stop(paste0("Unknown modality for Job ", i, " [ ", jobname, "]"))

        if(jobmodality == "widefield"){

            # Basic settings
            newjob <- data.frame(c(name         = as.character(xmlSApply(AllJobsNode[[i]], xmlAttrs)),
                                   modality     = "widefield",
                                   channelcount = length(xmlChildren(AllJobsNode[[i]][["LDM_Block"]][["ATLCameraSettingDefinition"]][["WideFieldChannelConfigurator"]]))))
            names(newjob) <- jobname
            JobInfo <- cbind(JobInfo, newjob)

            # Advanced settings
            JobDescriptors <- c(xmlAttrs(AllJobsNode[[i]]),
                                xmlSApply(AllJobsNode[[i]], xmlAttrs),
                                xmlAttrs(AllJobsNode[[i]][["LDM_Block"]][["ATLCameraSettingDefinition"]]),
                                xmlAttrs(AllJobsNode[[i]][["LDM_Block"]][["ATLCameraSettingDefinition"]][["CameraFormat"]]),
                                xmlAttrs(AllJobsNode[[i]][["LDM_Block"]][["ATLCameraSettingDefinition"]][["WideFieldChannelConfigurator"]]),
                                LASXversion)

            # Create data frame "ChannelDescriptors". Each column is one imaging channel
            ChannelDescriptors <- xpathSApply(AllJobsNode[[i]], "LDM_Block/ATLCameraSettingDefinition/WideFieldChannelConfigurator/WideFieldChannelInfo", xmlAttrs)
            ChannelDescriptors <- as.data.frame(ChannelDescriptors, stringsAsFactors = FALSE)
            colnames(ChannelDescriptors) <- paste0("C", formatC(0:(ncol(ChannelDescriptors)-1), width = as.numeric(NameSettings["TokenFieldCPosDigits"]), flag="0"))
            temp               <- as.data.frame(matrix(rep(LASXversion, ncol(ChannelDescriptors)), 1, ncol(ChannelDescriptors), dimnames = list("LASXversion")))
            colnames(temp)     <- colnames(ChannelDescriptors)
            ChannelDescriptors <- rbind(ChannelDescriptors, temp)

            BlockID <- JobDescriptors["BlockID"]
            ImagingSettings[[BlockID]] <- list(JobDescriptors = JobDescriptors, Channels = ChannelDescriptors)

            # Determine the image bit depth. This information is required for the compression step.
            bitdepth <- max(sapply(ImagingSettings, function(x) as.integer(x$JobDescriptors["Resolution"])), na.rm = TRUE)

            # Clean environment
            rm(jobname, newjob, i)
            rm(JobDescriptors, ChannelDescriptors, BlockID)
        }

        if(jobmodality == "confocal"){

            # Basic settings
            newjob <- data.frame(c(name         = as.character(xmlSApply(AllJobsNode[[i]], xmlAttrs)),
                                   modality     = "confocal",
                                   channelcount = sum(xpathSApply(AllJobsNode[[i]], "LDM_Block/ATLConfocalSettingDefinition/DetectorList/Detector", xmlGetAttr, 'IsActive') == "1")))
            names(newjob) <- jobname
            JobInfo <- cbind(JobInfo, newjob)

            # Advanced settings
            JobDescriptors <- c(xmlAttrs(AllJobsNode[[i]]),
                                xmlSApply(AllJobsNode[[i]], xmlAttrs),
                                xmlAttrs(AllJobsNode[[i]][["LDM_Block"]][["ATLConfocalSettingDefinition"]]),
                                unlist(lapply(xmlChildren(AllJobsNode[[i]][["LDM_Block"]][["ATLConfocalSettingDefinition"]][["Spectro"]]), xmlAttrs)),
                                unlist(lapply(xmlChildren(AllJobsNode[[i]][["LDM_Block"]][["ATLConfocalSettingDefinition"]][["AotfList"]]), function(x) xmlAttrs(x[["LaserLineSetting"]]))),
                                unlist(lapply(xmlChildren(AllJobsNode[[i]][["LDM_Block"]][["ATLConfocalSettingDefinition"]][["DetectorList"]]), xmlAttrs)),
                                unlist(lapply(xmlChildren(AllJobsNode[[i]][["LDM_Block"]][["ATLConfocalSettingDefinition"]][["LaserArray"]]), xmlAttrs)),
                                LASXversion)

            # Create data frame "ChannelDescriptors". Each column is one imaging channel
            ChannelDescriptors <- xpathSApply(AllJobsNode[[i]], "LDM_Block/ATLConfocalSettingDefinition/DetectorList/Detector", xmlAttrs)
            ChannelDescriptors <- ChannelDescriptors[sapply(ChannelDescriptors, function(x) x["IsActive"] == "1")]
            ChannelDescriptors <- if(class(ChannelDescriptors) == "list"){
                allheaders <- lapply(ChannelDescriptors, names)
                commonheaders <- Reduce(intersect, allheaders)
                ChannelDescriptors2 <- lapply(ChannelDescriptors, function(x){
                    x <- x[commonheaders]
                    as.data.frame(x)
                })
                do.call(cbind, ChannelDescriptors2)
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

        rm(jobmodality)
    }


    echo(paste0("Finished parsing ", file.lrp), printToGUI)

    # Clean Global Environment
    rm(doc, top, AllJobsNode)




    ### File {Scanning Template}xxx.xml
    echo(paste0("Parsing file ", file.xml), printToGUI)

    doc <- xmlTreeParse(file.xml, useInternal = TRUE)
    top <- xmlRoot(doc)

    # Major template settings
    TemplateProperties        <- c(as.character(xpathSApply(top, "//Properties", xmlAttrs)), xpathSApply(top, "//Properties/*", xmlValue))
    names(TemplateProperties) <- c(rownames(xpathSApply(top, "//Properties", xmlAttrs)), xpathSApply(top, "//Properties/*", xmlName))

    # Data frame "FieldsAll": contains filename settings for each field
    FieldsAll                <- xmlSApply(top[["ScanFieldArray"]], xmlAttrs)
    FieldsAll                <- as.data.frame(t(FieldsAll), stringsAsFactors = FALSE)
    class(FieldsAll$JobId)   <- "numeric"
    class(FieldsAll$SlideNo) <- "numeric"
    class(FieldsAll$WellX)   <- "numeric"
    class(FieldsAll$WellY)   <- "numeric"
    class(FieldsAll$FieldX)  <- "numeric"
    class(FieldsAll$FieldY)  <- "numeric"

    # Embed field coordinates
    xyz       <- getNodeSet(top, "//ScanFieldData")
    xyz       <- lapply(xyz, function(x) xmlSApply(x, xmlValue))
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
        echo("Error parsing column 'data1' in infile. Weird characters may be found in the 'FieldsAll' table.", printToGUI)
        FieldsAll$data1<-as.character(FieldsAll$data1)
    }
    if(class(FieldsAll$data2) == "list"){
        echo("Error parsing column 'data2' in infile. Weird characters may be found in the 'FieldsAll' table.", printToGUI)
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

    echo(paste0("Finished parsing ", file.xml), printToGUI)
    echo("", printToGUI)

    # Clean Global Environment
    rm(doc, top, xyz)





    ### Create target folder

    if(dir.exists(targetsubfolder)){
        echo(paste0("Folder ", targetsubfolder, " already exists! Aborting renaming process."), printToGUI)
        stop()
    }
    dir.create(targetsubfolder)





    ### Save setttings to text files
    if(outputDescriptors){
        echo("Exporting experiment descriptors...", printToGUI)

        # Save 1: Field Settings
        write.csv(FieldsAll,    paste0(targetsubfolder, "Fields_all.csv"), row.names = FALSE)
        write.csv(FieldsActive, paste0(targetsubfolder, "Fields_active.csv"), row.names = FALSE)

        # Save 2: ImagingSettings list
        targetxlsxChannels <- paste0(targetsubfolder, "settings_channels.xlsx")
        targetxlsxJobs     <- paste0(targetsubfolder, "settings_jobs.xlsx")

        for(job in 1:length(ImagingSettings)){
            JobName     <- paste0(NameSettings["TokenFieldJPos"], formatC(as.numeric(names(ImagingSettings)[job]), width=NameSettings["TokenFieldJPosDigits"], flag="0"))
            JobSettings <- data.frame(names(ImagingSettings[[job]][[1]]),
                                      ImagingSettings[[job]][[1]],
                                      stringsAsFactors = TRUE)
            colnames(JobSettings) <- c("Setting", JobName)
            write.xlsx(JobSettings, targetxlsxJobs, sheetName = JobName, row.names = FALSE, append = TRUE)

            ChannelSettings <- ImagingSettings[[job]][[2]]
            write.xlsx(ChannelSettings, targetxlsxChannels, sheetName = paste0("channels_", JobName), append = TRUE)
        }

        # Save 3: Other settings
        write.csv(data.frame(Setting = names(TemplateProperties), Value = TemplateProperties), paste0(targetsubfolder, "template_properties.csv"), row.names = FALSE)
        write.csv(data.frame(Setting = names(NameSettings), Value = NameSettings), paste0(targetsubfolder, "settings_filenames.csv"), row.names = FALSE)


        # Clean up Global Environment
        rm(targetxlsxChannels, targetxlsxJobs, job, JobName, JobSettings, ChannelSettings)

        echo("Finished exporting experiment descriptors", printToGUI)
        echo("", printToGUI)
    }






    ### Copy/move renamed files


    # Initialize
    echo("Starting file renaming...", printToGUI)

    images.total <- sum(apply(FieldsActive, 1, function(x) prod(as.numeric(x[c("HowManyChannels","HowManySections","HowManyTimes")]))))
    images.done  <- 0
    LogFileName <- paste0(targetsubfolder, "renamer.log")
    LogFile      <- file(LogFileName, "w")
    echo(paste0("Logging renaming to: ", LogFileName), printToGUI)
    if(compress) cat("Lossless tiff compression using 'Deflate'", file= LogFile, sep="\n", append=TRUE)
    cat("Raw Filename|Renamed Filename", file= LogFile, sep="\n", append=TRUE)
    echo(paste0("Found ", images.total, " files to be renamed"), printToGUI)
    echo("", printToGUI)

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

                # raw.chunk.Section <- if(FieldsActive[field,"HowManySections"] == 1 & FieldsActive[field, "Modality"] == "widefield"){
                raw.chunk.Section <- if(FieldsActive[field,"HowManySections"] == 1 & LASXversion %in% c("3.0.0.15697", "3.1.0.15537")){
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
                            img <- readTIFF(path.old, native = FALSE, all = TRUE, convert = FALSE, info = TRUE, as.is = FALSE)
                            writeTIFF(img, path.ren, bits.per.sample = bitdepth, compression = "deflate", reduce = FALSE)
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

                        # Write progress to console
                        echo(progress.Txt, printToGUI = FALSE)

                        # Write progress to GUI
                        if(printToGUI){
                            gWidgets2::insert(logWindow, progress.Txt)
                            gWidgets2::svalue(ProgressBar) <- images.progress
                        }




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

                        # Write progress to console
                        echo(progress.Txt, printToGUI = FALSE)

                        # Write progress to GUI
                        if(printToGUI){
                            gWidgets2::insert(logWindow, progress.Txt)
                            gWidgets2::svalue(ProgressBar) <- images.progress
                        }
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
    echo("", printToGUI)
    echo("Renaming ended!", printToGUI)


    # Clean up Global Environment
    rm(images.done,
       images.total)

}
