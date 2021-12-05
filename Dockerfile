FROM rocker/tidyverse

# install R packages
RUN Rscript -e "install.packages(c('lubridate','reshape2','ggplot2'))"

# make project directory in the container
RUN mkdir /project

# copy contents of local folder to project folder in container
COPY ./ /project/

# make R scripts executable
RUN chmod +x /project/Rcode/*.R
RUN chmod +x /project/Rmd/*.Rmd

# make container entry point that makes the report
CMD make -C project Rmd/report.html