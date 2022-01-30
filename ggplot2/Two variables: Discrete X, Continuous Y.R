library(ggplot2)
data("ToothGrowth")
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
head(ToothGrowth)

disc_x_cont_y <- ggplot(ToothGrowth, aes(x = dose, y = len))

# geom_boxplot(): Box and whiskers plot
## Default plot
disc_x_cont_y + geom_boxplot()
## Notched box plot
disc_x_cont_y + geom_boxplot(notch = TRUE)
## Color by group (dose)
disc_x_cont_y + geom_boxplot(aes(color = dose))
## Change fill color by group (dose)
disc_x_cont_y + geom_boxplot(aes(fill = dose))
## Box plot with multiple groups
ggplot(ToothGrowth, aes(x=dose, y=len, fill=supp)) +
  geom_boxplot()

# geom_violin(): Violin plot -
# Violin plots are similar to box plots, except that they also 
# show the kernel probability density of the data at different values.
disc_x_cont_y + geom_violin() +
  stat_summary(fun.data="mean_sdl", geom="pointrange", fun.args = list(mult=1))

# geom_dotplot(): Dot plot
disc_x_cont_y + geom_dotplot(binaxis = "y", stackdir = "center")
disc_x_cont_y + geom_dotplot(binaxis = "y", stackdir = "center") + 
  stat_summary(fun.data="mean_sdl",  fun.args = list(mult=1), 
               geom="pointrange", color = "red")

#geom_bar(): Bar plot
## Basic bar plot
disc_x_cont_y + geom_bar(stat = "identity")
## Change fill color and add labels
disc_x_cont_y + geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=len), vjust=-0.3, size=3.5)+
  theme_minimal()
## Change bar plot line colors by groups
disc_x_cont_y + geom_bar(aes(color = dose),
             stat="identity", fill="white")
## Change bar plot fill colors by groups
disc_x_cont_y + geom_bar(aes(fill = dose), stat="identity")
## with multiple groups
g <- ggplot(ToothGrowth, aes(x=dose, y=len, fill=supp)) 
## Stacked bar plot
g + geom_bar(stat = "identity")
## Use position=position_dodge()
g + geom_bar(stat="identity", position=position_dodge())
  



