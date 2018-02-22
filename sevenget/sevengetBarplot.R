setwd("C:/Users/user/git/finpjt/sevenget")
library(ggplot2)
#===================================================================================
dateD <- read.csv("date.csv", header=F,col.names = c("no","date"))
dateD <- dateD[,2]
class(dateD)

plot1 <- qplot(dateD)+coord_flip()+geom_bar(fill="#654ea3")+ labs(x='연애') + geom_text(stat='count',aes(label=..count..),nudge_x = 0, nudge_y = 1, size = 3)

#===================================================================================
marriageD <- read.csv("marriage.csv",header=F,col.names = c("no","marriage"))
marriageD <- marriageD[,2]
class(marriageD)
table(marriageD)

plot2 <- qplot(marriageD)+coord_flip()+geom_bar(fill="#654ea3")+ labs(x='결혼') + geom_text(stat='count',aes(label=..count..),nudge_x = 0, nudge_y = 1, size = 3)

#===================================================================================
babyD <- read.csv("baby.csv",header=F,col.names = c("no","baby"))
babyD <- babyD[,2]
class(babyD)
table(babyD)

plot3 <- qplot(babyD)+coord_flip()+geom_bar(fill="#654ea3")+ labs(x='출산 및 육아') + geom_text(stat='count',aes(label=..count..),nudge_x = 0, nudge_y = 1, size = 3)

#===================================================================================
houseD <- read.csv("house.csv",header=F,col.names = c("no","house"))
houseD <- houseD[,2]
class(houseD)
table(houseD)

plot4 <- qplot(houseD)+coord_flip()+geom_bar(fill="#654ea3")+ labs(x='내집마련') + geom_text(stat='count',aes(label=..count..),nudge_x = 0, nudge_y = 1, size = 3)

#===================================================================================
relationshipD <- read.csv("relationship.csv",header=F,col.names = c("no","relationship"))
relationshipD <- relationshipD[,2]
class(relationshipD)
table(relationshipD)

plot5 <- qplot(relationshipD)+coord_flip()+geom_bar(fill="#654ea3")+ labs(x='인간관계') + geom_text(stat='count',aes(label=..count..),nudge_x = 0, nudge_y = 1, size = 3)

#===================================================================================
dreamD <- read.csv("dream.csv",header=F,col.names = c("no","dream"))
dreamD <- dreamD[,2]
class(dreamD)
table(dreamD)

plot6 <- qplot(dreamD)+coord_flip()+geom_bar(fill="#654ea3")+ labs(x='꿈') + geom_text(stat='count',aes(label=..count..),nudge_x = 0, nudge_y = 1, size = 3)

#===================================================================================
hopeD <- read.csv("hope.csv",header=F,col.names = c("no","hope"))
hopeD <- hopeD[,2]
class(hopeD)
table(hopeD)

plot7 <- qplot(hopeD)+coord_flip()+geom_bar(fill="#654ea3")+ labs(x='꿈') + geom_text(stat='count',aes(label=..count..),nudge_x = 0, nudge_y = 1, size = 3)


# plot1
# plot2
# plot3
# plot4
# plot5
# plot6
# plot7





library(gridExtra)
grid.arrange(plot1,plot2,plot3,plot4,plot5,plot6,plot7,nrow=3)


