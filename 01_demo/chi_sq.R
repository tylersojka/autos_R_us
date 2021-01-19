library(jsonlite)
library(tidyverse)
?chisq.test()

# The chi-squared test is used to compare the distribution of frequencies across two groups and tests the following hypotheses:

# H0 : There is no difference in frequency distribution between both groups.

# Ha : There is a difference in frequency distribution between both groups

# A contingency table is another name for a frequency table produced using R's table() function.

table(mpg $ class, mpg $ year) # generate contingency table

?table

tbl <- table(mpg $ class, mpg $ year) # generate the contingency table
chisq.test(tbl) # compare categorical distributions

# gives us a p value of .9836 which is well above our sig level of .05  Therefore, we would state that there is not enough evidence to reject the null hypothesis, and there is no difference in the distribution of vehicle class across 1999 and 2008 from the mpg dataset.

# df = degrees of freedom n or n-1 samples 
