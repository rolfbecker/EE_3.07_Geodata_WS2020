README_ESRI.TXT

HABEN SIE BEI DATUMSTRANSFORMATIONEN SCHWIERIGKEITEN UNTER ESRI?

DANN ERSETZEN SIE DIE VORHANDENEN .PRJ-DATEIEN MIT DENJENIGEN 
AUS DEM ORDNER ESRI-PRJ UND VERSUCHEN SIE ES ERNEUT!
(Sichern Sie ggf. die vorhandenen .prj-Dateien, um diese bei Bedarf
restaurieren zu können)


Information zu den Projektionsdateien (.prj) des Shape-Formates
---------------------------------------------------------------

Durch eine Projektionsdatei (.prj) desselben Namens wird einer 
Shape-Datei ein Koordinatenreferenzsystem zugewiesen. Ein 
System, dass Daten unterschiedlicher Koordinatenreferenzsysteme
zur Anzeige bringt, kann anhand der in der .prj-Datei abgelegten 
Parameter eine adaequate Transformation durchfuehren. 

Durch die hohe Akzeptanz und Verbreitung von Shape-Dateien auch 
ausserhalb der ESRI-Software, hat sich der Gebrauch von .prj-Dateien
ebenso in anderen Programmen etabliert. Leider sind .prj-Dateien formal
nicht streng genug gefasst, so dass kleine Unterschiede von System
zu System auftreten. Dies betrifft vor allem die Genauigkeit
der mathematischen Parameter und die Benennung der Referenz- und
Bezugssysteme.    

GEObasis.nrw hat sich daher entschieden, Projektionsdateien entsprechend 
der internationalen Website: 

http\\spatialreference.org.
 
abzulegen. Die von ESRI benutzten Projektionsdateien unterscheiden sich 
hiervon hinsichtlich der Namensgebung geringfuegig. Die mathematischen 
Parameter sind identisch.

Dies fuehrt unter Umstaenden dazu, dass ESRI-Produkte (ArcGIS) diese 
Eintraege nicht eindeutig identifizieren und es, insbesondere bei 
Datumstransformationen, zu Schwierigkeiten kommen kann:

Werden shape-Daten mit den Projektionsdateien von GEObasis.nrw geladen, 
so wird diesen Daten das Koordinatensystem "ETRS89 / UTM zone 32N"
zugewiesen, da dieser Name in der prj-Datei steht. Dieser Name ist jedoch
in ArcGIS nicht in dieser Form bekannt (hier "ETRS_1989_UTM_Zone_32N", 
und somit kann beim Hinzuladen weiterer Daten keine adaequate 
Transformation angeboten werden. 
Aufgrund der fehlenden Identifikation wird evtl. kein Datumsuebergang 
beruecksichtigt, wodurch sich ein Versatz von bis zu 180m (in NRW) ergibt - 
die notwendige Transformation BeTA2007 wird nicht verwendet.

Die angebotenen Transformationen sind vom Eintrag "GEOGCS" in der 
Projektionsdatei abhaengig. Setzt man diesen Eintrag von "ETRS89" auf
"GCS_ETRS_1989",so erhaelt man die noetigen Transformationen zur Auswahl.

Aus diesem Grunde stellt GEObasis.nrw die ESRI-spezifischen 
Projektionsdateien im Ordner ESRI-prj zur Verfuegung. Diese Dateien 
muessen in das Verzeichnis mit den anderen Shape-Dateien kopiert werden 
und auch genauso heissen wie diese. Sichern Sie also ggf. zunaechst die 
"alten" Projektionsdateien, um diesen Vorgang rueckgaengig machen zu 
koennen.

Das Problem kann in ArcGIS umgangen werden, indem man dem ArcGIS-
Dataframe zu Beginn das entsprechende Koordinatenreferenzsystem 
aus der internen Liste zuweist, denn dann wird dieses vordefinierte System 
und nicht das der Projektionsdatei als Bezug verwendet.

