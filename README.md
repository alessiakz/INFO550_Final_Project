# INFO 550 Final Project - COVID-19 Around the World

This project was created for the INFO 550 course. The data set is from "Our World in Data".

## How to Synchronize Package Repository

To sync to this project's package repository, type "make install" in GitBash terminal while in your working directory for the project. 

This will use the renv package to sync the packages and package versions. You may need to install the renv package. You can do this by typing install.packages("renv") in RStudio's console.

## How to Generate Final Report

To generate the final report, either run the 03_render.R code from RStudio, or type "make" in the GitBash terminal while in your working directory for the project.

## What Each Code Generates

* 00_clean_data.R generates the clean data from the raw data
* 01_table_1.R generates the table1 seen in the final report
* 02_chart.R generates the bar chart
* 03_render.R will render the final report
