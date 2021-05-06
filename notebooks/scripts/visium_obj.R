# Install Giotto
suppressMessages(remotes::install_github("RubD/Giotto@cless", quiet = TRUE))
# Load Giotto
library(Giotto)

# python path
my_instructions = createGiottoInstructions(python_path = "/srv/conda/envs/notebook/bin/python")

# load data.table
library(data.table)

# install quadprog
suppressWarnings(suppressMessages(install.packages('quadprog', quiet = TRUE)))
suppressWarnings(suppressMessages(install.packages('ggplot2', quiet = TRUE)))
suppressWarnings(suppressMessages(install.packages("scatterpie", quiet = TRUE)))
library(ggplot2)
library(scatterpie)


# paths to expression and location data
expr_path = system.file("extdata", "visium_DG_expr.txt", package = 'Giotto')
loc_path = system.file("extdata", "visium_DG_locs.txt", package = 'Giotto')

my_visium_object <- createGiottoObject(raw_exprs = expr_path,
                                       spatial_locs = loc_path,
                                       instructions = my_instructions
                                      )

# read image
png_path = system.file("extdata", "deg_image.png", package = 'Giotto')
mg_img = magick::image_read(png_path)

# test and modify image alignment
mypl = spatPlot(my_visium_object, return_plot = T, point_alpha = 0.8, show_plot = FALSE)
orig_png = createGiottoImage(gobject = my_visium_object, mg_object = mg_img, name = 'image',
                             xmax_adj = 450, xmin_adj = 550,
                             ymax_adj = 200, ymin_adj = 200)
mypl_image = addGiottoImageToSpatPlot(mypl, orig_png)


# add image to Giotto object

image_list = list(orig_png)
my_visium_object = addGiottoImage(gobject = my_visium_object,
                             images = image_list)


# explore gene and cell distribution
filterDistributions(my_visium_object, detection = 'genes', 
                    return_plot = FALSE, 
                    show_plot = FALSE)
filterDistributions(my_visium_object, detection = 'cells', 
                    return_plot = FALSE, 
                    show_plot = FALSE)
filterCombinations(my_visium_object,
                   expression_thresholds = c(1),
                   gene_det_in_min_cells = c(20, 20, 50, 50),
                   min_det_genes_per_cell = c(100, 200, 100, 200), 
                   return_plot = FALSE, 
                   show_plot = FALSE)

# filter and normalize
my_visium_object <- filterGiotto(gobject = my_visium_object,
                            expression_threshold = 1,
                            gene_det_in_min_cells = 50,
                            min_det_genes_per_cell = 100,
                            expression_values = c('raw'),
                            verbose = T)
my_visium_object <- normalizeGiotto(gobject = my_visium_object, scalefactor = 6000, verbose = T)
my_visium_object <- addStatistics(gobject = my_visium_object)

# calculate highly variable genes
my_visium_object <- calculateHVG(gobject = my_visium_object, 
                                 return_plot = FALSE,
                                 show_plot = FALSE)

# run PCA
my_visium_object <- suppressWarnings(runPCA(gobject = my_visium_object))

# run UMAP
my_visium_object <- runUMAP(my_visium_object, dimensions_to_use = 1:10)

# run tSNE
my_visium_object <- runtSNE(my_visium_object, dimensions_to_use = 1:10)

# create nearest network
my_visium_object <- createNearestNetwork(gobject = my_visium_object, dimensions_to_use = 1:10, k = 20)
# leiden clustering
my_visium_object <- doLeidenCluster(gobject = my_visium_object, resolution = 0.4, n_iterations = 1000)

# find SCRAN markers
scran_markers = suppressWarnings(findMarkers_one_vs_all(gobject = my_visium_object,
                                       method = 'scran',
                                       expression_values = 'normalized',
                                       cluster_column = 'leiden_clus'))

# annotate
cluster_cell_types = c('Gfap_cells', 'Tbr1_cells', 'Tcf7l2_cells', 'Wfs1_cells', 'Nptxr_cells')
names(cluster_cell_types) = 1:5
my_visium_object = annotateGiotto(gobject = my_visium_object, annotation_vector = cluster_cell_types,
                             cluster_column = 'leiden_clus', name = 'cluster_cell_types')

