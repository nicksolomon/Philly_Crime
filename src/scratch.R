kde_temp <- bkde2D(cbind(points_year$LON, points_year$LAT),
                   bandwidth = c(bw.nrd(points_year$LON), bw.nrd(points_year$LAT)))

contours_temp <- contourLines(kde_temp$x1, kde_temp$x2, kde_temp$fhat, nlevels = 5)

unique(unlist(contours_temp)[grepl("level", attr(unlist(contours_temp), "names"))])

attr()

colorRampPalette(c("#0000ff","#ff0000"), interpolate = "linear", bias = 2)(n = length(unique(unlist(contours_temp)[grepl("level", attr(unlist(contours_temp), "names"))])))

for(i in 1:length(contours_temp)){
  
}

View(kde_temp$fhat)

int <- 0
for(i in 1:(nrow(kde_temp$fhat)-1)){
  for(j in 1:(ncol(kde_temp$fhat)-1)){
    int <- int + kde_temp$fhat[i,j]*(kde_temp$x1[j+1]-kde_temp$x1[j])*(kde_temp$x2[i+1]-kde_temp$x2[1])
  }
}
int

