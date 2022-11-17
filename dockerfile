#pulling from image with r installed
FROM rocker/r-ubuntu

#installing updates and pandoc
RUN apt-get update && apt-get install -y pandoc

#making working directory
RUN mkdir /project
WORKDIR /project

#making file organization
RUN mkdir raw_data
RUN mkdir code
RUN mkdir output

#copying files over
COPY raw_data raw_data
COPY code code
COPY Makefile .
COPY README .
COPY final_project_covid.Rmd .

#renv
COPY .Rprofile
COPY renv.lock
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.dcf renv

#run renv
RUN Rscript -e "renv::restore(prompt=FALSE)"

#adding entry point to make report move it to mounted directory
CMD make && mv report.html final_report