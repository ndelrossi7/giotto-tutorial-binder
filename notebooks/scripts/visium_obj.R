# Install Giotto
remotes::install_github("RubD/Giotto@cless")
# Load Giotto
library(Giotto)
# Install Giotto environment
installGiottoEnvironment()
# load data.table
library(data.table)
# install quadprog - necessary for DWLS package

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

# create nearest network
my_vis_object <- createNearestNetwork(
  my_vis_object,
  type = "sNN", 
  dim_reduction_to_use = "pca",
  dim_reduction_name = "pca",
  dimensions_to_use = 1:10,
  genes_to_use = NULL,
  expression_values = c("normalized", "scaled", "custom"),
  name = "sNN.pca",
  return_gobject = TRUE,
  k = 30,
  minimum_shared = 5,
  top_shared = 3,
  verbose = T,
)

# Leiden clustering
my_vis_object <- doLeidenCluster(
  my_vis_object, 
  name = 'leiden_clus')

