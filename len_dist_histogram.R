library(tidyverse)

data1 <- read.csv("CcoxCrh_comrhy59_EO_6cm_1.tsv", sep = "\t")

data2 <- read.csv("CcoxCrh_comrhy113_EO_adult_2.tsv", sep = "\t")


ggplot(data = data1, aes(x = Length, y = Count, fill = Read)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Length Distribution of CcoxCrh_comrhy59_EO_6cm_1")
ggsave("CcoxCrh_comrhy59_EO_6cm_1_length_distribution.png", width = 8, height = 5)


ggplot(data = data1, aes(x = Length, y = Count, fill = Read)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Length Distribution of CcoxCrh_comrhy113_EO_adult_2")
ggsave("CcoxCrh_comrhy113_EO_adult_2_length_distribution.png", width = 8, height = 5)