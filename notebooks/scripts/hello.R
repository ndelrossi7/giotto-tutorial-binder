
# import initial necessary packages
install.packages(c("stringi", "glue", "remotes"))
library(stringi)
library(glue)
library(remotes)

print("Now checking for Giotto dependencies")

# creating a list of outputs to get information on which packages haven't been installed
Sys.setenv("R_REMOTES_NO_ERRORS_FROM_WARNINGS"=TRUE)
outputs <- capture.output(tryCatch(remotes::install_github("RubD/Giotto@cless", build_vignettes = F)))

# create function to extract package information
install_dependents <- function(x){
  # create empty vector
  packages <- c()
  for (i in x)
  {
    # for every item in outputs, if the item contains "->" (sign that package is being installed or updated)...
    if (grepl("->", i)){
      # split the string amongst spaces, access the first item in the new list, and make it lower case. Then append to list packages.
      packages <- c(packages, tolower((strsplit(i, " ")[[1]][1])))
      }
  }

  for (i in packages)
  {
    # for each package name extracted, run the following:
    system(glue('sudo apt-get install r-cran-{i}'))
  }
}

# install dependent packages
install_dependents(outputs)

# try Giotto install again
Sys.setenv("R_REMOTES_NO_ERRORS_FROM_WARNINGS"=TRUE)
remotes::install_github("RubD/Giotto@cless", build_vignettes = F)

print("Giotto has now been successfully installed!")