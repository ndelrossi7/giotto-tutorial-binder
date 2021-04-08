# Install Giotto
remotes::install_github("RubD/Giotto@cless")
# Load Giotto
library(Giotto)

# python path
my_instructions = createGiottoInstructions(python_path = "/srv/conda/envs/notebook/bin/python")

# Install spatialDE
conda_path = reticulate::miniconda_path()
            conda_full_path = paste0(conda_path,'/','bin/conda')
            full_envname = paste0(conda_path,'/envs/giotto_env')
            reticulate::py_install(packages = c('NaiveDE', 'patsy', 'SpatialDE'),
                                   envname = full_envname,
                                   method = 'conda',
                                   conda = conda_full_path,
                                   pip = TRUE,
                                   python_version = '3.6')

# install spark
# devtools::install_github('xzhoulab/SPARK')

# paths to data
path_to_matrix = system.file("extdata", "seqfish_field_expr.txt", package = 'Giotto')
path_to_locations = system.file("extdata", "seqfish_field_locs.txt", package = 'Giotto')

# creating the Giotto object
my_giotto_object = createGiottoObject(raw_exprs = path_to_matrix,
                                      spatial_locs = path_to_locations,
                                      instructions = my_instructions)

# filtering the Giotto object
my_giotto_object <- filterGiotto(gobject = my_giotto_object, 
                                 expression_threshold = 1, 
                                 gene_det_in_min_cells = 10, 
                                 min_det_genes_per_cell = 5)

# Normalizing the Giotto object
my_giotto_object <- normalizeGiotto(gobject = my_giotto_object, scalefactor = 6000, verbose = T)

# Add gene and cell stats
my_giotto_object <- addStatistics(gobject = my_giotto_object)

# Adjust matrix
my_giotto_object <- adjustGiottoMatrix(gobject = my_giotto_object, 
                                       expression_values = c('normalized'),
                                       covariate_columns = c('nr_genes', 'total_expr'))

# Calculate highly variable genes
my_giotto_object <- calculateHVG(gobject = my_giotto_object, show_plot = FALSE)

# Run principal component analysis
my_giotto_object <- runPCA(gobject = my_giotto_object)

# Uniform manifold approximation and projection
my_giotto_object <- runUMAP(my_giotto_object, dimensions_to_use = 1:5)

# t-Distributed Stochastic Neighbor Embedding (t-SNE)
my_giotto_object <- runtSNE(my_giotto_object, dimensions_to_use = 1:5)


# Create nearest neighbor network
my_giotto_object <- createNearestNetwork(
  my_giotto_object,
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

# Leiden cluster
# run Leiden cluster
my_giotto_object <- doLeidenCluster(
  my_giotto_object, 
  name = 'leiden_clus')

# create a spatial network, the Delaunay network is the default network
# default name = 'Delaunay_network'
my_giotto_object = createSpatialNetwork(gobject = my_giotto_object, minimum_k = 2, 
                                    maximum_distance_delaunay = 400)


# annotation below

# create vector with cell type names as names of the vector
clusters_cell_types = c('cell_type_1', 'cell_type_2', 'cell_type_3', 'cell_type_4')
names(clusters_cell_types) = 1:4 # leiden clustering results

# convert cluster results into annotations and add to cell metadata
my_giotto_object = annotateGiotto(gobject = my_giotto_object,
                                         annotation_vector = clusters_cell_types,
                                         cluster_column = 'leiden_clus', 
                                         name = 'cell_types')