?cor()
library(jsonlite)
library(tidyverse)

#To use the cor() function to perform a correlation analysis between two numeric variables, we need to provide the following arguments:

# x is the first variable, which would be plotted on the x-axis.
# y is the second variable, which would be plotted on the y-axis.


# Absolute Value of r	Strength of Correlation
# r < 0.3	None or very weak
# 0.3 ≤ r < 0.5	Weak
# 0.5 ≤ r < 0.7	Moderate
# r ≥ 0.7	Strong

head(mtcars)

# test to see if hp and qt mile speed are correlated:
# plot the two variables
plt <- ggplot(mtcars, aes(x = hp, y = qsec)) # import dataset into ggplot
plt + geom_point() # create scatter plot

# quantify the correlation
cor(mtcars $ hp, mtcars $ qsec)

# testing correlation using used cars dataset
used_cars <- read.csv("01_demo/used_car_data.csv") # read in the csv
head(used_cars)

# plot the two variables, miles driven and selling price to see correlation
plt <- ggplot(used_cars, aes(x = Miles_Driven, y = Selling_Price)) # import the data to ggplot
plt + geom_point() #create scatter plot

#quantify the correlation
cor(used_cars $ Miles_Driven, used_cars $ Selling_Price) #calc the corr

# correlation matrix - needs a numeric matrix fed into the cor function
# convert data frame into numeric matrix, selecting selling price, present price and miles driven
used_matrix <- as.matrix(used_cars[, c("Selling_Price", "Present_Price", "Miles_Driven")])
cor(used_matrix)