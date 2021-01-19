# autos_R_us

![mechcar](images/cyber_truck.jpg)
*****
*****

* By: Tyler Sojka
* December 2020
* Statistics and R: Using R to preform various statistical tests.
  
*****
*****

## Tools

* RStudio
  * RStudio is an integrated development environment for R, a programming language for statistical computing and graphics

* Tidyverse
  * The tidyverse is an opinionated collection of R packages designed for data science. All packages share an underlying design philosophy, grammar, and data structures.

* ggplot
  * ggplot2 is a system for declaratively creating graphics, based on The Grammar of Graphics. You provide the data, tell ggplot2 how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details.

* dplyr
  * dplyr provides a grammar of data manipulation, providing a consistent set of verbs that solve the most common data manipulation challenges.

## Overview

The purpose of this project was to gain an introduction to the programming language R, and various statistical concepts including: chi square, regression, variability, t-tests, and anova. We applied (some) these concepts to a terribly written "mecha car" analysis. We were tasked with the following:
* Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes

* Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots

* Run t-tests to determine if the manufacturing lots are statistically different from the mean population

* Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. 

## Linear Regression to Predict MPG

We used multiple linear regression to create a model to predict vehicle mpg using several different variables: vehicle length, vehicle weight, spoiler angle, ground clearance and AWD.

![regmodel](images/Screen%20Shot%202021-01-02%20at%208.57.58%20AM.png)

Using the regression coefficients returned from this function gives us this model:
mpg = 6.267 vehicle length + 0.00124 vehicle weight + 0.06877 spoiler angle + 3.546 ground clearance + -3.411 AWD + -0.0104

Using the summary function on our model gives us:
![regsummary](images/Screen%20Shot%202021-01-02%20at%208.57.45%20AM.png)


R-squared value is a statistical measure that represents the proportion of the variance for a dependent variable that's explained by an independent variable or variables in a regression model. For example, if the r-sq of a model is 0.50, then approximately half of the observed variation can be explained by the models imputs.

In our model the r-sq is 0.7149, which lets us know that about 70% of the data variance can be attributed to our inputs, which leaves about 30% not accounted for in our model. This model <i> could </i> be useful in predicting the mpg of prototype cars, but a model that takes in account the variables representing the 30% of variability our model lacks, would be better.

<b>Regression coefficients</b> are estimates of the unknown population (a car we wish to predict mpg for using this model) parameters and describe the relationship between a <b>predictor variable</b> (independent variables, in our case vehicle length, vehicle weight, spoiler angle, ground clearance and AWD) and the <b>response</b> (dependent variable, in our case the mpg). In linear regression, coefficients are the values that multiply the predictor values. In our model mpg is our response, vehicle length is one of the 5 predictor variables, preceding each predictor variable is the regression coefficient.

In our model, the variables that contributed statistically meaningful / a non random amount of variance to the mpg are: vehicle length with a p-value of 5.08e-08, and ground clearance with a p-value of 5.12e-08. The intercept p-value is also very small / meaningful, indicating that there are unknown variables that contribute a large amount of variation. 

<b>P-values</b> help determine whether the relationships that you observe in your sample also exist in the larger population. The p-value for each independent variable tests the null hypothesis that the variable has no correlation with the dependent variable. If there is no correlation, there is no association between the changes in the independent variable and the shifts in the dependent variable. In other words, there is insufficient evidence to conclude that there is effect at the population level. If the p-value for a variable is less than your significance level, your sample data provide enough evidence to reject the null hypothesis for the entire population.

Null hypothesis / H0 : The slope of the linear model is zero, or m = 0

Alternate hypothesis / Ha : The slope of the linear model is not zero, or m ≠ 0

Given the standard level of significance of 0.05, and our p-value of 5.35e-11, we have enough evidence to reject our null hypothesis of the slope of our linear model being zero.

## Summary Statistics on Suspension Coils

Given the design specifications for the MechaCar suspension coils dictating that the variance of the suspension coils must no exceed 100 pounds per square inch, lots 1 and 2 meet the specifications with their variance of .0980 and 7.47 psi respectively. Lot 3 on the other hand, with its variance of 170, does not meet the specifications. As a whole, the manufacturing is within specifications. Combined, all 3 lots have a variance of 62.3 psi, which is below the specified 100,

## T-Tests on Suspension Coils

t-test hypotheses:
H0 : There is no statistical difference between the observed sample mean and its presumed population mean.
Ha : There is a statistical difference between the observed sample mean and its presumed population mean.

As a whole, the statistical difference between the sample and its presumed population mean of 1500, is not significant. As a whole, the p-value is .06 which is higher than our 0.05 significance level, which is not enough evidence to reject our null hypothesis of there being no statistical difference between the observed sample mean and its presumed population mean. 

Lot 1: p-value = 1
Meaning that there is not enough evidence to reject the null hypothesis of there being no statistical difference between the observed sample mean and its presumed population mean.

Lot 2: p-value = 0.6072
Meaning that there is not enough evidence to reject the null hypothesis of there being no statistical difference between the observed sample mean and its presumed population mean.

Lot 3: p-value = 0.04168
Meaning that there is enough evidence to reject the null hypothesis of there being no statistical difference between the observed sample mean and its presumed population mean.

## Study Design: MechaCar vs Competition

A consumer desired study between Mechacar and its competition would include, the cost of the car, the miles per gallon comparison and horsepower. The null hypothesis would be that there is no difference between these metrics and the same metrics of the competition. A good statistical test to compare the two companies would be a t-test to compare the averages in each metric. The data needed for these tests would be data on the mpg, horsepower and cost for each of the cars, for each company. 
