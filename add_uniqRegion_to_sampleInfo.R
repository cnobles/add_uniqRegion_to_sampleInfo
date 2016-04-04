library(argparse)

parser <- ArgumentParser(description = "Add uniqRegion to sampleInfo.tsv")
parser$add_argument("sampleFile", nargs='?', default='sampleInfo')
parser$add_argument("-u", "--uniqRegion", default="U5", help="unique region of LTR to insert into sampleInfo.tsv")
arguments <- parser$parse_args()
sampleFile <- arguments$sampleFile
uniqRegion <- arguments$uniqRegion

sampleName <- grep(sampleFile, list.files(path = "."), value = TRUE, fixed = TRUE)

if(grepl(".tsv", sampleName)){
  sampleInfo <- read.csv(sampleName, sep = "\t")
}else if(grepl(".csv", sampleName)){
  sampleInfo <- read.csv(sampleName, sep = ",")
}else{
  message("SampleInfo file not in .tsv or .csv format")
}

sampleInfo$uniqRegion <- uniqRegion

colNames <- c("alias", "linkerSequence", "bcSeq", "gender", "primer",
              "ltrBit", "uniqRegion", "largeLTRFrag", "vectorSeq")

sampleInfo <- sampleInfo[, colNames]

sampleName <- unlist(strsplit(sampleName, split = ".", fixed = TRUE))
sampleName <- paste(sampleName[1:(length(sampleName)-1)], collapse = ".")

write.table(sampleInfo, file = paste0(sampleName, ".tsv"), sep = "\t", row.names = FALSE, quote = FALSE)
