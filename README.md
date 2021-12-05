## info550 Zhihao Jin's Project
### AIM
For my project, it aims check the distribution of average AOD on 2018-01-01 based on GOES16 aerosol optical depth (AOD) observations in the north-east area of the US.

### Briefly introduction of project structrue: 
  * `data` folder contains all of raw GOES data.
  * `Rcode` folder contains R codes.
  * `Rmd` folder contains Rmd codes.
  * `Output` folder will contain all of figures and cleaned data.

  * `renv.lock` can be used to initiate your r environment.
  * `makefile` contains all rules for project.
  * `Dockerfile` is used to build the Docker image.
To analyze the data you will need to install some `R` packages. The required packages can be installed using `R` commands or just type 'make install' in your console.
=======
### To analyze the data you will need to install some `R` packages. The required packages can be installed using `R` commands.
``` r
installed_pkgs <- row.names(installed.packages())
pkgs <- c("lubridate", "reshape2", "ggplot2")

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

## Exeute the analysis using makefile

all the rules for the makefile are listed below, which can also be presented by typing 'make help' in your console:

 report.html : rule for making report
 cleandata.RData : rule for cleaning data
 aod_figure.png : rule for making the figure
 install : Rule for install packages
 help : Document rules

To execute the analysis, from the project folder you can run 

``` bash
make install
make report.html
```

This will create a file called `report.html` output in your directory that contains the results.

## Exeute the analysis using docker

1. To pull the image from DockerHub:
```bash
docker pull zhihaojin/info_550
```
2. To build the image:
```bash
docker build -t ${image_name} .
```
3. If you want to interactively export the report with the image:
```bash
docker run -it ${image_name} /bin/bash
cd project
make install
make report.html
```

