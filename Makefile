#REPORT-ASSOCIATED RULES (run in container)

final_project_covid.html: final_project_covid.Rmd code/03_render.R output/data_clean.rds output/table_1.rds output/barchart.png
	Rscript code/03_render.R

output/data_clean.rds: code/00_clean_data.R raw_data/owid-covid-data.csv
	Rscript code/00_clean_data.R

output/table_1.rds: code/01_table1.R output/data_clean.rds
	Rscript code/01_table1.R

output/barchart.png: code/02_chart.R output/data_clean.rds
	Rscript code/02_chart.R

.PHONY: clean
clean:
	rm output/*.rds && rm output/*.png && rm *.html
	
.PHONY: install
install:
	Rscript -e "renv::restore()"
	
#DOCKER-ASSOCIATED RULES (run on local)

#rule to build image
project_image: 
	docker build -t alessiakz/final_project_image .
	
#rule to pull image
pull_image:
	docker pull alessiakz/final_project_image

#rule to build the report automatically in our coontainer
.PHONY: final_report
final_report: 
	docker run -v "//$$(pwd)"/final_report:/project/final_report alessiakz/final_project_image

