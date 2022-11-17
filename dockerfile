#pulling from image with r installed
FROM rocker/r-ubuntu

#installing R packages
RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('tidyverse')"
RUN Rscript -e "install.packages('kableExtra')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('knitr')"

#installing updates and pandoc
RUN apt-get update && apt-get install -y pandoc

#making working directory
RUN mkdir /project
WORKDIR /project

#making file organization
RUN mkdir raw_data
RUN mkdir code
RUN mkdir output
RUN mkdir final_report

#copying files over
COPY Raw_Data Raw_Data
COPY Code Code
COPY Makefile .
COPY README.md .
COPY final_project_covid.Rmd .

#adding entry point to make report move it to mounted directory
CMD make && mv report.html final_report