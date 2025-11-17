all: penguins

.PHONY: penguins
penguins: output/penguin_report.html

output/penguin_report.html: analysis/penguin_report.qmd
	quarto render ./analysis/penguin_report.qmd
	mv ./analysis/penguin_report.html ./output/penguin_report.html

output/penguin_class.csv: analysis/classify_penguin.R
	R CMD BATCH --no-save --no-restore analysis/classify_penguin.R output/classify_penguin.R

output/penguin_pairs.png: analysis/plot_penguin.R
	R CMD BATCH --no-save --no-restore analysis/plot_penguin.R output/plot_penguin.R

.PHONY : clean
clean: 
	rm -f ./output/penguin_report.html
	rm -f ./output/penguin_class.csv
	rm -f ./output/penguin_pairs.png