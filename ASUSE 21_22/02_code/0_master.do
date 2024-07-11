
/*---------------------------------------------------------
Name: 0_master.do
Purpose: Filepaths and folders for ASUSE 2021-22
Author: Vijayashree Jayaraman
-----------------------------------------------------------*/

// Clear everything

set more off
clear all
macro drop _all
// Set root

* net install here, from("https://raw.githubusercontent.com/korenmiklos/here/master/") // Uncomment and run if not installed
here,set 

// Folders


global raw "03_raw"
global code "02_code"
global clean "04_clean"
global dictionary "$raw/dictionary"

