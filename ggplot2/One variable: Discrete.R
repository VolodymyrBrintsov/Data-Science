data("mpg")
df <- mpg
View(df)

#The function geom_bar() can be used to visualize one discrete variable. In this case, 
#the count of each level is plotted. We’ll use the mpg data set [in ggplot2 package]. 
discrete_plot <- ggplot(mpg, aes(fl))

## Basic plot
discrete_plot + geom_bar()
## Change fill color
discrete_plot + geom_bar(fill = "steelblue", color ="steelblue") +
  theme_minimal()



