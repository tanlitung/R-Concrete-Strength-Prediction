library(neuralnet)#install neuralnet library for ANN --> install.packages("neuralnet")

concrete <- read.csv("concrete.csv")#load dataset
str(concrete)


#Nomalize the data (compute the data to be in the range of 0 to 1)
normalized <- function(x){
  return ((x-min(x))/(max(x) - min(x)))
}

concrete_norm <- as.data.frame(lapply(concrete, normalize))

#Data (1-700) is used for training and the remaining data is used for testing
#Be careful for this step becasue overfitting can occur easily
concrete_train <- concrete_norm[1:700,]
concrete_test <- concrete_norm[701:1030,]

#building ANN model with 1 hidden node
concrete_model <- neuralnet(strength ~ cement + slag+ ash + water + superplastic + coarseagg + fineagg + age, data = concrete_train)
plot(concrete_model)#visualize the ANN model with one hidden node

#predict on the test dataset
model_results <- compute(concrete_model, concrete_test[1:8])
predicted_strength <- model_results$net.result#assign the net.result into predicted strength
cor(predicted_strength, concrete_test$strength)#see how close the actual values and predicted values are
saveRDS(concrete_model,"model_1_hidden.rds")

#building ANN model with 5 hidden nodes (you can change the hidden value, I used 5 because it gives me the best accuracy)
concrete_model2 <- neuralnet(strength ~ cement + slag+ ash + water + superplastic + coarseagg + fineagg + age, data = concrete_train, hidden = 5)
plot(concrete_model2)

#predict on the test dataset
model_results2 <- compute(concrete_model2, concrete_test[1:8])
predicted_strength2 <- model_results2$net.result
cor(predicted_strength2, concrete_test$strength)
saveRDS(concrete_model,"model_5_hidden.rds")

#plot the actual strength and predicted strength
plot(predicted_strength2, type = "o", col = "red", xlim = c(0,100),ylim = c(0,1.2))
lines(concrete_test$strength, type = "o", col = "blue", xlim = c(0,100),ylim = c(0,1.2))
legend("topleft", c("Actual", "Predicted"), col = c("blue", "red"), lty = 1)