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

# heatmaps
# create the summary table
mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
# import into ggplot2
plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))
# create the heatmap
plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)")

# different version
# create summary table
mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
# import dataset into ggplot
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy))
# create the heatmap
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)")+
# rotation of labels
theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5))

# 15.3.7 layers to plots