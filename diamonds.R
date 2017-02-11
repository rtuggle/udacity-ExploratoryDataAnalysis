head(diamonds)
diamondsByclarity <- diamonds %>%
    group_by(clarity) %>%
    summarise(mean_price = mean(price),
              median_price = median(price),
              min_price = min(price),
              max_price = max(price),
              n = n()) 

byCut <- diamonds %>%
    group_by(cut) %>%
    summarise(mean_price = mean(price),
              median_price = median(price),
              min_price = min(price),
              max_price = max(price),
              n = n()) 

diamonds_by_clarity <- group_by(diamonds, clarity)
diamonds_mp_by_clarity <- summarise(diamonds_by_clarity, mean_price = mean(price))

diamonds_by_color <- group_by(diamonds, color)
diamonds_mp_by_color <- summarise(diamonds_by_color, mean_price = mean(price))

bcl <- ggplot(diamonds_mp_by_clarity,
              aes(x = clarity, y = mean_price)) +
    geom_bar(stat = "identity")

bco <- ggplot(diamonds_mp_by_color,
       aes(x = color, y = mean_price)) +
    geom_bar(stat = "identity")

grid.arrange(bcl, bco, ncol = 2)

ggplot(diamonds,
       aes(x = carat, y = price)) +
    geom_point(aes(colour = color))
