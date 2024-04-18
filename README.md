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

    where `.` is the path to the directory containing the Dockerfile. This might take 10-20 minutes depending on the platform, system, etc.

4. Run Docker container:

    ```
    docker run --rm -ti -p 8787:8787 r-tidystan
    ```

    Sign in to RStudio Server in a web broswer at <http://localhost:8787> by entering username (`rstudio`) and password (randomly supplied).

5. Stop Docker container once done using it. Check container ID with `docker ps` and run `docker stop CONTAINER-ID`. Alternatively, Ctrl+C in the working terminal.

## License

The Dockerfile in this repo is licensed under the [MIT License](LICENSE).
