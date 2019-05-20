library(maps)
library(geosphere)
pal <- colorRampPalette(c("green", "red"))
#pal <- colorRampPalette(c("#333333", "white", "#1292db"))

colors <- pal(100)


#xlim <- c(-170, -55) #USA
#ylim <- c(12, 70) #USA
#xlim <- c(-130, -65) #NORTHUSA
#ylim <- c(15, 60) #NORTHEUSA
#xlim <- c(-16, 34) #EU
#ylim <- c(38, 61) #EU
#xlim <- c(107, 179) #AUNZ
#ylim <- c(-48, 0) #AUNZ
#xlim <- c(60, 150) #AISA
#ylim <- c(10, 63) #AISA



#map("world", col="white", fill=FALSE, bg="#000000", lwd=.2, xlim=xlim, ylim=ylim)
map("world", col="grey22", fill=TRUE, bg="navyblue", lwd=.2)#, xlim=xlim, ylim=ylim)

#map("world", col="#101919", fill=TRUE, bg="#000000", lwd=0.5)

traces <- read.csv("/dataviz/maltrace/5_all_withoutAUunmatched", sep = "," , header=FALSE)
#traces <- read.csv("/dataviz/maltrace/5_all_withoutAUunmatched_detupled", sep = "," , header=FALSE)
lines <- nrow(traces)
max_cnt <- max (traces$V1)
max_width <- .15
min_width <- .15

	for (this_one in 1:lines) {
		long1 <- traces$V3[this_one]
		lat1 <- traces$V2[this_one]
		long2 <- traces$V5[this_one]
		lat2 <- traces$V4[this_one]   
		
		inter <- gcIntermediate(c(long1, lat1), c(long2, lat2), n=500, addStartEnd=TRUE,breakAtDateLine=TRUE)
		colindex <- max(1,round( (traces[this_one,]$V1 / max_cnt) * length(colors)))
		this_color<- colors[colindex]
		this_width <- max (min_width, (((traces[this_one,]$V1)/max_cnt) * max_width) )
		print (traces[this_one,]$V1) 
		print(this_color)
		print(this_width)
		
		if (length(inter) >= 8 ) {
			lines(inter, col=this_color, lwd=this_width)
		}
		else {
			inter <- gcIntermediate(c(long1, lat1), c(long2, lat2), n=500, addStartEnd=TRUE,breakAtDateLine=TRUE)	
			lines(inter[[1]], col=this_color, lwd=this_width) 
			lines(inter[[2]], col=this_color, lwd=this_width)
		}
	}
