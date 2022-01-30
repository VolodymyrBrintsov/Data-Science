library(ggplot2)
data(economics)
head(economics)

cont_func <- ggplot(economics, aes(x = date, y = unemploy))

# Area plot
cont_func + geom_area()

# Line plot: connecting observations, ordered by x
cont_func + geom_line()

# Connecting observations by stairs
cont_func + geom_step()

