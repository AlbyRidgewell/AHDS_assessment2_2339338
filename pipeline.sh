#!/bin/bash

# Pipeline bash script


# Run the r script to clean and prepare the raw data

Rscript code/clean_data.R


# Run the r script to create the figures that will be used in the report

Rscript code/produce_figures.R

