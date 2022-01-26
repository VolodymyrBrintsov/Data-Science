df <- read.csv("../data/grants.csv")
View(df)
str(df)

#make target variable be factor
## 1st way
df$status <- factor(df$status)
levels(df$status) <- c("Not Funded", "Funded")
# 2 way
df$status <- factor(df$status, labels=c("Not Funded", "Funded"))

#Table
t1 <- table(df$status)
t1
dim(t1)

#2nd Table
t2 <- table(status = df$status, field = df$field)
t2
##Proportions of table, accepts another contingency table
prop_t2 <- prop.table(t2)
prop_t2
##sum of rows equal to 100%
prop_t2 <- prop.table(t2, 1)
prop_t2
##Sum of columns are equal to 100%
prop_t2 <- prop.table(t2, 2)
prop_t2

#3d table
t3 <- prop.table(table(Year=df$years_in_uni, Field=df$field, Status=df$status))
t3
