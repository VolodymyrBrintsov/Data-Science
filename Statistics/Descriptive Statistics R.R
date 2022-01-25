#Create DataFrame
df <- mtcars
head(df)
View(df)

#Inspect variable names and types
str(df)

#Convert categorical vars into factors
df$vs <- factor(df$vs, labels=c("V", "S"))
df$am <- factor(df$am, labels=c("Auto", "Manual"))

View(df)

#Descriptive stat
median(df$mpg)
mean(df$mpg)
sd(df$mpg)
range(df$mpg)

## Mean Value for number of cylinders == 6
mean(df$mpg[df$cyl == 6])

#Aggregation
mean_hp_vs <- aggregate(x=df$hp, by=list(df$vs), FUN=mean)
colnames(mean_hp_vs) <- c("VS", "Mean HP")
View(mean_hp_vs)

alternative_mean_hp_vs <- aggregate(hp ~ vs, df, mean)
View(alternative_mean_hp_vs)
aggregate(hp ~ am + vs, df, mean)

aggregate(df[, c("mpg", "hp")], by=list(df$vs, df$am), FUN=median)
aggregate(cbind(mpg, hp) ~ am + vs, df, median)

#Describe from psych library
library(psych)
describe(df)
describeBy(df[,-c(8, 9)], group = df$vs)
