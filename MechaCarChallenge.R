library(dplyr)
library(jsonlite)
library(tidyverse)

## Deliverable 1

# read in the dataset
mehcacar <- read.csv("MechaCar_mpg.csv")


# create the multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mehcacar)

#gives us the line:
# mpg = 6.267 vehicle length + 0.00124 vehicle weight + 0.06877 spoiler angle + 3.546 ground clearance + -3.411 AWD + -0.0104

#get the summary stats of the model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mehcacar))

# A very small p-value means that such an extreme observed outcome would be very unlikely under the null hypothesis

#hypotheses: 

# H0 : The slope of the linear model is zero, or m = 0

# Ha : The slope of the linear model is not zero, or m ≠ 0

## deliverable 2
sustable <- read.csv("Suspension_Coil.csv")

total_summary <- sustable %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

head(total_summary)

div_summary <- sustable %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = "keep")

head(div_summary)


## Deliverable 3
#lots as a whole
t.test(sustable $ PSI, mu = 1500)

# subsets
lot1 <- subset(sustable, Manufacturing_Lot == "Lot1")
lot2 <- subset(sustable, Manufacturing_Lot == "Lot2")
lot3 <- subset(sustable, Manufacturing_Lot == "Lot3")

#individual lot t-tests
t.test(lot1 $ PSI, mu = 1500)
# data:  lot1$PSI
# t = 0, df = 49, p-value = 1
t.test(lot2 $ PSI, mu = 1500)
# data:  lot2$PSI
# t = 0.51745, df = 49, p-value = 0.6072
t.test(lot3 $ PSI, mu = 1500)
# data:  lot3$PSI
# t = -2.0916, df = 49, p-value = 0.04168

meantotal<-mean(sustable $ PSI)
meantotal
