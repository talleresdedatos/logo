library(tidyverse)
library(ggimage)

angles <- seq(0, 2*pi, length.out = 7)
rotation <- pi/2

hexagon_data <- tibble(
    x = cos(angles+rotation),
    y = sin(angles+rotation)
) 

hex_logo <- hexagon_data %>%
    ggplot(aes(x, y)) +
    geom_polygon(fill = 'palegreen4', color = 'chocolate4', size = 5) +
    geom_image(aes(x = 0, y = 0, image = 'TD-chalk.png'), size = 0.6) +
    theme_void() +
    theme(
        plot.background = element_rect(fill = NA, color = NA), 
    )

size <- function(escala) {
    list(
        width = escala * sqrt(3),
        height = escala * 2
    )
}

plot_size <- size(1600)

ggsave('logo2.png', width = plot_size$width, height = plot_size$height, units = 'px', dpi = 600)


