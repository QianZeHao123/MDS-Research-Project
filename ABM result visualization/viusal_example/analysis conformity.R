# summarize Behavior Space simulations across parameter sets
# generate exploratory plots


# clear the environment var area
rm(list = ls())
# clear all plots
graphics.off()
# clear the console area
cat("\014")


library(tidyr)
library(dplyr)
library(ggplot2)

# import
infile <- "./Distribution.csv"
inData <- read.csv(infile, skip = 6, stringsAsFactors = FALSE)
names(inData) <- c("run",
                   "prop.initial",
                   "change.on.tie",
                   "duration",
                   "concentration",
                   "prop.final")

# summarize over simulation set
results <- inData %>%
  group_by(prop.initial) %>%
  summarise(
    runs = n(),
    duration = mean(duration),
    concentration = mean(concentration),
    prop.final = mean(prop.final)
  ) %>%
  ungroup

# line plots of averages
ggplot(results, aes(x = prop.initial, y = prop.final)) +
  geom_line(size = 1.2) +
  ylim(0, 1) +
  labs(x = "Initial Distribution: proportion blue", y = "Final Distribution: proportion blue") +
  theme_bw()

ggplot(results, aes(x = prop.initial, y = concentration)) +
  geom_line(size = 1.2) +
  ylim(0, 1) +
  labs(x = "Initial Distribution: proportion blue", y = "Concentration: Proportion surrounded") +
  theme_bw()

ggplot(results, aes(x = prop.initial, y = duration)) +
  geom_line(size = 1.2) +
  labs(x = "Initial Distribution: proportion blue", y = "Steps to equilibrium") +
  theme_bw()

# scatter plots of individual runs
ggplot(inData, aes(x = prop.initial, y = prop.final)) +
  geom_point() +
  ylim(0, 1) +
  labs(x = "Initial Distribution: proportion blue", y = "Final Distribution: proportion blue") +
  theme_bw()

ggplot(inData, aes(x = prop.initial, y = concentration)) +
  geom_point() +
  ylim(0, 1) +
  labs(x = "Initial Distribution: proportion blue", y = "Concentration: Proportion surrounded") +
  theme_bw()

ggplot(inData, aes(x = prop.initial, y = duration)) +
  geom_point() +
  labs(x = "Initial Distribution: proportion blue", y = "Steps to equilibrium") +
  theme_bw()
