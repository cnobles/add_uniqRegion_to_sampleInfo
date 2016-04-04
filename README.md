# add_uniqRegion_to_sampleInfo
Adds the uniqRegion column to sampleInfo.tsv files used by intSiteCaller

The uniqRegion denotes the region of the LTR targeted for amplification when working up a sample for integration site capturing. The information is used by intSiteCaller's logic to check that the identified reads to be paired share appropriate characteristics. This column is required for running intSiteCaller after the U3seq branch.

Within the directory for the sampleInfo.tsv, run one of the following lines:
```
Rscript path/to/add_uniqRegion_to_sampleInfo.R sampleInfo.tsv
Rscript path/to/add_uniqRegion_to_sampleInfo.R sampleInfo.csv
Rscript path/to/add_uniqRegion_to_sampleInfo.R sampleInfo.tsv -u U5
Rscript path/to/add_uniqRegion_to_sampleInfo.R sampleInfo.tsv -u U3
```
The script will insert the uniqRegion column information (either U3 or U5, U5 is default) after the ltrBit column.

Dependancies: library(argparse)
