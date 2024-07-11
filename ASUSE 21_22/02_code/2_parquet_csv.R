

######### ASUSE 2021-2022 File conversion

library(pacman)
p_load(arrow)

here::i_am("ASUSE.Rproj")

# To change csv files to parquet for ASEUSE 2021-2022

for (i in 1:16) {
  # Format the index i to two digits with leading zeros
  filename <- sprintf("ASUSE 21_22/04_clean/asuse2122_level_%02d.csv", i)
  
  # Read CSV file into a data frame
  df <- read.csv(filename)
  
  # Define the output Parquet filename
  output_filename <- sub(".csv$", ".parquet", filename)
  
  # Write data frame to Parquet file with the same filename
  arrow::write_parquet(df, output_filename)
}


# To change parquet files to csv for ASEUSE 2021-2022
for (i in 1:16) {
  # Format the index i to two digits with leading zeros
  filename <- sprintf("ASUSE 21_22/04_clean/asuse2122_level_%02d.parquet", i)
  
  # Define the output CSV filename
  output_filename <- sub(".parquet$", ".csv", filename)
  
  # Read Parquet file into a data frame
  df <- arrow::read_parquet(filename)
  
  # Write data frame to CSV file with the same filename
  write.csv(df, file = output_filename, row.names = FALSE)
}
