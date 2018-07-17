[![Travis-CI Build Status](https://travis-ci.org/sylvainschmitt/CrossReferenceR.svg?branch=master)](https://travis-ci.org/sylvainschmitt/CrossReferenceR)

**CrossReferenceR** is a RStudio-Addin that uses the `rstudioapi` package and provides a GUI to insert cross references in bookdown documents with a minimal user interface.

For a full list of features see [`NEWS`](./NEWS.md).

## Installation

Please be aware that you need the **most recent (stable) release of RStudio** (v0.99.878 or later). Additionally, **CrossReferenceR** depends on [`shiny`](https://github.com/rstudio/shiny), [`miniUI`](https://github.com/rstudio/miniUI).

#### Install from Github

You can install the latest version of **CrossReferenceR** from Github using the [`devtools`](https://github.com/hadley/devtools) package:

```
if (!requireNamespace("devtools", quietly = TRUE))
  install.packages("devtools")

devtools::install_github("sylvainschmitt/CrossReferenceR")
```

## Usage

After installing, **CrossReferenceR** is available in the Addins menu within RStudio.

<!-- <center>[**Click to enlarge**](https://raw.githubusercontent.com/sylvainschmitt/Cite/master/examples/crossreference.gif)<center>
![Screenshot](examples/crossreference.gif) -->
