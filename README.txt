##################################################################################
#
# README
#
# AHDS_assessment2_2339338
#
##################################################################################

This is an executable research compendium. It uses the bash script pipeline.sh to take the raw data sets contained in the directory data_raw and create the report report.html. 
 

AHDS_assessment2_2339338/
├── AHDS_assessment2_2339338.Rproj
├── code
│   ├── clean_data.R
│   └── histograms_app.R
|   └── produce_figures.R
├── data_clean
│   └── bmx_bpx_for_histograms.csv
│   └── bmx_bpx.csv
├── data_raw
│   ├── BMX_D.csv
│   └── BPX_D.csv
├── figures
│   ├── bmi_hypertension_violin_plot.png
│   └── dbp_bmi_scatter_plot.png
│   └── height_weight_scatter_plot.png
│   └── hypertension_bmi_cat_barplot.png
│   └── sbp_bmi_cat_violin_plot.png
│   └── sbp_bmi_scatter_plot.png
├── pipeline.sh
├── README.txt
├── renv
│   └── *
├── renv.lock
├── report.html
├── report.Rmd
└── version_control.txt



# Pipeline ####################################################################

Pandoc is required to run this pipeline. It can be installed here:

https://pandoc.org/installing.html

To execute the pipeline, run the following command in the terminal:

sh pipeline.sh



# Environment management #####################################################

See renv.lock file for the R environment and packages used. 

System specifications:

macOS Catalina Version 10.15.7
MacBook Pro (Retina, 13-inch, Late 2012)
Processor 2.5 GHz Dual-Core Intel Core i5
Memory 8 GB 1600 MHz DDR3
Graphics Intel HD Graphics 4000 1536 MB


# Description of directories and files #######################################


├── AHDS_assessment2_2339338.Rproj

This is the R project file.



├── code
│   ├── clean_data.R
│   └── histograms_app.R
|   └── produce_figures.R

The code directory contains two R scripts used in the pipeline to create the report. The script clean_data.R cleans and prepares the data, and produce_figures.R creates the figures. 

histograms_app.R is a Shiny application that creates a histogram for whichever variable you select. The data set is also displayed below this. To run the application, open it and then press 'Run App'.



├── data_clean
│   └── bmx_bpx_for_histograms.csv
│   └── bmx_bpx.csv

The data_clean directory contains the cleaned data sets. bmx_bpx_for_histograms.csv is the data set containing only the variables used for the Shiny application. bmx_bpx.csv is the cleaned data set used to produce the figures for the report. 


 
├── data_raw
│   ├── BMX_D.csv
│   └── BPX_D.csv

The data_raw directory contains the two raw data sets used. BMX_D.csv is the Body Measures data set and BPX_D.csv is the Blood Pressure data set from the 2005-2006 NHANES survey. 



├── figures
│   ├── bmi_hypertension_violin_plot.png
│   └── dbp_bmi_scatter_plot.png
│   └── height_weight_scatter_plot.png
│   └── hypertension_bmi_cat_barplot.png
│   └── sbp_bmi_cat_violin_plot.png
│   └── sbp_bmi_scatter_plot.png

The figures directory contains the six figures produced for the report.



├── pipeline.sh

The pipeline.sh bash script is the pipeline that creates the report. Instructions above. 



├── README.txt

README.txt is this README file.



├── renv
│   └── *

The renv directory contains all of the files associated with the renv environment manager. 



├── renv.lock

The renv.lock file contains details of the R environment and packages used in this project. 



├── report.html

This is the report produced by the pipeline.



├── report.Rmd

This is the R markdown file used in the pipeline that takes the figures and produces the report.



└── version_control.txt

This is a test file describing how I used version control in this project. 









