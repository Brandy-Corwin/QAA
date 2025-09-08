library(tidyverse)

for1 = read.csv("CcoxCrh_comrhy59_EO_6cm_1_htseqcounts_forstranded.txt", header = FALSE, sep = "\t")
rev1 = read.csv("CcoxCrh_comrhy59_EO_6cm_1_htseqcounts_revstranded.txt", header = FALSE, sep = "\t")

for2 = read.csv("CcoxCrh_comrhy113_EO_adult_2_htseqcounts_forstranded.txt", header = FALSE, sep = "\t")
rev2 = read.csv("CcoxCrh_comrhy113_EO_adult_2_htseqcounts_revstranded.txt", header = FALSE, sep = "\t")

data1 = full_join(for1, rev1, by = "V1") |>
  rename(forward = V2.x, reverse = V2.y)

data2 = full_join(for2, rev2, by = "V1") |>
  rename(forward = V2.x, reverse = V2.y)

ggplot(data1, aes(x = forward, y = reverse)) +
  geom_point()
ggsave("CcoxCrh_comrhy59_EO_6cm_1_strandedness.png")

ggplot(data2, aes(x = forward, y = reverse)) +
  geom_point()
ggsave("CcoxCrh_comrhy113_EO_adult_2_strandedness.png")