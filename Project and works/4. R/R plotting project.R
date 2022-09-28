

##Importing dataset
cpi<- read.csv("F:\\Codes\\CPI_for_Agricultural_Labourer.csv")

head(cpi)

##### Datapreprocessing #####

#Changing the format of Month..Year column to DATE format
library(zoo)
cpi$Month..Year = as.Date(as.yearmon(cpi$Month..Year))

#Using colnames to change the name of the column 
colnames(cpi) <- c('Month_Year', 'General_index', 'Food_grp_index', 
                   'Fuel_light_index','Clothing_footwear_index',
                   'Intoxicants_index', 'Miscellaneous_group') 

#Calling as.numeric function to change the format from character to numeric
col.num <- c('Food_grp_index', 'Fuel_light_index','Clothing_footwear_index', 
             'Intoxicants_index', 'Miscellaneous_group')

cpi[col.num] <- sapply(cpi[col.num],as.numeric)

summary(cpi)

#Removing Null Values
cpi <- na.omit(cpi)


#### ScatterPlot #####

#Plotting General index with Year in X axis
plot(cpi$General_index ~ cpi$Month_Year, 
     main='General Price Index',lwd=2,
     xlab="Year" , ylab='General index')

#Plotting Food group index with Year in X axis
par(mfrow=c(1,4))
plot(cpi$Food_grp_index ~ cpi$Month_Year, type="l",
     main="Food group index", lwd = 2,
     xlab="Year", ylab="Food grp index", col ="green",las=2)
grid()

plot(cpi$Fuel_light_index ~ cpi$Month_Year, type="s",
     main="Fuel Light Index", lwd = 2,
     xlab="Year", ylab="Fuel Light Index", col ="violet" ,las=2)

plot(cpi$Clothing_footwear_index ~ cpi$Month_Year, type="o",
     main="Clothing Footwear Index", lwd = 2,
     xlab="Year", ylab="Clothing Footwear Index", col ="blue" ,las=2)

plot(cpi$Intoxicants_index ~ cpi$Month_Year, type="s",
     main="Intoxicants Index", lwd = 2,
     xlab="Year", ylab="Intoxicants Index", col ="orange" ,las=2)

plot(cpi$Miscellaneous_group ~ cpi$Month_Year, type="l",
     main="Miscellaneous Index", lwd = 2,
     xlab="Year", ylab="Miscellaneous Index", col ="black" ,las=2)


#Plotting multiple index with Year in X axis in single plot
plot(cpi$General_index ~ cpi$Month_Year,type="l",
     main='Indices',lwd = 3,
     xlab="years", ylab='Index value', col= "maroon")
lines(cpi$Food_grp_index ~ cpi$Month_Year, 
      col = 'gray', lwd =2,lty=5)
lines(cpi$Fuel_light_index ~ cpi$Month_Year,
      col="pink",lwd=2,lty=2)
lines(cpi$Clothing_footwear_index ~ cpi$Month_Year,
      col="yellow",lwd=2,lty=4)
lines(cpi$Intoxicants_index ~ cpi$Month_Year,
      col="black",lwd=2,lty=6)
lines(cpi$Miscellaneous_group ~ cpi$Month_Year,
      col="blue",lwd=2,lty=7)

legend("topleft", 
       legend = c("General index", 
                  "Food grp index",
                  "Fuel light index",
                  "Clothing footwear index",
                  "Intoxicants index",
                  "Miscellaneous index"),
       col=c("maroon", "gray", "pink","yellow","black","blue"),
       lty=c(1,3),cex=0.5)

# rescaling the plots
max(cpi$Intoxicants_index)
min(cpi$Fuel_light_index)

plot(cpi$General_index ~ cpi$Month_Year,type="l",
     main='Indices',lwd = 3, ylim =c(200,2000),
     xlab="years", ylab='Index value', col= "maroon")
lines(cpi$Food_grp_index ~ cpi$Month_Year, 
      col = 'gray', lwd =2,lty=5)
lines(cpi$Fuel_light_index ~ cpi$Month_Year,
      col="pink",lwd=2,lty=2)
lines(cpi$Clothing_footwear_index ~ cpi$Month_Year,
      col="yellow",lwd=2,lty=4)
lines(cpi$Intoxicants_index ~ cpi$Month_Year,
      col="black",lwd=2,lty=7)
lines(cpi$Miscellaneous_group ~ cpi$Month_Year,
      col="blue",lwd=2,lty=6)



legend("topleft", 
       legend = c("General index", 
                  "Food grp index",
                  "Fuel light index",
                  "Clothing footwear index",
                  "Intoxicants index",
                  "Miscellaneous index"),
       col=c("maroon", "gray", "pink","yellow","black","blue"),
       lty=c(1,3),cex=0.5)

#### Barplot ####
#Plotting mean of indexes in barplot
cpi_mean = c(mean(cpi$General_index),
             mean(cpi$Food_grp_index),
             mean(cpi$Fuel_light_index),
             mean(cpi$Clothing_footwear_index),
             mean(cpi$Intoxicants_index),
             mean(cpi$Miscellaneous_group))
barplot(cpi_mean,names =c("General", "Food grp", "Fuel light", 
                          "Clothing", "Intoxicants","Misc"),
        main="Average Index", ylab = "Index value",las=2)

#plotting by descending order
index = c('General', 'Food', 'Fuel light',
          'Clothing', 'Intoxicants',
          'Misc')
mean_cpi_df =data.frame(index,cpi_mean)
mean_cpi_df_asc <- mean_cpi[order(mean_cpi$mean),]
xx=barplot(mean_cpi_asc$mean,
           names.arg = mean_cpi_asc$index,
           main="Average Index", ylab = "Index value",ylim =c(0,850),
           col=c("maroon", "gray", "pink","yellow","black","blue"))
text(x = xx, y = mean_cpi_df_asc$mean, label = mean_cpi_df_asc$mean, pos=3,col = "black")

#### boxplot ####
#Plotting two boxplots in single row
par(mfrow=c(1,2))
boxplot(cpi$General_index,
        xlab ="General Index", ylab= "Index value", main="Boxplot",col="maroon")
boxplot(cpi$Food_grp_index,
        xlab="Food group Index", ylab= "Index value", main="Boxplot",col="grey")
boxplot(cpi$Intoxicants_index,
        xlab ="Intoxicants", ylab= "Index value", main="Boxplot",col="pink")
boxplot(cpi$Fuel_light_index,
        xlab ="Fuel light index", ylab= "Index value", main="Boxplot",col="yellow")
boxplot(cpi$Clothing_footwear_index,
        xlab ="Clothing footwear index", ylab= "Index value", main="Boxplot",col="black")
boxplot(cpi$Miscellaneous_group, 
        xlab ="Miscellaneos group", ylab= "Index value", main="Boxplot",col="blue")

