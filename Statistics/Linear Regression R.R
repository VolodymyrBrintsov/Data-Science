df <- mtcars
View(df)

#Correlation
corr <- cor.test(df$mpg, df$hp)
str(corr)

ggplot(df, aes(mpg, hp, col=factor(cyl), size=qsec)) +
  geom_point()

num_df <- df[,c(1, 3:7)]
pairs(num_df)
cor(num_df)
library(psych)
corr.test(num_df)

#Simple Linear Regression
fit <- lm(mpg ~ hp, df)
fit
summary(fit)

ggplot(df, aes(hp, mpg)) +
  geom_point(size=4) +
  geom_smooth(method = "lm") +
  facet_grid(~cyl)

fitted_values <- data.frame(mpg=df$mpg, fitted<-fit$fitted.values)
View(fitted_values)

predict(fit, data.frame(hp = c(100, 150)))

#Multiple Regression
df <- data.frame(swiss)
View(df)
str(df)

ggplot(df, aes(Fertility)) +
  geom_histogram(fill='white', col='black', binwidth = 2)

fit <- lm(Fertility ~ Examination + Catholic, df)
summary(fit)
##MultiReg with interaction
inter_fit <- lm(Fertility ~ Examination * Catholic, df)
summary(inter_fit)
##Confindence interval for linear reg
confint(inter_fit)

#Model Selection
df <- data.frame(swiss)
full_model <- lm(Fertility ~., df)
optimal_fit <- step(full_model, direction = "backward")
summary(optimal_fit)






