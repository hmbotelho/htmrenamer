# htmrenamer
*Systematic renaming of high throughput microscopy images*





## Table of Contents
* [1. Overview](#overview)
* [2. Setup](#installation)
	* [2.1. Windows](#installation-windows)
	* [2.2. macOS](#installation-macos)
* [3. Generating well descriptors](#descriptors)
* [4. File renaming](#renaming)
    * [4.1. Zeiss](#renaming-zeiss)
    * [4.2. Leica](#renaming-leica)
* [5. Conventions](#moreinfo)
* [6. Troubleshooting](#troubleshooting)
* [7. Citation](#citation)





## <a name="overview">1. Overview</a>


High throughput microscopy systems output raw image files with systematic names typically indicating the plate name, well identity, time number, z slice number and other relevant metadata. The file name structure depends on the manufacturer:

* **Zeiss:** `demoplate_01_s01t1.tif`
* **Leica (MatrixScreener):** `I--L0000--S00--U00--V00--J08--E00--O00--X00--Y00--T0000--Z00--C00.ome.tif`
* **Leica (Navigator):** `TileScan 1_A1_ch00.tif`, `TileScan 2_A1-1_t0_z0_ch00.tif`, ...
* **...**

The htmrenamer R package provides graphical and command line tools for renaming such files in order to generate a common file and folder structure, regardless of the system generating the images. The renaming process adds essential experimental metadata in the file and folder names:
* Plate name
* Well number
* Sub-position within the well
* Time number
* Fluorescence channel sequence
* Experimental treatment 1 (*e.g.* compound)
* Experimental treatment 2 (*e.g.* compound concentration)
    
htmrenamer produces file and folder structures such as the one depicted below or on the [sample data repository](https://github.com/hmbotelho/htmrenamer_testdata).

```
plate_folder
          ┣ Well 1
          ┃      ┣ Position 1
          ┃      ┃          ┣ platename--compound--concentration--W0001--P002--T0000--Z000--C00.ome.tif
          ┃      ┃          ┣ platename--compound--concentration--W0001--P002--T0000--Z000--C01.ome.tif
          ┃      ┃          ...
          ┃      ┣ Position 1
          ┃      ┣ Position 2
          ┃      ...
          ┣ Well 2
          ...
```

By adapting manufacturer-specific file names into a common structure, htmrenamer facilitates manual image inspection, regular expression-based data annotation (*e.g.* using [CellProfiler](https://cellprofiler.org/)) and enables downstream image analysis protocols to be readily performed regardless of the brand of the microscope generating the images. htmrenamer is best used as a complement to the [OME-TIFF](https://docs.openmicroscopy.org/ome-model/5.6.3/ome-tiff/) format.

The [htmrenamer manual](./htmrenamer.pdf) documents all functions in the package.





## <a name="installation">2. Setup</a>

The setup procedure installs the htmrenamer package in your computer. This is only required when using the package for the first time.
The most common issues when installing htmrenamer are addressed in the [troubleshooting section](#troubleshooting).


### <a name="installation-windows">2.1. Windows</a>

1. **Install R:** Download R from the [CRAN website](https://cran.r-project.org/) and install it.


2. **Download htmrenamer:** Download the [latest htmrenamer release](https://github.com/hmbotelho/htmrenamer/releases) (`htmrenamer_xxx.tar.gz`).


3. **Install the htmrenamer package:** Open R. In the command line type

	```
	install.packages(c("gWidgets2", "gWidgets2tcltk", "openxlsx", "reshape2", "tiff", "XML"), dependencies=T)
	install.packages("c:/path_to_file/htmrenamer_xxx.tar.gz", repos=NULL)
	```
	
	*If prompted, select a folder in your computer and a CRAN mirror.*
	
	*The location of the `.tar.gz` file can also be provided with the R graphical user interface (`Packages > Install package(s) from local files...`*


*Tested with R version 4.0.2 running under Windows 10 Home version 2004, build 19041.508*


### <a name="installation-macos">2.2. macOS</a>

1. **Install R:** Download R from the [CRAN website](https://cran.r-project.org/) and install it.


2. **Install the Command Line Tools for Xcode:** Download and install the latest version matching your macOS version from [here](https://developer.apple.com/download/more/?=command%20line%20tools) (Apple ID required).


3. **Install XQuartz:** Download and install from [here](https://www.xquartz.org/).


4. **Log out and log in** from your macOS session. The XQuartz installer should request this.


5. **Download htmrenamer:** Download the [latest htmrenamer release](https://github.com/hmbotelho/htmrenamer/releases) (`htmrenamer_xxx.tar.gz`). This file will show up in Finder as (`htmrenamer_xxx.tar`).


6. **Install the htmrenamer package:** Open R. In the command line type

	```
	install.packages(c("gWidgets2", "gWidgets2tcltk", "openxlsx", "reshape2", "tiff", "XML"), dependencies=T)
	install.packages("/path_to_file/htmrenamer_xxx.tar", repos=NULL, type="source")
	```
	
	*If prompted, select a CRAN mirror.*
	*If asked `Do you want to install from sources the packages which need compilation` answer `Yes` or `y`*

The htmrenamer installation was positively tested in the following environments:

|      **OS version**        | **R version** | **Command Line Tools version** | **XQuartz version** |
|:--------------------------:|:-------------:|:------------------------------:|---------------------|
|    macOS 10.15 Catalina    |     4.0.2     |              11.5              |        2.7.11       |
|     macOS 10.14 Mojave     |     4.0.2     |              8.3.2             |        2.7.11       |
| macOS 10.13.16 High Sierra |     4.0.2     |              8.3.2             |        2.7.11       |
|     macOS 10.12 Sierra     |     3.6.3     |              8.3.2             |        2.7.11       |
|   OS X 10.11 El Capitan    |     3.5.3     |               7.3              |        2.7.11       |
|    OS X 10.10 Yosemite     |     3.3.3     |               6.4              |        2.7.11       |
|    OS X 10.9 Mavericks     |     3.3.3     |               6.2              |        2.7.11       |

*htmrenamer is not compatible with older macOS/OS X versions.*





## <a name="descriptors">3. Generating well descriptors</a>


Renaming of raw microscopy images requires that the experimental treatment of each well are described in a plain text microscope “infile”. Common treatments are:

* Compound & concentration
* siRNA reference & target gene
* Cell line & experimental insult
* ...

The microscope infile has a table-like structure:

```
001--A--01--00--00--fsk--0.008
002--A--02--01--00--fsk--5
003--A--03--02--00--fsk_vx809--0.008
004--A--04--03--00--fsk_vx809--5
005--A--05--04--00--fsk_vx770--0.008
006--A--06--05--00--fsk_vx770--5
```

Columns are separated by a double dash (`--`) and represent:

* **Well Number** (`001`, `002`, `003`, ...)
* **Row Coordinate** (`A`, `B`, `C`, ...)
* **ColumnCoordinate** (`01`, `02`, `03`, ...)
* **ColumnCoordinate** (`00`, `01`, `02`, ...)
* **Row Coordinate** (`00`, `01`, `02`, ...)
* **Experimental condition 1 (*e.g.* compound)** (`fsk`, `fsk_vx809`, ...)
* **Experimental condition 2 (*e.g.* concentration)** (`0.008`, `5`, ...)


To generate a blank infile corresponding to a 96 well plate (8 × 12 wells), type the following commands in the R command line:

```
library("htmrenamer")
newinfile.char(8, 12, show = TRUE, saveto = "myinfile.txt")
```

The infile will be displayed on the R console and saved to the working directory (to know what that is, type `getwd()`). This file can now be edited to describe any given assay plate. The `txt` file extension is recommended.

[This file](https://github.com/hmbotelho/htmrenamer/blob/master/extras/InFile_template.xlsx) simplifies the description of 96 and 384 well plates.





## <a name="renaming">4. File renaming</a>

The file renaming tools take as inputs raw microscopy images and the microscope infile, to generate a common file/folder structure, regardless of the microscope manufacturer. htmrenamer currently supports the renaming of images acquired with Zeiss and Leica high-throughput microscopes.



### <a name="renaming-zeiss">4.1. Zeiss</a>

Images acquired in the CZI format must first be exported as TIF files (in Zen Blue edition: `File > Export/Import > Export > TIFF`).
Sample exported images are available in the [sample data repository](https://github.com/hmbotelho/htmrenamer_testdata/tree/master/zeiss/01_T/raw)


1. In the R command line type

```
library(htmrenamer)
rename_zeiss_gui()
```


2. If prompted, select a CRAN mirror to download the required additional libraries.


3. The renaming tool window will appear:

<p align="center"><img src="./img/renamer_zeiss.png"></p>


4. Specify the following details of the experiment:
    * **Select input folder:** Folder with exported TIF files.
    * **Select output folder:** Folder where renamed images should be saved to.
    * **Select Microscope Infile:** Location of the infile.
    * **Number of rows:** Number of rows in the assay plate, regardless of how many wells were imaged. [96 well plates: 8][384 well plates: 16].
    * **Number of columns:** Number of columns in the assay plate, regardless of how many wells were imaged. [96 well plates: 12][384 well plates: 24].


5. Click the `Start renaming` button to start the file renaming process.  

	**Note 1:** This is a copy-and-duplicate process.  
	
	**Note 2:** The name of the infile `txt` file should be meaningful as this will be propagated to the renamed files and folders.  


6. Progress will be shown in the log text box as well as in the R console.


7. The renaming process will create a folder structure which with renamed files like this one:

<p align="center"><img src="./img/renamer_files.png"></p>



### <a name="renaming-leica">4.2. Leica</a>

htmrenamer supports images generated with the following modules of the Leica LAS X software:  

* **Leica MatrixScreener**. Files must be exported as OME-TIFF (`Auto-export`).
* **Leica Navigator**. Files must be exported with (`Export > As Tiff...`).

Sample exported images are available in the [sample data folder](/sample_data/Leica/confocal_raw)


1. In the R command line type

```
library(htmrenamer)
rename_leica_gui()
```


2. If prompted, select a CRAN mirror to download the required additional libraries.


3. The renaming tool window will appear:

<p align="center"><img src="./img/renamer_leica.png"></p>


4. Specify the following details of the experiment:
    * **Select input folder:** Folder with exported TIF files (_e.g._ `platename--YY_MM_DD_HH_MM_SS` for MatrixScreener exports).
    * **Select output folder:** Folder where renamed images should be saved to.
    * **Select Microscope Infile:** Location of the infile.
    * **Output experiment descriptors:** Export experiment metadata in Excel and CSV format. Only supported for MatrixScreener images.
    * **Lossless compression:** Performs lossless image compression using the “deflate” algorithm. Typically, this produces a file size ~20% lower than LZW-compressed images but removes all metadata (e.g. pixel size calibration).


5. Click the `Start renaming` button to start the file renaming process.  

	**Note 1:** This is a copy-and-duplicate process.  
	
	**Note 2:** The name of the infile `txt` file should be meaningful as this will be propagated to the renamed files and folders.  
	

6. Progress will be shown in the log text box as well as in the R console.


7. The renaming process will create a folder structure which with renamed files like this one:

<p align="center"><img src="./img/renamer_files.png"></p>





## <a name="moreinfo">5. Conventions</a>

Wells are numbered sequentially, left-to-right and top-to-bottom. As an example, this is how wells are numbered in a 96 well plate:

|   	|  **1** 	|  **2** 	|  **3** 	|  **4** 	|  **5** 	|  **6** 	|  **7** 	|  **8** 	|  **9** 	| **10** 	| **11** 	| **12** 	|
|:-:	|:--:	|:--:	|:--:	|:--:	|:--:	|:--:	|:--:	|:--:	|:--:	|:--:	|:--:	|:--:	|
| **A** 	|  1 	|  2 	|  3 	|  4 	|  5 	|  6 	|  7 	|  8 	|  9 	| 10 	| 11 	| 12 	|
| **B** 	| 13 	| 14 	| 15 	| 16 	| 17 	| 18 	| 19 	| 20 	| 21 	| 22 	| 23 	| 24 	|
| **C** 	| 25 	| 26 	| 27 	| 28 	| 29 	| 30 	| 31 	| 32 	| 33 	| 34 	| 35 	| 36 	|
| **D** 	| 37 	| 38 	| 39 	| 40 	| 41 	| 42 	| 43 	| 44 	| 45 	| 46 	| 47 	| 48 	|
| **E** 	| 49 	| 50 	| 51 	| 52 	| 53 	| 54 	| 55 	| 56 	| 57 	| 58 	| 59 	| 60 	|
| **F** 	| 61 	| 62 	| 63 	| 64 	| 65 	| 66 	| 67 	| 68 	| 69 	| 70 	| 71 	| 72 	|
| **G** 	| 73 	| 74 	| 75 	| 76 	| 77 	| 78 	| 79 	| 80 	| 81 	| 82 	| 83 	| 84 	|
| **H** 	| 85 	| 86 	| 87 	| 88 	| 89 	| 90 	| 91 	| 92 	| 93 	| 94 	| 95 	| 96 	|


The same convention applies if multiple imaging fields have been acquired inside each well, according to a sub-position matrix. This example shows the numbering of 5×5 imaging fields inside a well:


<table class="tg">
  <tr>
    <td class="tg-pos">P001</td>
    <td class="tg-pos">P002</td>
    <td class="tg-pos">P003</td>
    <td class="tg-pos">P004</td>
    <td class="tg-pos">P005</td>
  </tr>
  <tr>
    <td class="tg-pos">P006</td>
    <td class="tg-pos">P007</td>
    <td class="tg-pos">P008</td>
    <td class="tg-pos">P009</td>
    <td class="tg-pos">P010</td>
  </tr>
  <tr>
    <td class="tg-pos">P011</td>
    <td class="tg-pos">P012</td>
    <td class="tg-pos">P013</td>
    <td class="tg-pos">P014</td>
    <td class="tg-pos">P015</td>
  </tr>
  <tr>
    <td class="tg-pos">P016</td>
    <td class="tg-pos">P017</td>
    <td class="tg-pos">P018</td>
    <td class="tg-pos">P019</td>
    <td class="tg-pos">P020</td>
  </tr>
  <tr>
    <td class="tg-pos">P021</td>
    <td class="tg-pos">P022</td>
    <td class="tg-pos">P023</td>
    <td class="tg-pos">P024</td>
    <td class="tg-pos">P025</td>
  </tr>
</table>


The Leica renaming tool will ignore unused wells and sub-positions, but keep the same numbering as shown before. Here is an example for a well where only some sub-positions have been imaged:


<table class="tg">
  <tr>
    <td class="tg-pos"></td>
    <td class="tg-pos"></td>
    <td class="tg-pos">P003</td>
    <td class="tg-pos"></td>
    <td class="tg-pos"></td>
  </tr>
  <tr>
    <td class="tg-pos"></td>
    <td class="tg-pos">P007</td>
    <td class="tg-pos"></td>
    <td class="tg-pos">P009</td>
    <td class="tg-pos"></td>
  </tr>
  <tr>
    <td class="tg-pos">P011</td>
    <td class="tg-pos"></td>
    <td class="tg-pos">P013</td>
    <td class="tg-pos"></td>
    <td class="tg-pos">P015</td>
  </tr>
  <tr>
    <td class="tg-pos"></td>
    <td class="tg-pos">P017</td>
    <td class="tg-pos"></td>
    <td class="tg-pos">P019</td>
    <td class="tg-pos"></td>
  </tr>
  <tr>
    <td class="tg-pos"></td>
    <td class="tg-pos"></td>
    <td class="tg-pos">P023</td>
    <td class="tg-pos"></td>
    <td class="tg-pos"></td>
  </tr>
</table>





## <a name="troubleshooting">6. Troubleshooting</a>

This section contains fixes for the most common problems one may find when installing or running htmrenamer.


**otool error (macOS)**

The following message is displayed if **Command Line Tools for Xcode** is not installed:

```
The "otool" command requires the command line developer tools. Would you like to install the tools now?
```

You may instruct R to install the Command Line Tools, but his requires that you are logged in with an Apple ID. If this is not the case the following message is displayed:

```
Can't install the software because it is not currently available from the software update server.
```

[Download](https://developer.apple.com/download/more/?=command%20line%20tools) and install the latest version of Command Line Tools matching your macOS version as described above (Apple ID required).
___


**R freezes (macOS)**  
If XQuartz is not installed, R will freeze when running the `rename_leica_gui()` or `rename_zeiss_gui()` functions.
XQuartz can be downloaded from [this link](https://www.xquartz.org/).
___


**Missing packages**
When getting an error message similar to `there is no package called ‘packagename’`  install the missing package(s) with

```
install.packages("packagename")
```
___


**Packages fail to install**  
If any of the required packages fails to install (error message similar to `Error: package or namespace load failed for ‘packagename’`), reinstall the problematic package with

```
remove.packages(packagename)
install.packages(packagename)
```

and load htmrenamer with

```
library(htmrenamer)
```
___







## <a name="citation">7. Citation</a>
Hagemeijer MC, Vonk AM, Awatade NT, Silva IAL, Tischer C, Hilsenstein V, Beekman JM, Amaral MD, Botelho HM (2020) **An open-source high-content analysis workflow for CFTR function measurements using the forskolin-induced swelling assay.** *Bioinformatics*. DOI: [10.1093/bioinformatics/btaa1073](https://doi.org/10.1093/bioinformatics/btaa1073)
