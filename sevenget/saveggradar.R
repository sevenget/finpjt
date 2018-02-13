# finalpjt
library(rJava)
library(dplyr)
library(ggplot2)
library(ggiraphExtra)

# 데이터 불러오기
getwd()
setwd("C:/workspace/R/")
qplot(iris$Species)

setwd("C:/workspace/spring/sevenget/src/main/webapp/resources/img")
png(filename = 'ggradar.png', width = 510, height = 400)

ggRadar(data=iris, interactive = F, colour = "#654ea3")+
  theme(text = element_text(size=20))





#dev.copy (png, 'ggradar.png')
dev.off ()