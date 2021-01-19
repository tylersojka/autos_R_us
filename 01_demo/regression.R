library(jsonlite)
library(tidyverse)
?lm

# lm(formula data)
#With simple linear regression, we'll use the formula Y ~ A where Y is the column name of the dependent variable, and A is the column name of the independent variable.

# y = mx + b
# m = slope
# b =  intercept 
# y = dependent variable
# x = independent variable

lm(qsec ~ hp, mtcars) #create linear model
#gives us the line : qsec = -0.01846hp + 20.56

#to get p-value and r-sq wrap in summary:
summary(lm(qsec ~ hp, mtcars)) # summarize linear model
# gives us r-sq of 0.5016 which means roughly half of our qt mile predictions will be correct with this model

#Once we have calculated our linear regression model, we can visualize the fitted line against our dataset using ggplot2.
#First, we need to calculate the data points to use for our line plot using our lm(qsec ~ hp,mtcars) coefficients as follows:
model <- lm(qsec ~ hp, mtcars) # create linear model
yvals <- model $ coefficients['hp'] * mtcars $ hp + 
model $ coefficients['(Intercept)'] #determine y axis values from linear model

# Once we have calculated our line plot data points, we can plot the linear model over our scatter plot:
plt <- ggplot(mtcars, aes(x = hp, y = qsec)) # import dataset into ggplot
plt + geom_point() + geom_line(aes(y = yvals), color = "red") # plot scatter and linear model



### multiple linear regression

# multiple linear regression equation becomes y = m1x1 + m2x2 + … + mnxn + b, for all independent x variables and their m coefficients
# qsec = dependent variable
# hp = 1st independent var, not enough to predict qsec, the r sq was .5 (basically 50/50)
# mpg, disp, drat, wt will be addeded to the model 

# model:
lm(qsec ~ mpg + disp + drat + wt + hp, data = mtcars) # generate multiple linear regression model

summary(lm(qsec ~ mpg + disp + drat + wt + hp, data = mtcars)) #generate summary

# When an intercept is statistically significant, it means there are other variables and factors that contribute to the variation in quarter-mile time (dependent var) that have not been included in our model.












