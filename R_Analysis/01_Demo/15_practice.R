# boxplot
# import the dataset into ggplot2
plt <- ggplot(mpg, aes(y=hwy))

# plot it as boxplot
# geom_boxplot()expects a numeric vector 
# assigned to y value
plt + geom_boxplot()

# create a set of boxplots
# import dataset into ggplot2
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy))

# add boxplot, rotate x axis by 45 degrees
plt + geom_boxplot(outlier.colour = "red", outlier.shape = 1, fill = "white", colour = "#3366FF") + theme(axis.text.x=element_text(angle=45,hjust=1))


