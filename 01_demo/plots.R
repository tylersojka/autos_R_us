library(jsonlite)
library(tidyverse)
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

#create summary table looking at cyl vs mean mpg of toyota
mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
#import dataset into ggplot2
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy)) 
plt + geom_line() +
  #add line plot with labels
  scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(15:30)) 

#import dataset into ggplot2 scatter of city mpg vs engine displacment
plt <- ggplot(mpg,aes(x=displ,y=cty))
#add scatter plot with labels
plt + geom_point() + xlab("Engine Size (L)") + ylab("City Fuel-Efficiency (MPG)") 

#import dataset into ggplot2 adding color 
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class)) 
#add scatter plot with labels
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class") 

# import dataset into ggplot scatter of city mpg as size of points 
plt <- ggplot(mpg, aes(x=class, y=cty, size=displ, color=displ))
plt + geom_point() + labs(x="Vehicle Class", y="City MPG", size="Engine Size (L)", color="Engine Size (L)")

#boxplots
# viz of hwy fuel eff
# import dataset into ggplot
plt <- ggplot(mpg,aes(y=hwy))
# add boxplot
plt + geom_boxplot()

#import dataset into ggplot2 multiple plots
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy, color=factor(manufacturer))) 
#add boxplot and rotate x-axis labels 45 degrees
plt + geom_boxplot(outlier.color = "red", outlier.shape = 1) + theme(axis.text.x=element_text(angle=45,hjust=1)) 

# average highway fuel efficiency across the type of vehicle class
#create summary table
mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') 
plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))
#create heatmap with labels
plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)") 

#create summary table
mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
#import dataset into ggplot2
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy)) 
#add heatmap with labels 
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)") + 
  #rotate x-axis labels 90 degrees
  theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5)) 

# overlays
#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) 
#add boxplot
 plt + geom_boxplot() + 
 #rotate x-axis labels 45 degrees
 theme(axis.text.x=element_text(angle=45,hjust=1)) + 
 #overlay scatter plot on top
 geom_point() 


 mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") #add scatter plot
 

mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") + #add scatter plot with labels
 geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine)) #overlay with error bars
 
 
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)


mpg_std <-mpg 
 

plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot with labels rotated 45 degrees

 
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + #create multiple boxplots, one for each MPG type
 theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer") #rotate x-axis labels














 
 
 
 
 
 
 