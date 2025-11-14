 # hello!!!
# this is a fork test
# testing
#first small script
library(palmerpenguins)
library(dplyr)
library(ggplot2)
theme_set(theme_minimal())

## Count penguins for each species / island
num_penguins <- ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(alpha = 0.8) +
  scale_fill_manual(values = c("darkorange","purple","cyan4"), 
                    guide = FALSE) +
  theme_minimal() +
  facet_wrap(~species, ncol = 1) +
  coord_flip()
num_penguins

## Scatterplot: penguin flipper length versus body mass
scatterplot_penguins <- ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, 
                 shape = species),
             size = 2) +
  scale_color_manual(values = c("darkorange","darkorchid","cyan4")) 
scatterplot_penguins

## fun plot new version
penguins %>%
  select(species, body_mass_g, ends_with("_mm")) %>% 
  GGally::ggpairs(aes(color = species)) +
  scale_colour_manual(values = c("darkorange","purple","cyan4")) +
  scale_fill_manual(values = c("darkorange","purple","cyan4"))