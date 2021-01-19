#viz the dist of weights in the built in mtcars dataset
ggplot(mtcars, aes(x=wt)) +geom_density()



?shapiro.test

shapiro.test(mtcars$wt)

?sample()

#import used car dataset
population_table <- read.csv("01_demo/used_car_data.csv", check.names = F, stringsAsFactors = F)
# import dataset into ggplot converting to log10
plt <- ggplot(population_table, aes(x = log10(Miles_Driven)))
# import dataset w/o converting to log10 -> has long ass right tail due to a few cars with >1000000 miles 
plt <- ggplot(population_table, aes(x = Miles_Driven))
# viz dist using density plot
plt +geom_density()


#randomly sample 50 data points
sample_table <- population_table %>% sample_n(50)
#import dataset into ggplot2
plt <- ggplot(sample_table, aes(x=log10(Miles_Driven)))
#visualize distribution using density plot
plt + geom_density()


?t.test()

t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) #compare sample versus population means

#generate 50 randomly sampled data points
sample_table <- population_table %>% sample_n(50) 
#generate another 50 randomly sampled data points
sample_table2 <- population_table %>% sample_n(50)

#compare means of two samples
t.test(log10(sample_table$Miles_Driven), log10(sample_table2$Miles_Driven))

#import dataset
mpg_data <- read.csv("01_demo/mpg_modified.csv")
#select only data points where year is 1999
mpg_1999 <- mpg_data %>% filter(year == 1999)
#select only data points where year is 2008
mpg_2008 <- mpg_data %>% filter (year == 2008)

#compare the mean differences between the two samples
t.test(mpg_1999$hwy, mpg_2008$hwy, paired = T)


?aov

#filter columns from mtcars dataset
mtcars_filt <- mtcars[, c('hp', 'cyl')]
#convert numeric column to factor
mtcars_filt$cyl <- factor(mtcars_filt$cyl)


# anova - we’ll use the formula Y ~ A or Y ~ A + B where Y is the column name of the dependent variable, and A and B are the column names of the independent variables.
aov(hp ~ cyl, data = mtcars_filt) # does not return p-value

summary(aov(hp ~ cyl, data = mtcars_filt))


