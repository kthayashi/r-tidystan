# Use rocker/rstudio as base image
# Note: rocker/tidyverse etc. are not (yet) available for arm64
FROM rocker/rstudio

# Install system dependencies for tidyverse
# Command modified from pak::pkg_sysreqs("tidyverse")
# Skip: make pandoc
RUN apt-get update -y && \
    apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    zlib1g-dev \
    libfreetype6-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libicu-dev \
    libfontconfig1-dev \
    libfribidi-dev \
    libharfbuzz-dev \
    libxml2-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install tidyverse
RUN R -e "install.packages('tidyverse')"

# Use home directory for RStudio session to set up Stan
WORKDIR /home/rstudio

# Configure C++ toolchain for Stan
RUN mkdir .R && \
    touch .R/Makevars && \
    echo "\nCXX17FLAGS=-O3 -march=native -mtune=native -fPIC" >> .R/Makevars && \
    echo "CXX17=g++" >> .R/Makevars

# Install rstan
RUN R -e "Sys.setenv(DOWNLOAD_STATIC_LIBV8 = 1); install.packages('V8')" && \
    R -e "install.packages('rstan')"

# Install cmdstanr
RUN R -e "install.packages('cmdstanr', repos = c('https://mc-stan.org/r-packages/', getOption('repos')))" && \
    mkdir .cmdstan && \
    R -e "cmdstanr::install_cmdstan(dir = '.cmdstan')"

# Install additional packages for Stan
RUN R -e "install.packages(c('brms', 'tidybayes'))"
