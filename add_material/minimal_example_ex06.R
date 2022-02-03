## Minimal reproducible example: 
# Load packages
library(tidyverse)
library(caret)
library(rsample)
library(patchwork)

# Create random data
df_full   <- tibble(x = seq(1, 25, length.out = 100),
                    y = x * 5 + rnorm(length(x), mean = 0, sd = 25))

# Create test and train set
split     <- initial_split(df_full, prop = 0.7)
df_train  <- training(split)
df_test   <- testing(split)

# Let's look at the splitted data
ggplot() +
    geom_point(data = df_train, aes(x = x, y = y), color = "tomato") +
    geom_point(data = df_test, aes(x = x, y = y), color = "skyblue3")

# Create lm with train set
lm_fit    <- lm(y ~ x, data = df_train)

## Let's analyze the train set:
# Get predictions for train set y
pred_train <- predict(lm_fit, newdata = df_train)

# Compare predictions (modelled values) against train set observations
lm_modobs_train <- lm(df_train$y ~ pred_train)

# Get R^2 from predictions against train set observations
summary(lm_modobs_train)$r.squared

## Let's do the same on the test set:
# Get predictions for test set y
pred_test <- predict(lm_fit, newdata = df_test)

# Compare predictions (modelled values) against test set observations
lm_modobs_test <- lm(df_test$y ~ pred_test)

# Get R^2 from predictions against test set observations
summary(lm_modobs_test)$r.squared

## Plot these two predictions side by side with patchwork
plot_train <- 
    ggplot() +
    geom_point(aes(x = pred_train, y = df_train$y), color = "skyblue3") +
    geom_abline(linetype = "dotted") +
    ylim(0, 150) +
    xlim(0, 150) +
    labs(title = "Train Set",
         subtitle = "R2 = 0.67") # You could also use bquote() for this

plot_test <- 
    ggplot() +
    geom_point(aes(x = pred_test, y = df_test$y), color = "tomato") +
    geom_abline(linetype = "dotted") +
    ylim(0, 150) +
    xlim(0, 150) +
    labs(title = "Test Set",
         subtitle = "R2 = 0.64") # You could also use bquote() for this

plot_train + plot_test

## What's mising now:
# - Get the RMSE between observed and predicted values (see tutorial, or google "get rmse in r")
