#Loading Dataset
dataset = read.csv("top_100_world_university_2024.csv")

#Dropping irrelevant columns which won't help in predicting
#the overall_score of the universities
df = subset(dataset, select = -c(sequence, rank, university)) 

#Splitting df into training and testing set
library(caTools)
split = sample.split(df$overall_score, SplitRatio = 0.8)
print(split)

training_set = subset(df, split== TRUE)
test_set = subset(df, split == FALSE)

#Fitting the Multiple Linear Regression Model using the training set
regressor = lm(formula = overall_score ~ ., data = training_set)
print(regressor)

# Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)

print(y_pred)

#Visualization
library(car)
avPlots(regressor)