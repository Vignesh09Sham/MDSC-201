#Question 1 
#a. Find the Correlation Coefficient between the dependent and the independent variable

#`Importing dataset
dataset1 = read.csv("songs.csv")

correlation_coeff = cor(dataset1$Months, dataset1$Songs)
print(correlation_coeff)

#c. Using R Studio, fit the obtained line equation on the Scatter plot of the data
#install.packages("ggplot2")
library(ggplot2)
ggplot() + 
  geom_point(aes(x= dataset1$Months, 
                 y = dataset1$Songs),
             colour = "red") +
  geom_abline(intercept = -12.8872884911201, slope = 21.1263809257447,linetype = "solid",
            colour = "blue") +
  ggtitle("Songs vs Months") +
  xlab("Months") +
  ylab("Songs")


#Question 2 
#a. Fit the Multiple Linear Regression model on the dataset
dataset2 = read.csv("GRE_Total.csv")

#Fitting the Multiple Linear Regression Model using the training set
regressor = lm(formula = GGPA ~ ., data = dataset2)
print(regressor)

#b. Explicitly print the P Values of the two independent columns in R Studio
summary_stat = summary(regressor)
print(summary_stat)
p_values = summary_stat$coefficients[,4]
print("P-values are:")
print(p_values)

