library(maps)
library(geosphere)

map("world", col="grey11", fill=TRUE, bg="navyblue", lwd=.2)

traces <- read.csv("/dataviz/r_maltrace/output_feed_to_file_head500.txt", sep = "," , header=FALSE)
lines <- nrow(traces)
this_width=.5

	for (this_one in 1:lines) {
		long1 <- traces$V3[this_one]
		lat1 <- traces$V2[this_one]
		long2 <- traces$V5[this_one]
		lat2 <- traces$V4[this_one]   
		
		inter <- gcIntermediate(c(long1, lat1), c(long2, lat2), n=100, addStartEnd=TRUE,breakAtDateLine=TRUE)

		
		# If there are lots of points in the inter array, then the GC doesn't cross the dateline, 
		# so its OK to just draw it out as one
		if (length(inter) >= 6 ) {
			lines(inter, col="green", lwd=this_width)
		}
		# However, if length(inter) is small, it means there are 2 submatrices, which were created 
		# by gcIntermediate as the GC crossed the dateline.
		# Now we can call out each of these 2 seperate arrays, and draw each one seperately.
		else {	
			print ("found one")
			print (length(inter))
			lines(inter[[1]], col="red", lwd=this_width) 
			lines(inter[[2]], col="white", lwd=this_width)
		}
	}
