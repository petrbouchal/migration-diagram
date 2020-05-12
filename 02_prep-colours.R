library(tidyverse)

colors <- list(yellow = c(220, 180, 6),
               orange = c(228, 112, 29),
               wine = c(164, 0, 71),
               brown = c(133, 57, 70),
               purple = c(92, 42, 71),
               blue_light = c(20, 126, 200),
               blue_dark = c(15, 75, 125),
               green = c(19, 122, 103),
               yellow_l = c(239, 217, 131),
               orange_l = c(242, 185, 142),
               wine_l = c(209, 130, 162),
               brown_l = c(193, 156, 163),
               purple_l = c(173, 149, 163),
               blue_light_l = c(135, 165, 191),
               blue_dark_l = c(137, 191, 227),
               green_l = c(137, 188, 179)
)

library(magrittr)
library(prismatic)

colors_df <- as.data.frame(colors) %>%
  t() %>%
  as.data.frame() %>%
  rownames_to_column() %>%
  set_names(c("name", "r", "g", "b")) %>%
  mutate(hex = rgb(r, g, b, maxColorValue = 255))

cols <- colors_df$hex
names(cols) <- colors_df$name
cols_obj <- color(cols)
names(cols_obj) <- colors_df$name
