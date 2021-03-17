#if reworking design, it may be necessary to rewrite sticker function. For some reason it doesn't recognize the font

library(tidyverse)
library(hexSticker)
library(sysfonts)

font_add_google("IBM Plex Sans")

df = tibble(x = 1:10)

p <- ggplot(data = df)+
  geom_curve(aes(x = 1, y = 50, xend = 20, yend = 10), curvature = .2, color = "blue")+
  geom_curve(aes(x = 1, y = 10, xend = 20, yend = 50), curvature = .2, color = "red")+
  geom_point(aes(x = 10.5, y = 22), size = .8)+
  geom_segment(aes(x = 10.5, y = 0, xend = 10.5, yend = 22), color = "black", linetype = "dashed")+
  geom_segment(aes(x = 1, y = 22, xend = 10.5, yend = 22), color = "black", linetype = "dashed")+
  scale_x_continuous(limits = c(1, 20), expand = c(0,0))+
  scale_y_continuous(limits = c(0,51), expand = c(0,0))+
  theme_classic()+
  theme(axis.text = element_blank(),
        axis.ticks = element_blank())+
  labs(x = NULL,
       y = NULL)+
  theme_transparent()

sticker(p, package = "GVSU Economics Club", s_x = .97, s_y = .8, s_width = 1.1, s_height = 1.1,
        p_family = "IBM Plex Sans", p_size = 12, p_color = "black",
        h_color = "#0065a4", h_fill = "#c1c9c4", 
        url = "gvsueconclub.com", u_size = 4, u_family = "IBM Plex Sans", filename = "econclubcurve.png")
