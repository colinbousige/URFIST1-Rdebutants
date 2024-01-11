# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# #        Read and write the main types of data files                # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Just for Colin, do not run:
# server = livecode::serve_file()


# We will work with 3 different files:
#     - "Data/rubis_01.txt"
#     - "Data/population.csv"
#     - "Data/FTIR_rocks.xlsx"

# Load them into separate `data.frames`. 
# Look into the options of `read.table()`, `read.csv()`, `readxl::read_excel()`, to get the proper data fields. 
# Make sure that the `rubis_01` data.frame has `w` and `intensity` as column names.

rubis_01   <- ___("Data/rubis_01.txt", ___)
population <- ___("Data/population.csv")
FTIR_rocks <- ___("Data/FTIR_rocks.xlsx")


# Print their dimensions and column names. 



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# We will use the TGA data file `"Data/ATG.txt"`

# Load it into a `data.frame`. Look into the options of [`read.table()`](https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/read.table) to get the proper data fields.
# Hints:
# - check how many lines you have to read
# - check how many lines you have to skip before reading
# - you need to skip the line with the unit

d <- read.table("Data/ATG.txt",
                ___
                )
d


