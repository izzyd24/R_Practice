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
# URGENT: IF NA output, we have missing values
# need to tell R how to compute these with "use" argument

# cor matrix for multiple columns at once
li_matrix <- as.matrix(li_visitors_data[c("Total.unique.visitors..total.", "Total.page.views..total.", "Jobs.page.views..total.")])
# can use = complete.obs OR na,omit(li_matrix) as needed
cor(li_matrix, use="complete.obs")

# create a linear reg for the total job views x, and 
# total views y
summary(lm(Jobs.page.views..total.~Total.page.views..total., li_visitors_data))

# shows that .72 r square value; or 72% of variability of dependent
# ... is explained by linear model
# .72 = high level of correlation that jobs views affects total views
# p-value < sig level of 0.05%; sufficient evidence to reject null, ho
# the slope of model is not zero!

# plot the linear model; overlay seniority as color
link_plot <- ggplot(li_visitors_data, aes(x=Total.page.views..total., y=Jobs.page.views..total.)) +
  geom_point(col="steelblue", size=2) +
  geom_smooth(method="lm", colour="red") +
  labs(title="Jobs Page Views Impact on Total Page Views", y="Total Page Views", x="Job Page Views")
plot(link_plot) 