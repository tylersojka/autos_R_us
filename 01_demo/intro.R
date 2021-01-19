library(jsonlite)
library(tidyverse)

x <- 3
x <- 5

numlist <- c(0,1,2,3,4,5,6,7,8,9)

?read.csv()

demo_table <- read.csv(file='demo.csv', check.names=F, stringsAsFactors = F)

?fromJSON

demo_table2 <- fromJSON(txt='demo.json')

# select the 3rd row in the 3rd column of demotable2
demo_table2[3,3]

demo_table[3,3]
# same as above but using column name
demo_table[3, 'Year']
# is case sensitive so this doesn't work
demo_table[3, 'year']
# select whole vectors (arrays)
demo_table$Vehicle_Class
#select whole vector then specific value
demo_table$Vehicle_Class[2]

filter_table <- demo_table2[demo_table2$price > 10000, ]

?subset()

#filter by price and drivetrain and clean in title status using subset function
filter_table2 <- subset(demo_table2, price > 10000 & drive == "4wd" & "clean" %in% title_status) 
#filter by price and drivetrain and clean in title status using []'s
filter_table3 <- demo_table2[("clean" %in% demo_table2$title_status) & 
                               (demo_table2$price > 10000) & 
                               (demo_table2$drive == "4wd"),]
?sample
sample(c("cow", "deer", "pig", "chicken", "duck", "sheep", "dog"), 4)

# sampling 2D data structure:
#first capture the number of rows in demo_table in a variable. The nrow() 
# function counts the number of rows in a dataframe.
num_rows <- 1:nrow(demo_table)
#sample 3 of those rows
sample_rows <- sample(num_rows, 3)
# retrieve the requested data within the demo_table
demo_table[sample_rows]

#above in one line
demo_table[sample(1:nrow(demo_table), 3),]

?mutate
#add columns to original data frame
demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) 
#create summary table
summarize_demo <- demo_table2 %>% 
  group_by(condition) %>% 
  summarize(Mean_Mileage=mean(odometer), 
            .groups = 'keep') 
#create summary table with multiple columns
summarize_demo <- demo_table2 %>% 
  group_by(condition) %>% 
  summarize(Mean_Mileage=mean(odometer),
            Maximum_Price=max(price),
            Num_Vehicles=n(), 
            .groups = 'keep') 
?gather


demo_table3 <- read.csv('demo2.csv',check.names = F,stringsAsFactors = F)

# collapsed all of the survey metrics into one Metric column and all of the values into a Score column
long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)
# or
long_table <- demo_table3 %>% gather(key="Metric",value="Score",buying_price:popularity)

?spread
#spread out our previous long-format data frame back to its original format
wide_table <- long_table %>% spread(key="Metric",value="Score")

# check to see if the tables are the same
all.equal(demo_table3, wide_table)

# order the columns in the tables to compare and see if the same as ^
wide_table <- wide_table[, order(colnames(wide_table))]
demo_table3 <- demo_table3[, order(colnames(demo_table3))]

?ggplot

head(mpg)
plt <- ggplot(mpg, aes(x=class)) #import dataset into ggplot2
plt + geom_bar() #plot a bar plot

plt + geom_bar()

#create summary table
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep')
#import dataset into ggplot2
plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count)) 
#plot a bar plot
plt + geom_col() 
#plot bar plot with labels
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") +
  theme(axis.text.x=element_text(angle=45, hjust = 1)) 
