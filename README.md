# r-tidystan

## Overview

Dockerfile for building a computational environment for statistical analysis with [R](https://www.r-project.org/), [Tidyverse](https://www.tidyverse.org/), and [Stan](https://mc-stan.org/). Extends [rocker/rstudio](https://hub.docker.com/r/rocker/rstudio) by installing `tidyverse` and Stan packages (e.g. `rstan`, `cmdstanr`, `brms`). Compatible with `linux/amd64` and `linux/arm64` platforms (compatibility with other platforms unchecked).

## Usage

1. Install and set up [Docker](https://www.docker.com/) if needed.

2. Clone this repo or download the Dockerfile.

3. Build Docker image locally:

    ```
    docker build -t r-tidystan .
    ```

    where `.` is the path to the directory containing the Dockerfile.

4. Run Docker container:

    ```
    docker run --rm -ti -p 8787:8787 r-tidystan
    ```

    Sign in to RStudio Server in a web broswer at <http://localhost:8787> by entering username (`rstudio`) and password (randomly supplied).
