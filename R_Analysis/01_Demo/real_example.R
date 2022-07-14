# import the csv
li_visitors_data <- read.csv('LIVisitors(Updated).csv')

# rename the columns

# want to do correlation check on job page views as x
# and total page views as y 
head(li_visitors_data)

# plot our 2 variables using geompoint
# import dataset into ggplot
plt <- ggplot(li_visitors_data,aes(x=Jobs.page.views..total.,y=Total.page.views..total.))
# create the scatter
plt + geom_point()

# inital look: strong positive correlation between the two
# find correlation coeff
cor(li_visitors_data$Jobs.page.views..total., li_visitors_data$Total.page.views..total.)

# cor matrix for multiple columns at once
li_matrix <- as.matrix(li_visitors_data[c("Total.unique.visitors..total.", "Total.page.views..total.", "Jobs.page.views..total.")])
cor(li_matrix)