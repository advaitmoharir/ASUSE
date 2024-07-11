# Annual Survey of Unincorporated Sector Enterprises (ASUSE)

This repository consists of cleaned data from the Annual Survey of Unincorporated Sector Enterprises (ASUSE), conducted by NSS. The period covered is 2021-22 and 2022-23. This repo is jointly maintained by [Vijayshree Jayraman](https://github.com/vijayshreecon) and [Advait Moharir](https://github.com/advaitmoharir).

## Repo Structure

The repo has the folders `ASUSE 21_22` and `ASUSE 22_23`, covering the two years. Each of these folders contains the following sub-folders

1. `01_docs`: This consists of all the survey documentation, including questionnaire, file structure, caveats, state codes etc
2. `02_code`: This has Stata do files which generate clean data files (dta and csv)
3. `03_raw`: This consists of all the raw files, taken from the NSS site. User is supposed to create this. Additionally, it has data dictionaries for each level, used to create variables.
4. `04_clean`: This has all the level-wise cleaned files, in parquet format.

## Code

1. `0_master.do`: Sets root directory, folder names etc
2. `1_clean.do`: Extracts all variables from raw txt files, by each level and preliminary cleaning
3. `var_labels.do`: Do file to apply labels to cleaned dta files
4. `2_parquet_csv.R`: Python code to convert csv to parquet and back

## Clean files

To generate the files in `04_output`, do the following (for each year):

1. Download and unzip the repo
2. Create a folder called `3_raw` and add the raw txt files from the NSS site, available [here](https://microdata.gov.in/nada43/index.php/catalog/196) and [here](https://microdata.gov.in/nada43/index.php/catalog/197). You should get 16 .txt files. There is already a folder within `3_raw` called `dictionary`. Leave it untouched.
3. Open the Stata projects `asuse_21.stpr` and `asuse_22.stpr` respectively, dependsing on which year you are cleaning. From within the project, run first `0_master`, followed by `1_clean`
4. This creates Stata and csv files for each level
5. [OPTIONAL] If you want to get Parquet files, run the `2_parquet_csv.R` file from within the R project file `ASUSE.Rproj` to do so.
6. [FOR NON-STATA USERS] To convert the Parquet files to csv, open the `2_parquet_csv.R` file and run the section which converts parquet to csv.

