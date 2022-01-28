library(ggplot2)

df <- read.csv("data/shops.csv")
View(df)
str(df)

#One-way Anowa
ggplot(df, aes(x=origin, y=price)) +
  geom_boxplot()

fit <- aov(price ~ origin, df)
summary(fit)

#Two-wat Anowa
fit <- aov(price ~ origin + store, df)
summary(fit)

model.tables(fit, "effects")

#Interaction
pd = position_dodge(0.1)
ggplot(df, aes(x = store, y = price, color = origin, group = origin)) + 
  stat_summary(fun.data = mean_cl_boot, geom = 'errorbar', width = 0.2, lwd = 0.8, position = pd)+  
  stat_summary(fun.data = mean_cl_boot, geom = 'line', size = 1.5, position = pd) +
  stat_summary(fun.data = mean_cl_boot, geom = 'point', size = 5, position = pd, pch=15) +
  theme_bw()

fit_int <- aov(price ~ origin * store, df)
summary(fit_int)

#Pairwise Comparison
ggplot(df, aes(food, price)) +
  geom_boxplot()

summary(aov(price ~ food, df))

TukeyHSD(aov(price ~ food, df))





