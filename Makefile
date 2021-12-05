## report.html : rule for making report  
report.html: Output/cleandata.RData Rmd/report.Rmd Output/figure/aod_figure.png
	Rscript -e "rmarkdown::render('Rmd/report.Rmd', quiet = TRUE)"

## cleandata.RData : rule for cleaning data
cleandata.RData: Rcode/cleandata.R data/GOES_data
	Rscript Rcode/cleandata.R

## aod_figure.png : rule for making the figure
aod_figure.png: Rcode/make_figure.R Output/cleandata.RData
	Rscript Rcode/make_figure.R

## install : Rule for install packages
.PHONY: install
install: Rcode/install_packages.R
	chmod +x $<
	Rscript $<

## help : Document rules
.PHONY: help
help: makefile
	@sed -n 's/^##//p' $<
