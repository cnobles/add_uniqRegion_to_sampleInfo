library(argparse)

parser <- ArgumentParser(description = "Add uniqRegion to sampleInfo.tsv")
parser$add_argument("-u", "--uniqRegion", default="U5", help="unique region of LTR to insert into sampleInfo.tsv")
arguments <- parser$parse_args()
uniqRegion <- arguments$uniqRegion

sampleFile <- grep("sampleInfo.tsv", list.files(path = "."), value = TRUE)

sampleInfo <- read.csv(sampleFile, sep = "\t")
sampleInfo$uniqRegion <- uniqRegion

colNames <- c("alias", "linkerSequence", "bcSeq", "gender", "primer",
              "ltrBit", "uniqRegion", "largeLTRFrag", "vectorSeq")

sampleInfo <- sampleInfo[, colNames]

write.table(sampleInfo, file = sampleFile, sep = "\t", row.names = FALSE, quote = FALSE)