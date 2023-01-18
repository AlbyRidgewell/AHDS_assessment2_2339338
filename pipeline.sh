#!/bin/bash

##########################################################################
#
# Pipeline bash script to create the report.html file from the raw data
#
# Pandoc is required to run this pipeline. It can be installed here:
#
# https://pandoc.org/installing.html
#
# To execute the pipeline, run the following in the terminal:
#
# sh pipeline.sh
#
##########################################################################


# Run the r script to clean and prepare the raw data

Rscript code/clean_data.R


# Run the r script to create the figures that will be used in the report

Rscript code/produce_figures.R


# Run the r markdown to create the report

Rscript -e "rmarkdown::render('report.Rmd')"