library(ggplot2)
make_age_plot <- function(df) {
    ggplot(data = df, aes(x = player_age, y = age_diff, color = wl))+
    geom_point(alpha = 0.7)+
    scale_color_manual(name = NULL, values = c("W" = "#87CEEB", "L" = "#7B3FA0"), 
                       labels = c("L" = "Match lost", "W" = "Match won"))+
    labs(y = NULL, x = "Player's Age", title = "Player's Professional Matches")+
theme(
        panel.background = element_rect(fill = "white", color = NA),
        plot.background  = element_rect(fill = "white", color = NA),
        axis.ticks.length = unit(0.15, "cm"),
        legend.position = "top",
        axis.title.x = element_text(hjust = 0, color = "grey50", size = 8),
        panel.grid.major.y = element_line(color = "grey70", linetype = "solid", linewidth = 0.3),
        panel.grid.major.x = element_line(color = "grey70", linetype = "solid", linewidth = 0.3),
        plot.title = element_text(family = "serif", face = "bold", size = 10),
        plot.subtitle = element_text(family = "serif", size = 8),
        plot.caption = element_text(family = "serif", size = 8, hjust = 0),
    )+
geom_hline(yintercept=0, alpha = 0.5)+
scale_x_continuous(position = "top", breaks = c(12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44), limits = c(10,50))+
scale_y_continuous(breaks = c(-20, -10, 0, 10, 20), labels = c("Younger than opponent -20", "-10", "Same age", "+10", "+20 years Older than opponent"), limits = c(-20,30))
}