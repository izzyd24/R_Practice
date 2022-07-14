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
# import dataset into ggplot
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy))
# add boxplot
plt + geom_boxplot() +
# rotation 
theme(axis.text.x=element_text(angle=45,hjust=1)) +
# overlay scatter plot on top
geom_point()

# mapping and data arguments added
# with context on stdev of engine size for each car class
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine))
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") +
geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine))

# convert to long format
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy))

# import dataset into ggplot2
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type))
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) +
# add boxplot with labels, 45 degree rotation
theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer")

# qual test for normality
ggplot(mtcars,aes(x=wt)) + geom_density()

# quant test for normality
shapiro.test(mtcars$wt)

# random sample practice
# import the dataset
population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F)
# import into ggplot
plt <- ggplot(population_table,aes(x=log10(Miles_Driven)))
# plot with density
plt + geom_density()

# once we make the density plot, then we do the sample
sample_table <- population_table %>% sample_n(50)
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven)))
plt + geom_density()



# compare sample means in t test
t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven)))

# paired t test example with mpg.csv 
# import the csv
mpg_data <- read.csv('mpg_modified.csv')
# select data pts year of 1999
mpg_1999 <- mpg_data %>% filter(year==1999)
# select data pts year of 2008
mpg_2008 <- mpg_data %>% filter(year==2008)
# compare mean difference in the two samples
t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T)

# anova, but first place filter on columns of mtcars dataset
mtcars_filt <- mtcars[,c("hp","cyl")]
# convert numeric column to factor
mtcars_filt$cyl <- factor(mtcars_filt$cyl)
# fun the anova, compare means across multiple levels
summary(aov(hp ~ cyl,data=mtcars_filt))


