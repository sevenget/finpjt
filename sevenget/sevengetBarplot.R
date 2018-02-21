setwd("C:/Users/user/git/finpjt/sevenget")
library(ggplot2)
#현재 상태를 opar에 저장한다 
opar <- par(no.readonly = TRUE)
# 화면을 2*2로 나눈다
par(mfrow = c(2, 2))
#===================================================================================
dateD <- read.csv("date.csv", header=F,col.names = c("no","date"))
dateD <- dateD[,2]
class(dateD)
dateFreq<-as.data.frame(table(dateD))


plot1 <- qplot(dateD,aes(x=Freq,y=date))+coord_flip()+geom_bar(fill="#654ea3")+ labs(x='연애') + geom_text(aes(dateFreq$Freq))

#===================================================================================
marriageD <- read.csv("marriage.csv",header=F,col.names = c("no","marriage"))
marriageD <- marriageD[,2]
class(marriageD)
table(marriageD)

plot2 <- qplot(marriageD)+coord_flip()+geom_bar(fill="#654ea3")+ labs(x='결혼')

#===================================================================================
babyD <- read.csv("baby.csv",header=F,col.names = c("no","baby"))
babyD <- babyD[,2]
class(babyD)
table(babyD)

plot3 <- qplot(babyD)+coord_flip()+geom_bar(fill="#654ea3")+ labs(x='출산 및 육아')

#===================================================================================
houseD <- read.csv("house.csv",header=F,col.names = c("no","house"))
houseD <- houseD[,2]
class(houseD)
table(houseD)

plot4 <- qplot(houseD)+coord_flip()+geom_bar(fill="#654ea3")+ labs(x='내집마련')

#===================================================================================
relationshipD <- read.csv("relationship.csv",header=F,col.names = c("no","relationship"))
relationshipD <- relationshipD[,2]
class(relationshipD)
table(relationshipD)

plot5 <- qplot(relationshipD)+coord_flip()+geom_bar(fill="#654ea3")+ labs(x='인간관계')

#===================================================================================
dreamD <- read.csv("dream.csv",header=F,col.names = c("no","dream"))
dreamD <- dreamD[,2]
class(dreamD)
table(dreamD)

plot6 <- qplot(dreamD)+coord_flip()+geom_bar(fill="#654ea3")+ labs(x='꿈')

#===================================================================================
hopeD <- read.csv("hope.csv",header=F,col.names = c("no","hope"))
hopeD <- hopeD[,2]
class(hopeD)
table(hopeD)

plot7 <- qplot(hopeD)+coord_flip()+geom_bar(fill="#654ea3")+ labs(x='꿈')



library(gridExtra)
grid.arrange(plot1,plot2,plot3,plot4,plot5,plot6,plot7,nrow=3)


