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

## Docker Capabilities

This project is set-up to work in a docker container. The following instructions will explain how to build the image and run the container.

The image is hosted on DockerHub at https://hub.docker.com/repository/docker/alessiakz/final_project_image. 

### Building Docker Image

Type the command "docker build -t project_image ." to manually build the Docker image.
You can also type the command "make project_image" to build the Docker image through the Makefile. 

## Running Automated Version of Image

Type the command "docker run -v '/$$(pwd)/final_report':/project/final_report project_image" to manually build the Docker container and have the report built be mounted to your local system.

You can also type the command "make final_project/final_project_covid.html" to build the report in the Docker container and mounted to your local system. 

