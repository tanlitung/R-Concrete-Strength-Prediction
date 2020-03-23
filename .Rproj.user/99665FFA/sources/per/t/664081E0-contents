#Nomalize the data (compute the data to be in the range of 0 to 1)
normalized <- function(x){
  return ((x-min(x))/(max(x) - min(x)))
}

#rounding of the normalized data
rounding <- function(x){
  return(round(normalized(x),2))
}

#get accuracy of the ANN Model
getAccuracy <- function(concrete_norm, model_rds){
  concrete_train <- concrete_norm[1:700,]
  concrete_test <- concrete_norm[701:1030,]
  model <- readRDS(model_rds)
  mod_result <- compute(model, concrete_test[1:8])
  pred_strength <- mod_result$net.result
  acc <- cor(pred_strength, concrete_test$strength)
  return(acc)
}

#prediction sets
predsets <- function(concrete_norm, model_rds){
  concrete_train <- concrete_norm[1:700,]
  concrete_test <- concrete_norm[701:1030,]
  model <- readRDS(model_rds)
  mod_result <- compute(model, concrete_test[1:8])
  pred_strength <- mod_result$net.result
  return(pred_strength)
}

