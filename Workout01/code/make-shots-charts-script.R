#title:4) Shot Charts
#description: Analysis on basketball players performance by using raw of each Sate Warior player and making a shot chart
#input(s): The inputs required by the script are the raw data CSV files. One is avaliable for each player and there is an image of NBA court
#output(s): The outputs created when running the script are the shot charts for each player

library(ggplot2)
library(grid)
library(jpeg)

#4.1) Shot charts of each player
klay_scatterplot<- ggplot(data = klay) + 
  geom_point(aes(x=x,y=y, color = shot_made_flag))
klay_scatterplot

court_file <- "../images/nba-court.jpg"

court_image<- rasterGrob(
              readJPEG(court_file), 
              width = unit(1,"npc"),
              height = unit(1,"npc"))


klay_shot_chart <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Klay Thompson') +
  theme_minimal()
klay_shot_chart

ggsave("../images/klay-thompson-shot-chart.pdf", 
       plot = last_plot(),
       height = 5,
       width = 6.5,
       units = "in")


curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Stephen Curry') +
  theme_minimal()
curry_shot_chart

ggsave("../images/stephen-curry-shot-chart.pdf", 
       plot = last_plot(),
       height = 5,
       width = 6.5,
       units = "in")


green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Draymond Green') +
  theme_minimal()
green_shot_chart

ggsave("../images/draymond-green-shot-chart.pdf", 
       plot = last_plot(),
       height = 5,
       width = 6.5,
       units = "in")


durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Kevin Durant') +
  theme_minimal()
durant_shot_chart

ggsave("../images/kevin-durant-shot-chart.pdf", 
       plot = last_plot(),
       height = 5,
       width = 6.5,
       units = "in")

iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Andre Iguodala') +
  theme_minimal()
iguodala_shot_chart

ggsave("../images/andre-iguodala-shot-chart.pdf", 
       plot = last_plot(),
       height = 5,
       width = 6.5,
       units = "in")



#4.2) Facetted Shot Chart
gsw_shots_chart <- ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('GSW Shots Chart') +
  facet_wrap(~ player) +
  theme_minimal()
gsw_shots_chart

ggsave("../images/gsw-shot-charts.pdf", 
       plot = last_plot(),
       height = 7,
       width = 8,
       units = "in")

gsw_shots_chart
ggsave("../images/gsw-shot-charts.png", 
       plot = last_plot(),
       height = 7,
       width = 8,
       units = "in")

