library(circlize)
library(tidyverse)

df <- read_csv2("2015-2017ZMENA.csv")

dfl <- df %>%
  rename(to = DESTINATION) %>%
  pivot_longer(ends_with("CHANGE"), names_to = "from") %>%
  mutate(from = str_remove(from, "_CHANGE") %>%
           str_replace("_", " ")) %>%
  filter(!(from == to), value > 0) %>%
  select(from, to, value)

distinct(dfl, from, to)

circos.clear()
circos.par(start.degree = 90, clock.wise = FALSE)
chordDiagram(df)

chordDiagramFromDataFrame(dfl, directional = 1)

