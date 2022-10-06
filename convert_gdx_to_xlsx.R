#load the gdx library
library(gamsr)    # can be obtained from https://rdrr.io/github/christophe-gouel/gamsr/
library(gdxrrw)   # can be obtained from https://github.com/GAMS-dev/gdxrrw
library(dplyr)
library(purrr)
library(openxlsx)

# function to convert a GDX file to an Excel file containing one sheet per GDX file entry
#
# inputs: (1) gamsPath      --  path to your GAMS installation (can be obtained for free from https://www.gams.com/)
#         (2) gdxFilename   --  name of the GDX file to be converted
#         (3) gdxFilePath   --  path at which "gdxFilename" is located
#         (4) excelFilename --  desired name of the excel file after conversion
ConvertGDX <- function(gamsPath,
                       gdxFilename,
                       gdxFilePath,
                       excelFilename)
{
  igdx(gamsPath)  # <--- This should be the path to your GAMS installation
  
  #read in the gdx file
  setwd(gdxFilePath) # <--- The folder where your GDX file is
  import_gdxfile(filename = gdxFilename) # <--- The name of the GDX file to convert
  
  # write to excel
  wb <- createWorkbook()
  for(i in 1:length(l.all))
  {
    addWorksheet(wb, names(l.all)[i])
    writeData(wb, names(l.all)[i], l.all[[i]]$data)
  }
  saveWorkbook(wb, file = excelFilename, overwrite = TRUE) # <--- Enter the name of the Excel file you want to make
}

ConvertGDX(gamsPath = "~/Downloads/gams37.1_linux_x64_64_sfx/",
           gdxFilename = "Base_Refinery_Baron.gdx",
           gdxFilePath = "~/Downloads/",
           excelFilename = "Converted_GDX2.xlsx")
