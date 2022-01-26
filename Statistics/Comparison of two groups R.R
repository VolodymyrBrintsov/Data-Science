#Df Creation
df <- iris
View(df)
str(df)

df1 <- subset(df, Species != "setosa")
View(df1)
table(df1$Species)

#Data Vis
hist(df1$Sepal.Length)

ggplot(df1, aes(x=Sepal.Length, ))+
  geom_histogram(fill="white", col='black', binwidth = 0.4) +
  facet_grid(Species ~ .)

ggplot(df1, aes(x=Sepal.Length, fill=Species))+
  geom_density(alpha=0.5)

ggplot(df1, aes(x=Species, y=Sepal.Length)) +
  geom_boxplot()

#Normality test
shapiro.test(df$Sepal.Length)

shapiro.test(df$Sepal.Length[df$Species == "versicolor"])
shapiro.test(df$Sepal.Length[df$Species == "virginica"])

bartlett.test(Sepal.Length ~ Species, df1)

#T test for comparing two vars
t.test(Sepal.Length ~ Species, df1)
test <- t.test(Sepal.Length ~ Species, df1)
str(test)
test$p.value

#Vis the results of t.test
ggplot(df1, aes(x=Species, y=Sepal.Length)) +
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width=0.5) +
  stat_summary(fun.y = mean, geom = "point", size = 2)




