library(ggplot2)
data(diamonds)
head(diamonds[, c("carat", "price")])

bi_cont <- ggplot(diamonds, aes(carat, price))

# geom_bin2d(): Add heatmap of 2d bin counts
## The function geom_bin2d() produces a scatter plot with rectangular bins. 
## The number of observations is counted in each bins and displayed as a heatmap.
bi_cont + geom_bin2d()

# geom_hex(): Add hexagon bining
library(hexbin)
## Default plot 
bi_cont + geom_hex()
## Change the number of bins
bi_cont + geom_hex(bins = 10)

# geom_density_2d(): Add contours from a 2d density estimate
## Default plot
bi_cont + geom_density_2d()
## Add points
bi_cont + geom_point() + geom_density_2d()
