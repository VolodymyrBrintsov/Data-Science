library(ggplot2)
data(mtcars)
mtcars$cyl <- as.factor(mtcars$cyl)
head(mtcars[, c("wt", "mpg", "cyl")])


two_cont <- ggplot(mtcars, aes(x = wt, y = mpg))

# geom_point(): Scatter plot
## Basic plot
two_cont + geom_point()

## change the color and the point 
## by the levels of cyl variable
two_cont + geom_point(aes(color = cyl, shape = cyl)) 
## Change color manually
two_cont + geom_point(aes(color = cyl, shape = cyl)) +
  scale_color_manual(values = c("#999999", "#E69F00", "#56B4E9"))+
  theme_minimal()

# geom_smooth(): Add regression line or smoothed conditional mean
## Regression line only
two_cont + geom_smooth(method = lm)

## Point + regression line
## Remove the confidence interval 
two_cont + geom_point() + 
  geom_smooth(method = lm, se = FALSE)
## loess method: local regression fitting
two_cont + geom_point() + geom_smooth()
## Change color and shape by groups (cyl)
two_cont + geom_point(aes(color=cyl, shape=cyl)) + 
  geom_smooth(aes(color=cyl, shape=cyl), 
              method=lm, se=FALSE, fullrange=TRUE)

# geom_jitter(): Jitter points to reduce overplotting
two_cont + geom_jitter(
  position = position_jitter(width = 0.5, height = 0.5))

# geom_text(): Textual annotations
two_cont + geom_text(aes(label = rownames(mtcars)))
