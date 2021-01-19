
# Import the dplyr package
library(dplyr)

# Read the data file
MechaCar_mpg <- read.csv("MechaCar_mpg.csv")

# Get the summary of a linear regression
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, MechaCar_mpg))

# Read the data file
Suspension_Coil <- read.csv("Suspension_Coil.csv")

# Create a summary dataframe for the PSI column
total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# Create a summary dataframe of the PSI column grouped by manufacturing lot
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# Perform a t-Test of PSI for all lots
sample_table <- Suspension_Coil %>% sample_n(50) #randomly sample 50 data points
t.test(sample_table$PSI,mu=mean(Suspension_Coil$PSI)) #compare sample versus population means

# Compare lot versus population means
t.test(subset(Suspension_Coil$PSI, Suspension_Coil$Manufacturing_Lot == "Lot1"), mu=mean(Suspension_Coil$PSI)) 
t.test(subset(Suspension_Coil$PSI, Suspension_Coil$Manufacturing_Lot == "Lot2"), mu=mean(Suspension_Coil$PSI)) 
t.test(subset(Suspension_Coil$PSI, Suspension_Coil$Manufacturing_Lot == "Lot3"), mu=mean(Suspension_Coil$PSI))

