# Install Giotto
remotes::install_github("RubD/Giotto@cless")
# Load Giotto
library(Giotto)
# Install Giotto environment
installGiottoEnvironment()

# path to data
visium_path = system.file("extdata", "visium_DG_expr.txt", package = "Giotto")
visium_locations = system.file("extdata", "visium_DG_locs.txt", package = "Giotto")

# create object
my_vis_object = createGiottoObject(raw_exprs = visium_path, 
                                  spatial_locs = visium_locations)

# normalize object
my_vis_object <- normalizeGiotto(gobject = my_vis_object)

# calculate HVGs
my_vis_object <- calculateHVG(gobject = my_vis_object, show_plot = FALSE)

# PCA
my_vis_object <- runPCA(gobject = my_vis_object)