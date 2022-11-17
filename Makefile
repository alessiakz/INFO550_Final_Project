#REPORT-ASSOCIATED RULES (run in container)

final_project_covid.html: code/03_render.R final_project_covid.Rmd descriptive_analysis
	Rscript code/03_render.R

output/data_clean.rds: code/00_clean_data.R raw_data/owid-covid-data.csv
	Rscript code/00_clean_data.R

output/table_1.rds: code/01_table1.R output/data_clean.rds
	Rscript code/01_table1.R

output/barchart.png: code/02_chart.R output/data_clean.rds
	Rscript code/02_chart.R

.PHONY: descriptive_analysis
descriptive_analysis: output/table_1.rds output/barchart.png

.PHONY: clean
clean:
	rm output/*.rds && rm output/*.png && rm *.html
	
.PHONY: install
install:
	Rscript -e "renv::restore()"
	
#DOCKER-ASSOCIATED RULES (run on local)

PROJECTFILES = final_project_covid.html Makefile

#rule to build image
project_image: Dockerfile $(PROJECTFILES)
	docker build -t project_image .
	touch $@

#rule to build the report automatically in our coontainer
final_project/final_project_covid.html: project_image
	docker run -v "/$$(pwd)/final_project":/project/final_report project_image

