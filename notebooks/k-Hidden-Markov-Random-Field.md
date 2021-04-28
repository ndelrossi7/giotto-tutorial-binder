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

### 3. Read and properly format the data
```r
Load + read data
expr_path = fs::path(my_working_dir, "cortex_svz_expression.txt")
loc_path = fs::path(my_working_dir, "cortex_svz_centroids_coord.txt")
meta_path = fs::path(my_working_dir, "cortex_svz_centroids_annot.txt")

## first merge location and additional metadata
SS_locations = data.table::fread(loc_path)
cortex_fields = data.table::fread(meta_path)
SS_loc_annot = data.table::merge.data.table(SS_locations, cortex_fields, by = "ID")
SS_loc_annot[, ID := factor(ID, levels = paste0("cell_",1:913))]
data.table::setorder(SS_loc_annot, ID)

## create file with offset information
my_offset_file = data.table::data.table(field = c(0, 1, 2, 3, 4, 5, 6), 
                                        x_offset = c(0, 1654.97, 1750.75, 1674.35, 675.5, 2048, 675), 
                                        y_offset = c(0, 0, 0, 0, -1438.02, -1438.02, 0))

## create a stitch file
stitch_file = stitchFieldCoordinates(location_file = SS_loc_annot,
                                     offset_file = my_offset_file,
                                     cumulate_offset_x = T,
                                     cumulate_offset_y = F,
                                     field_col = "FOV", 
                                     reverse_final_x = F, 
                                     reverse_final_y = T)
stitch_file = stitch_file[,.(ID, X_final, Y_final)]
my_offset_file = my_offset_file[,.(field, x_offset_final, y_offset_final)]

```


### 4. Giotto Environment
You'll either install a Giotto environment or provide a path the the python already installed on your computer. We'll demonstrate both options below:
```r
# Install a Giotto Environment

installGiottoEnvironment()

# Create instructions to use your own python path. If using this option, please paste your own python path below

my_instructions = createGiottoInstructions(python_path = "/your/python/path/here")
```


### 5. Create Giotto object
```r

# Only add the argument "instructions" if you have previously set your python path
my_giotto_object <- createGiottoObject(raw_exprs = expr_path,
                                       spatial_locs = stitch_file,
                                       offset_file = my_offset_file, 
                                       instructions = my_instructions)

```
