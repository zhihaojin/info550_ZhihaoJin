## info550 Zhihao Jin's Project
### AIM
For my project, it aims check the distribution of average AOD on 2018-01-01 based on GOES16 aerosol optical depth (AOD) observations in the north-east area of the US.

### To analyze the data you will need to install some `R` packages. The required packages can be installed using `R` commands.

``` r
installed_pkgs <- row.names(installed.packages())
pkgs <- c("lubridate", "reshape2")

for(p in pkgs){
	if(!(p %in% install_pkgs)){
		install.packages(p)
	}
}
```
### or you can use the "renv" package:

``` r
renv::init()
```

## Exeute the analysis
To execute the analysis, from the project folder you can run 

``` bash
make
```

This will create a file called `report.html` output in your directory that contains the results.


