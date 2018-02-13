# finalpjt
library(rJava)
library(dplyr)
library(ggplot2)
library(ggiraphExtra)

# 데이터 불러오기
getwd()
setwd("C:/workspace/spring/sevenget/src/main/webapp/resources/img/plots")
png(filename = 'ggradar.png', width = 510, height = 400)

# Library
library(fmsb)

# Create data: note in High school for Jonathan:
data=as.data.frame(matrix( sample( 2:20 , 10 , replace=T) , ncol=10))
colnames(data)=c("math" , "english" , "biology" , "music" , "R-coding", "data-viz" , "french" , "physic", "statistic", "sport" )

# To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each topic to show on the plot!
data=rbind(rep(20,10) , rep(0,10) , data)

# The default radar chart proposed by the library:
# radarchart(data)

# Custom the radarChart !
radarchart( data  , axistype=1 , 
            
  #custom polygon
  pcol=rgb(101/255, 78/255, 163/255,1) , pfcol=rgb(195/255, 188/255, 210/255,0.7) , plwd=4 , 
            
  #custom the grid
  cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
            
  #custom labels
  vlcex=0.8 
)




#dev.copy (png, 'ggradar.png')
dev.off ()
