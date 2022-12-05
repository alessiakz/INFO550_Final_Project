#pulling from image with r installed
FROM rocker/r-ubuntu

#installing updates and pandoc
RUN apt-get update && apt-get install -y pandoc && apt-get install -y libcurl4-openssl-dev && apt-get install -y libxml2-dev 
RUN apt-get install -y libssl-dev
RUN apt-get install -y libfontconfig1-dev

#installing R packages
RUN Rscript -e "options(warn=2); install.packages('here')"
RUN Rscript -e "options(warn=2); install.packages('tidyverse')"
RUN Rscript -e "options(warn=2); install.packages('kableExtra')"
RUN Rscript -e "options(warn=2); install.packages('ggplot2')"
RUN Rscript -e "options(warn=2); install.packages('rmarkdown')"
RUN Rscript -e "options(warn=2); install.packages('knitr')"

#making working directory
RUN mkdir /project
WORKDIR /project/

#making file organization
RUN mkdir raw_data
RUN mkdir code
RUN mkdir output
RUN mkdir final_report

#copying files over
COPY raw_data/* raw_data
COPY code/* code
COPY Makefile .
COPY README.md .
COPY final_project_covid.Rmd .

#adding entry point to make report move it to mounted directory
CMD make final_project_covid.html && mv final_project_covid.html final_report/