# R-Great-Circles
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) 

Mapping malware on its way to Melbourne Australia using Great Circles in R

![alt text](https://github.com/benjeems/R-Great-Circles/images/heat_lines/USA_unweighted.png "map")
![alt text](https://github.com/benjeems/Robot-Guitar/blob/master/images/breadboard_8001.jpg "Robot guitar circuitry")

This is code repo for my visualization work as seen here: https://dataviz.com.au/2018/05/16/mapping-malware-on-its-way-to-melbourne-australia-using-great-circles/

I tracked malicious IPs that were attempting to connect to our system located in Melbourne, Australia. I then traced the route back to the source IP address and geolocated each of the “hops” that malware likely traveled through. This method is indicative and subject to various caveats, however it is interesting as a conceptual level visualization, as it illustrates how malware “travels” over physical borders.
I plotted these paths as Great Circle lines, which is the shortest route between two points when plotted on the curved surface of the earth. Some of the lines have also been color encoded, so as to indicate traffic directionality –  the green end of the line is the starting point and the red end is the landing point.

Images were created using the programming language “R”, which is a well-known language for statistical computing and graphics. The images are within the images directory on this repo.
