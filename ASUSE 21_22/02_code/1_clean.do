
/*---------------------------------------------------------
Name: 1_clean.do
Purpose: Cleans ASUSE 21-22 raw data and outputs csv/dta
Author: Vijayashree Jayaraman
-----------------------------------------------------------*/


*-----------------------------------
*LEVEL- 1 to 16 : Cleaning loop
*-------------------------------------
clear
local vals "01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16"
//set trace on
foreach i in `vals'{
	
    * Use the dictionary file to read the data
    infix using "$dictionary/asuse2122_lvl_`i'.dct",using ("$raw/asuse_2122_esu_l`i'm.txt") clear 
	
	    // Apply common labels
    do "$code/var_labels.do"
  
   // generate firm id (common identifier)
   gen firm_id =fsu_serial_no+segment_no+sec_stage_stratum_no+sample_est_no
   order firm_id 
   
     
    * Save
    save "$clean/asuse2122_level_`i'.dta", replace
	export delimited "$clean/asuse2122_level_`i'.csv", replace
}

//set trace off