setwd("Ch2_DataHandlingAndGraph/")

#usring par()function
par(
  mfrow = c(2,2), #layout matrix, fill by row
  mai = c(0.4, 0.4, 0.3, 0.1), #margin size c(bottom, left, top, right)
  cex = 0.8, #set relative size
  cex.main = 1, #main title = 1
  font.main = 1 #1 = plain text
)

set.seed(123)

x = rnorm(100)
y = rexp(100)

#plotting
plot(
  x,y,
  col = sample(c("black","red","blue"), 100, replace = TRUE),
  main = "(a) Scatter Plot"
)

boxplot(
  x,y,
  col = 2:3,
  main = "(b) Boxplot"
)

hist(
  x,
  col = "orange1",
  ylab = "y",
  main = "(c) Histogram"
)

barplot(
  runif(5,10,20),
  col = 2:6,
  main = "(d) Barplot"
)


#Using layout function
n = 100
set.seed(12); x = rnorm(n); y = rexp(n)
layout(
  matrix(c(1,1,2,3,4,4,5,5,6,7,7,8), nrow = 3, ncol = 4, byrow = TRUE),
  widths = c(1:1),
  heights = c(1:1)
)
par(
  mai = c(0.3, 0.3, 0.3, 0.1),
  cex.main = 1.2,
  font.main = 1
)

barplot(
  runif(8,1,8),
  names = LETTERS[1:8],
  col = 2:7,
  main = "(1) Barplot"
)

pie(
  x = 1:12,
  col = 1:12,
  labels = "",
  border = NA,
  main = "(2) Piechart"
)

qqnorm(
  y = y,
  col = 1:7,
  pch = 19,
  xlab = "",
  ylab = "",
  main = "(3) QQ normogram"
)

plot(
  x,y,
  pch = 19, #plotting characters
  col = c(1,2,4),
  xlab = "", ylab = "",
  main = "(4) Scatter Plot"
)

plot(
  x = rnorm(25), y = rnorm(25),
  cex = (y+2),  #size of each point variates with y value
  col = 2:4,
  lwd = 2,
  xlab = "",
  ylab = "",
  main = "(5) Bubble Plot"
)

hist(
  rnorm(1000),
  col = 4,
  xlab = "",
  ylab = "",
  main = "(6) Histogram"
)

plot(
  density(y),
  col = 4,
  lwd = 1,
  xlab = "",
  ylab = "",
  main = "(7) Kernel Density Estimation"
)
polygon( #add polygon to the density graph
  density(y),
  col = "gold",
  border = "blue"
)

boxplot(
  x = x,
  col = 2,
  main = ("8 Boxplot")
)








