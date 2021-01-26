# !!!DRAFT!!! <br>EE_3.07 Geodata Management Systems - Final Assignment <br>!!!DRAFT!!! 

## 0. General Remarks

1. Due date is 2021-03-07
1. You have to give a live presentation in the class! Date is to be annouced (end of Feb, beginning of March)!
1. You can work in groups of 1 - 3 students. A Moodle course for the group definititon has still to be st up!
1. Use your own GitLab repository to document your work. THIS IS MANDATORY! Use a `REAMDE.md` file (and more .md-files, if needed) to describe your work. Python code has to be described in Jupyter Notebooks. Push all relevant files into the repo (README.md, all Python code, QGIS projects, etc.). 
1. Create your own repo on the University Gitlab server: https://git.hsrw.eu/. **USE THE FOLLWING REPO NAME:** `GeoData_WS2020_II_Final_<your mat.no.>`, (e.g. GeoData_WS2020_II_Final_98765)
1. I will clone your Gitlab repo at the end of deadline. That will be the basis of my assessment.


## 1. DWD Precipitation Measurements in Bavaria: Create Movie with QGIS Time Manager

The first task for you will be to produce a video on **DWD hourly precipitation data** by means of QGIS Time Manager. 
Have a look at the sample video on YouTube showing the temporal precipitation development in NRW for May 2019:

<a href="http://www.youtube.com/watch?feature=player_embedded&v=fdCQBbzyD84
" target="_blank"><img src="http://img.youtube.com/vi/fdCQBbzyD84/0.jpg" 
alt="QGIS Time Manager: DWD Precipitation Data for NRW" width="300" border="10" /></a>

_Fig.: YouTube video showing the temporal evolution of DWD precipitation data in NRW for May 2019._

THe processing chain consisting of Python code and QGIS project to create the video is found in the Git folder [**gdms0350_DWD_Stations_and_TS_for_TM_soln**](../gdms0350_DWD_Stations_and_TS_for_TM_soln/)

**Task 1:**  Produce your own video **for BAVARIA** by applying the processing chain to a period of **40 days** covering an **interesting rain event in 2017**. You have to use the **historical hourly precipitation data in 2017**. Find an interesting sequence of rain events first by plotting a few time series. 
You should not cover more than two weeks for the video sequence to minimize the processing time.


## 2. Correlation of Mean Annual Temperature with Altitude

In the first lectures we analysed the annual temperature in NRW by means of long time series. The observed temperature increase particularly in the last decade is most likely an indication of climate. We also observed that the station "Kahler Asten" shows systematic lower temperatures than other stations. We presumed this being an effect of decreasing temperature with topographic height, since "Kahler Asten" is among the highest points in NRW. 

**Task 2:**

Verify this hypothesis by means of data in Bavaria. This federal state reveals the broadest range of topographic heights, from 100m to more than 2800m above Normal-Null (NN). **Plot the annual mean temperatures of years 2017, 2018, and 2019 versus altitude for the DWD stations in Bavaria**. At first use the **altitudes from the station description file** `KL_Jahreswerte_Beschreibung_Stationen.txt` for the data set `/annual/kl/historical/`.


## 3. Merge Digital Terrain Model DGM50 for Bavaria from Tiles

If you look closely at the DWD station description you will notice that some of the altitudes given for the stations are not reliable, esp. above 1000 m. 

To assess the correctness you can compare the given altitudes with a digital terrain model (DTM, in German: "Digitales Geländemodell", DGM) from Bavaria. 

**Task 1:** Create a DTM for whole Bavaria from Tiles.

The state of Bavaria provides an open data DTM in a regular grid with a horizontal resolution of 50m and 0.1m height resolution derived from Airborne Laser Scanning. The original CRS is EPSG:31468 (Gauß-Krüger coordinates). 

The DTM is split in 813 tiles. Each tile is provided in XYZ format. This is a simple formatted text with three columns (xyz) and one row per pixel leading to comparatively large file size.

The download link for the tiles can be found in the attribute table of the following vector layer (EPSG:31468): 
http://www.geodaten.bayern.de/opendata/DGM50/OpenData_DGM50.kml

Save the kml file locally and open it as vector layer in QGIS. It shows the outlines of all tiles for the Bavarian DTM, not the DTM grid data themselves. Get the info of one tile by activating the info button and clicking on a tile. Have a look at the attribute data. The last column shows the download links for the 813 tiles. Downloading them manually is not an option. Use Python. Save the layer as CSV file and process it in Python.

You can start with the Jupyter Notebook **`gdms0661_DTM_Bavaria_50m_nnn.ipynb`**. REad the instructions in the notebook carefully. What the code basically does:

1. Download zip archives for all 813 DTM tiles
1. Extract from each zip archive the txt file with the DTM tile in xyz format
1. Translate (convert) all tiles to GeoTiff format
1. Merge all tiles to a single large DTM GeoTiff for Bavaria

**Task 2:** Sample the DTM at the locations of the DWD stations.

Use the QGIS Processing Toolbox to do so. Use the dialog *Sample Raster Values* from the *Raster Analysis Toolbox*.
Selecting the menu item *Processing -> Toolbox* toggles the visibility of the Toolbox pane. From this select *Raster Analysis*.

Add another field to the DWD stations attribute table with the altitudes sampled from the DTM. Compare the original altitudes from the DWD station file to the heights derived from the DTM. Where are the strongest deviations?

**Task 3:** Plot the mean annual temperatures versus the DTM heights for the DWD stations in Bavaria. Do you find a ways to perform a linear regression to the data with numpy? What is the temperature gradient, i.e. slope of regression line in units K/m or °C/m?


## 4. Compare NDVI for Two Different Years

In the last lectures, we talked about remote sensing and how we could use satellite data (Sentinel-2) to obtain information about the earth’s surface based on the spectral properties (i.e. spectral reflectance) of materials such as vegetation and soil without being in contact with the surface itself. We discussed how normalized difference vegetation index (NDVI) can be used to assess the plant´s ability to absorb solar radiation and use this to characterize the plant’s health.
Your task is to analyse the NDVI in the summer periods (May-June) of the years 2018 and 2019 in your own regions of interest (ROI). Define your own ROIs by creating polygons delineating areas with one landuse class per polygon. You should create at least one polygon for each of the following landuse classes:
* Forest
* Water
* Crop Field
* Grassland (not artificially irrigated)
* Urban Area

To save time we identified five Sentinel products atmospherically corrected (Level 2A) and with low cloud coverage. Select (at least) **two appropriate satellite scenes** from the following list covering both years 2018 and 2019. Download and store them in an appropriate folder. 
 
| Date | Product’s name | Link |
| :---:  | :---: | :---: |
| 2018-06-30 | S2A_MSIL2A_20180630T105031_<br>N0208_R051_T31UGT_20180630T144133.SAFE | https://scihub.copernicus.eu/dhus/odata/v1/Products('2cdf37bf-5541-464c-8181-9069d80447c4')/$value | 
| 2018-05-11 | S2A_MSIL2A_20180511T105031_<br>N0207_R051_T32ULC_20180511T111332.SAFE | https://scihub.copernicus.eu/dhus/odata/v1/Products('57afb6dc-f32b-4b7b-8d54-d655251a0d5e')/$value | 
| 2018-04-06 | S2B_MSIL2A_20180406T105029_<br>N0207_R051_T32ULC_20180406T125448.SAFE | https://scihub.copernicus.eu/dhus/odata/v1/Products('4edd776f-276b-4f5d-98f9-0ef7b18aa138')/$value |
| 2019-06-27 | S2B_MSIL2A_20190627T104029_<br>N0212_R008_T31UGT_20190627T135004.SAFE | https://scihub.copernicus.eu/dhus/odata/v1/Products('bb9423ca-e076-41aa-830d-6afa8661df89')/$value |
| 2019-05-13 | S2A_MSIL2A_20190513T104031_<br>N0212_R008_T32ULC_20190513T134155.SAFE| https://scihub.copernicus.eu/dhus/odata/v1/Products('1bdaa4fe-84d8-44e0-8832-fe0e286959f6')/$value |

What does the difference of NDVI tell you for each polygon? Is NDVI enough to classify the different landuses?  
Notice that one polygon might contain more than one NDVI value (more than 1 pixel). So in order to estimate the NDVI for the whole area, you can calculate the statistical mean. 
(Optional task) Try calculating a different spectral index for the same polygons. For which polygons is this spectral index appropriate? Compare this with your NDVI results. 

**ATTENTION: Some of you have already chosen a different approach. This is totally acceptable!** We just want you to analyse Sentinel-2 images with respect to NDVI and its changes over time (here: only two years) as well as to reflect power and limitations of remote sensing.


## 5. FREE EXERCISE

Do something exiting!






 
