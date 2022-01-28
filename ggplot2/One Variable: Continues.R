library(ggplot2)

set.seed(1234)
df = data.frame(
  sex = factor(rep(c("F", "M"), each=200)),
  weight = c(rnorm(200, 55), rnorm(200, 58)))
View(df)

#We start by creating aestetics
continues_plot <- ggplot(df, aes(x = weight))

# geom_area(): Create an area plot
continues_plot + geom_area(stat = "bin")
### change fill colors by sex
continues_plot + geom_area(aes(fill = sex), stat ="bin", alpha=0.6) +
  theme_classic()

# geom_density(): Create a smooth density estimate
### Basic plot
continues_plot + geom_density()
### change line colors by sex
continues_plot + geom_density(aes(color = sex)) 
### Change fill color by sex
### Use semi-transparent fill: alpha = 0.4
continues_plot + geom_density(aes(fill = sex), alpha=0.4)

# geom_dotplot(): Dot plot
## In a dot plot, dots are stacked with each dot representing one observation.
### Basic plot
continues_plot + geom_dotplot()
### change fill and color by sex
continues_plot + geom_dotplot(aes(fill = sex)) 
### Change fill color manually 
continues_plot + geom_dotplot(aes(fill = sex)) 

# geom_freqpoly(): Frequency polygon
### Basic plot
continues_plot + geom_freqpoly() 
### change y axis to density value and change theme
continues_plot + geom_freqpoly(aes(y = ..density..)) +
  theme_minimal()
### change color and linetype by sex
continues_plot + geom_freqpoly(aes(color = sex, linetype = sex)) +
  theme_minimal()

# geom_histogram(): Histogram
### Basic plot
continues_plot + geom_histogram()
### change line colors by sex
continues_plot + geom_histogram(aes(color = sex), fill = "white",
                   position = "dodge") 

# stat_qq(): quantile - quantile plot
ggplot(df, aes(sample=weight)) + stat_qq()

