# R-Great-Circles
Mapping malware on its way to Melbourne Australia using Great Circles in R
This is code repo for my visualization work as seen As seen https://dataviz.com.au/2018/05/16/mapping-malware-on-its-way-to-melbourne-australia-using-great-circles/

I tracked malicious IPs that were attempting to connect to our system located in Melbourne, Australia. I then traced the route back to the source IP address and geolocated each of the “hops” that malware likely traveled through. This method is indicative and subject to various caveats, however it is interesting as a conceptual level visualization, as it illustrates how malware “travels” over physical borders.
I plotted these paths as Great Circle lines, which is the shortest route between two points when plotted on the curved surface of the earth. Some of the lines have also been color encoded, so as to indicate traffic directionality –  the green end of the line is the starting point and the red end is the landing point.

These images were created using the programming language “R”, which is a well-known language for statistical computing and graphics.
