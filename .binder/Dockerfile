FROM rocker/binder:3.6.0
LABEL maintainer='Pascal PERNOT'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}

RUN apt-get update -y\
&& R -e "install.packages('BiocManager')"\
&& R -e "BiocManager::install('genefilter', version='3.10')"

USER ${NB_USER}

RUN wget https://github.com/ppernot/ErrView/raw/master/DESCRIPTION\
&& R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2020-02-28/')); devtools::install_deps()"

RUN rm DESCRIPTION.1; exit 0

# expose port
EXPOSE 8888

# run app on container start
CMD ["R", "-e", "shiny::runApp(host = '0.0.0.0', port = 8888)"]
