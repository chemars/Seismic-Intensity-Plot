#!/usr/bin/env -S bash -e
export GMT_SESSION_NAME=$$	# Set a unique session name
data=intensity.csv

gmt begin 
gmt figure CWB_2000 png A+m1c
gmt basemap -Jm3c -R119/123/21/26 -Ba1 -B+t"Intensity Map"
gmt coast -Df -W0.3p
gawk 'BEGIN {FS=","}; {if (NR > 1 && $5 <= 4) print $3, $4, $5}' $data | gmt text -F+f12p,,blue+jMC
gawk 'BEGIN {FS=","}; {if (NR > 1 && $5 >= 5) print $3, $4, $5}' $data | gmt text -F+f12p,,red+jMC
echo 119.15 21.15 "Intensity scale: CWB (2000)" | gmt text -F+f10p,,black+jML

gmt figure CWB png A+m1c
gmt basemap -Jm3c -R119/123/21/26 -Ba1 -B+t"Intensity Map"
gmt coast -Df -W0.3p
gawk 'BEGIN {FS=","}; {if (NR > 1) print $3, $4, $6}' $data | gmt text -F+f12p,,blue+jMC
echo 119.15 21.15 "Intensity scale: CWB" | gmt text -F+f10p,,black+jML

gmt figure JMA png A+m1c
gmt basemap -Jm3c -R119/123/21/26 -Ba1 -B+t"Intensity Map"
gmt coast -Df -W0.3p
gawk 'BEGIN {FS=","}; {if (NR > 1) print $3, $4, $8}' $data | gmt text -F+f12p,,blue+jMC
echo 119.15 21.15 "Intensity scale: JMA" | gmt text -F+f10p,,black+jML

gmt figure FJEA png A+m1c
gmt basemap -Jm3c -R119/123/21/26 -Ba1 -B+t"Intensity Map"
gmt coast -Df -W0.3p
gawk 'BEGIN {FS=","}; {if (NR > 1 && $9 <= 5) print $3, $4, $9}' $data | gmt text -F+f12p,,blue+jMC
gawk 'BEGIN {FS=","}; {if (NR > 1 && $9 >= 6) print $3, $4, $9}' $data | gmt text -F+f12p,,red+jMC
echo 119.15 21.15 "Intensity scale: FJEA" | gmt text -F+f10p,,black+jML
gmt end