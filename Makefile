# rule for making report  
report.html: Output/cleandata.RData Rmd/report.Rmd Output/figure/aod_figure.png
	Rscript -e "rmarkdown::render('Rmd/report.Rmd', quiet = TRUE)"

# rule for cleaning data
cleandata.RData: Rcode/cleandata.R data/GOES_data
	Rscript Rcode/cleandata.R

# rule for making the figure
aod_figure.png: Rcode/make_figure.R Output/cleandata.RData
	Rscript Rcode/make_figure.R
