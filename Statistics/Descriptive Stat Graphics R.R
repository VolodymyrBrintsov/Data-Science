df

#Basic function
hist(df$mpg, breaks=20)
boxplot(mpg ~ am, df)
plot(df$mpg, df$hp)

# GGplot2
library(ggplot2)
ggplot(df, aes(x=mpg)) + 
  geom_histogram(fill='white', col='black', binwidth=4)


ggplot(df, aes(x=mpg, fill=am)) + 
  geom_dotplot()


ggplot(df, aes(x=mpg, fill=am)) + 
  geom_density(alpha=0.2)

ggplot(df, aes(x=am, y=hp, col=vs)) +
  geom_boxplot()

ggplot(df, aes(x=mpg, y=hp, size=qsec, col=am)) +
  geom_point()