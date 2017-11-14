rm(list=ls())
library(knitr)

# Input data

file.csv <- "NBIS course application_20171106.csv"
data.csv <- read.csv(file.csv)
 
# Number
idx.final <- which(data.csv$Final==1)

studentsID <- 1:length(idx.final)
#studentsID <- 1:3

for (st in studentsID){
  print(st)
  knit2pdf("certificates.Rnw", output=paste0('diploma_', st, '.tex'))
}


for (st in studentsID){
  print(st)
  tools::texi2pdf(paste0("/Users/olga/Documents/NBIS/Teaching/Templates/Git/Certificates/", paste0('diploma_', st, '.tex')),
                  clean = TRUE, quiet = TRUE)
}

files.remove <- c(dir(pattern=".out"), dir(pattern=".aux"), dir(pattern=".bbl"), dir(pattern="xml"), dir(pattern=".bib"), dir(pattern=".log"), dir(pattern="blg"), dir(pattern=".tex"))
file.remove(files.remove)
