# make some data
months <-rep(c("jan", "feb", "mar", "apr", "may", "jun", 
               "jul", "aug", "sep", "oct", "nov", "dec"), 2)
chickens <-c(1, 2, 3, 3, 3, 4, 5, 4, 3, 4, 2, 2)
eggs <-c(0, 8, 10, 13, 16, 20, 25, 20, 18, 16, 10, 8)
values <-c(chickens, eggs)
type <-c(rep("chickens", 12), rep("eggs", 12))
mydata <-data.frame(months, values)

library(ggplot2)

p <-ggplot(mydata, aes(months, values))
p +geom_bar()

p <-ggplot(mydata, aes(months, values))
p +geom_bar(stat = "identity")
barplot1

mydata$months
#[1] jan feb mar apr may jun jul aug sep oct nov dec jan feb mar apr may
#[18] jun jul aug sep oct nov dec
#Levels: apr aug dec feb jan jul jun mar may nov oct sep

mydata$months <-factor(mydata$months, 
                       levels = c("jan", "feb", "mar", "apr", "may", "jun",
                                  "jul", "aug", "sep", "oct", "nov", "dec"))

mydata$months
#[1] jan feb mar apr may jun jul aug sep oct nov dec jan feb mar apr may
#[18] jun jul aug sep oct nov dec
#Levels: jan feb mar apr may jun jul aug sep oct nov dec

p <-ggplot(mydata, aes(months, values))
p +geom_bar(stat = "identity", aes(fill = type)) 