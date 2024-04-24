# compensation_calculation.R

# Load required packages
library(flowCore)

# Read FCS files
file_paths <- list.files(path = "data/", pattern = ".fcs$", full.names = TRUE)
samples <- read.FCS(file_paths)

# Define compensation controls
controls <- c("APC", "FixableVioletDead")

# Calculate compensation
comp <- spillover(samples[, controls])

# Apply compensation
comp_samples <- compensate(samples, comp)

# Save compensated files
write.FCS(comp_samples, file.path("data", paste0("compensated_", basename(file_paths))))
