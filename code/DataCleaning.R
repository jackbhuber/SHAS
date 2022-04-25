# Trim the data because we only need the response matrix.
PC_data <- braun_data[,-1]

# Subtract 1 from observations so that the lowest category is 0 (required for eRm)
PC_data_balanced <- PC_data-1