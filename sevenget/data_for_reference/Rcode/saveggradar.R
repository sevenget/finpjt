library(rJava)
library(ggplot2)
library(fmsb)

# Create data: note in High school for several students
set.seed(99)
data=as.data.frame(matrix( sample( 0:10 , 14 , replace=T) , ncol=7))
colnames(data)=c("연애" , "결혼" , "육아 및 출산" , "꿈" , "희망", "내집마련", "인간관계" )
rownames(data)=paste("" , letters[1:2] , sep="-")

# To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each topic to show on the plot!
data=rbind(rep(10,7) , rep(0,7) , data)
ra

#==================
# Plot 2: Same plot with custom features  #ADD72E
colors_border=c(rgb(0/255, 0/255, 0/255,0.9), rgb(101/255, 78/255, 163/255,0.9))
colors_in=c( rgb(0/255, 0/255, 0/255,0.3), rgb(195/255, 188/255, 210/255,0.9))
radarchart( data  , axistype=1 , seg = 2,
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=c(1,4) , plty=c(3,1),
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,10,5), cglwd=0.8,
            vlcex=0.8           #custom  
)
legend(x=0.7, y=1, legend = rownames(data[-c(1,2),]), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)

