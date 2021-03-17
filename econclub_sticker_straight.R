#if reworking design, it may be necessary to rewrite sticker function. For some reason it doesn't recognize the font

library(tidyverse)
library(hexSticker)
library(sysfonts)

font_add_google("IBM Plex Sans")

df <- tribble(~type, ~x, ~y,
              "supply", 1, 50,
              "supply", 20, 10,
              "demand", 1, 10,
              "demand", 20, 50)

p <- df %>% 
  ggplot(aes(x = x, y = y, group = type))+
  geom_line(aes(color = type))+
  geom_point(x = 10.5, y = 30, color = "black", size = .8)+
  scale_color_manual(values = c("red", "blue"))+
  geom_segment(x = 10.5, y = 0, xend = 10.5, yend = 30, linetype = "dashed")+
  geom_segment(x = 0, y = 30, xend = 10.5, yend = 30, linetype = "dashed")+
  theme_classic()+
  theme(legend.position = "none",
        axis.text = element_blank(),
        axis.ticks = element_blank())+
  labs(x = NULL,
       y = NULL)+
  theme_transparent()
        
sticker(p, package = "GVSU Economics Club", s_x = .97, s_y = .8, s_width = 1.1, s_height = 1.1, 
        p_family = "IBM Plex Sans", p_size = 12, p_color = "black",
        h_color = "#0065a4", h_fill = "#c1c9c4",
        url = "gvsueconclub.com", u_size = 4, u_family = "IBM Plex Sans", filename = "econclubstraight.png")
