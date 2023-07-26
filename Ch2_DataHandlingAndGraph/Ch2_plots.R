##Basic drawing
#my first graph


par(
  mai = c(0.6,0.6,0.4,0.4), #set margin size
  cex = 0.7 #relative sizes of texts and symbols
)

set.seed(2025) #set random seed
x = rnorm(200) #generate 200 x random values
y = 1+2*x + rnorm(200) #200 y values
d = data.frame(x,y)

plot(
  d, #input data 
  xlab = "x=自变量", #set x label
  ylab = "y=因变量" #set y label
)
grid(col = "grey60") #add grid, with col specifying the color
axis(
  side = 4, #location of the new axis 1=below, 2=left, 3=above and 4=right
  col.ticks = "blue", #ticks color
  lty = 1 #line type for both the axis line and the tick marks.
)
polygon(
  d[chull(d),], #find the outer-most points
  lty = 6, #set line type
  lwd = 1, #set line width
  col = "lightgreen" #set color
)
points(d) #reprint dots
points(
  mean(x),mean(y), #draw the average point
  pch = 10, #ploting character -> graphic symbol
  cex=5, #size
  col = "red" #color
)
abline( #add horizontal and vertical lines for the avg point
  v = mean(x), 
  h = mean(y),
  lty = 2,
  col="gray30"
)
abline( #add linear regression line
  lm(y~x),
  lwd=2,
  col=2
)
lines(
  lowess(y~x,f=1/6), #add polynomial regression line
  col = 4,
  lwd = 2,
  lty = 6
)
segments( #add line segment
  -0.8,0, #start coordinate
  -1.6,3.3, #end coordinate
  lty = 6,
  col = "blue"
)
text( #add text
  -2.2,3.5, #coordinate
  labels = expression("拟合的曲线"),
  adj = c(-0.1,0.02), #positional adjustment 0 for left/bottom 1 for r/top
  col = 4
)
arrows( #add arrow
  0.8,-2.6,
  -0.8,-0.6,
  code = 2,
  angle = 25,
  length = 0.06,
  col = 2
)
rect(0.6,-2.2,1.8,-3.6,col = "pink",border = "grey60")
mtext(
  text = expression(hat(y)==hat(beta)[0]+hat(beta)[1]*x),
  cex = 0.9,
  side = 1,
  line = -2.5,
  adj = 0.7
)
title("散点图及拟合直线和曲线\n并为图形添加新的元素",
  cex.main=1,
  font.main=4
)
box(col=4,lwd=2)
legend(
  "topleft",
  legend = c("拟合的直线", "拟合的曲线"),
  lty = c(1,6),
  col = c(2,4),
  cex = 0.8,
  fill = c("red", "blue"),
  box.col = "grey60",
  ncol = 1,
  inset = 0.02
)

#Color palettes
library(RColorBrewer)
par(mfrow=c(2,3),
    mai = c(0.4, 0.3, 0.3, 0.1),
    cex = 0.7,
    font.main = 1
)
palette1 = brewer.pal(7, "Reds") #7 continuous red
palette2 = brewer.pal(7, "Set1") #7 discrete colors
palette3 = brewer.pal(7, "RdBu") #7 Red to blue continuous color
palette4 = rev(brewer.pal(7, "Greens")) #reverse palette colors
palette5 = brewer.pal(8, "Spectral")[-1] #drop the first color, keep the 7 rests
palette6 = brewer.pal(6, "RdYlBu")[2:4] #use the 2nd to 4th colors

h = 1:7; names = LETTERS[1:7]
barplot(
  h,
  names = names,
  col = palette1,
  main = "(A) 7 continuous red"
)
barplot(
  h,
  names = names,
  col = palette2,
  main = "(B) 7 discrete colors"
)
barplot(
  h, names = names,
  col = palette3,
  main = "(C) 7 Red to Blue continuous color"
)
barplot(
  h, names = names,
  col = palette4,
  main = "(D) Reverse palette colors"
)
barplot(
  h, names = names,
  col = palette5,
  main = "(E) remove the first color"
)
barplot(
  h, names = names,
  col = palette6,
  main = "(F) use colors 2:4"
)
