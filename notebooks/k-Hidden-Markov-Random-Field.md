# Hidden Markov Random Field (HMRF)

The functions for HMRF that are displayed in Giotto are not compatible with Binder, so we have created an instructional markdown for 
anyone to follow along with locally. 

This is a demo with provided data but feel free to follow along with your own.

### 1. Install and load Giotto
```r
# Install
remotes::install_github("RubD/Giotto@cless")

# Load
library(Giotto)
```

### 2. Load data
```r
# Set working directory. If it is the current directory you're working in you can use the following:
my_working_dir = getwd()

# Download data. You can use "curl" or "wget" as the method depending on what your compter has installed
getSpatialDataset(dataset = "seqfish_SS_cortex", directory = my_working_dir, method = "curl")

```

### 3. Giotto Environment
You'll either install a Giotto environment or provide a path the the python already installed on your computer. We'll demonstrate both options below:
```r
# Install a Giotto Environment

installGiottoEnvironment()

# Create instructions to use your own python path. If using this option, please paste your own python path below

my_instructions = createGiottoInstructions(python_path = "/your/python/path/here")
```
