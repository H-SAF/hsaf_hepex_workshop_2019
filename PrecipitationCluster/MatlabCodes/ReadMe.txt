1) bufrtxtplot.m takes as input the .dat files.
	For H01 product:
	To obtain .dat files you first have to download BUFR files from the folder /products/h01/h01_cur_mon_buf on ftphsaf.meteoam.it.
	Then you must install BUFRDC library from https://software.ecmwf.int/wiki/display/BUFR/BUFRDC+Home and finally you have to launch 
	lon_lat_rr_ssmi_evo_scan_ncol.f code used to convert BUFR files to .dat ones
	(follow instructions in hsaf_fulldisk_instruction.pdf at: /products/utilities/full_disk_hsaf_decoder on ftphsaf.meteoam.it).

	For H02B product:
	To obtain .dat files you first have to download BUFR files from the folder /products/h02B/h02B_cur_mon_data on ftphsaf.meteoam.it.
	Then you must install BUFRDC library from https://software.ecmwf.int/wiki/display/BUFR/BUFRDC+Home and finally you have to launch 
	lon_lat_rr_amsu_evo_scan_ncol.f code used to convert BUFR files to .dat ones
	(follow instructions in hsaf_fulldisk_instruction.pdf at: /products/utilities/full_disk_hsaf_decoder on ftphsaf.meteoam.it).

2) gribtxtplot.m processes as input the text files obtained from GRIB files by using the WGRIB2 NOAA utility (see hsaf_fulldisk_instruction.pdf 
	at: /products/utilities/full_disk_hsaf_decoder on ftphsaf.meteoam.it). 
	For H03B product:
	GRIB files must be previously are downloaded from the folder /products/h03B/h03B_cur_mon_data on ftphsaf.meteoam.it.
	For H05B product:
	GRIB files must be previously are downloaded from the folder /products/h05B/h05B_cur_mon_data on ftphsaf.meteoam.it.
	For H15 product:
	GRIB files must be previously are downloaded from the folder /products/h15/h15_cur_mon_grb on ftphsaf.meteoam.it.
	For H15B product:
	GRIB files must be previously are downloaded from the folder /products/h15B/h15B_cur_mon_data on ftphsaf.meteoam.it.
 
3) NetCDFplot.m processes the NetCDF files available on ftphsaf.meteoam.it downloaded from different folders depending on the product you want 
	to plot. Folders are the following:
	/products/h17/h17_cur_mon_data
	/products/h18/h18_cur_mon_data
	/products/h20/h20_cur_mon_data
	/products/h23/h23_cur_mon_data

When you change product, pay attention to the names of the files and the paths in the codes.

These examples refer to products generated in the last 60 days, otherwise products need to be dowloaded from the archive by putting an order
by means of the H SAF Download Centre (see HSAFprecipitationCluster.pptx).

 