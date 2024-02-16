#Loading Dataset
dataset = read.csv("Walmart.csv")
#install.packages("caTools")

#Dropping unnecessary rows which won't help in predicting the weekly sales
df = subset(dataset, select = -c(Date))

#Splitting df into training and testing set
library(caTools)
split = sample.split(df$Weekly_Sales, SplitRatio = 0.8)
print(split)

training_set = subset(df, split== TRUE)
test_set = subset(df, split == FALSE)

#Fitting the Multiple Linear Regression Model using the training set
regressor = lm(formula = Weekly_Sales ~ ., data = training_set)
print(regressor)

# Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)

print(y_pred)

#Visualization
#install.packages("car")
library(car)
avPlots(regressor)
