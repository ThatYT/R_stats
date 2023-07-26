setwd("Ch3_DataVisualization/")

example3_1 = read.csv("examples/example3_1.csv"); head(example3_1)

#Generate frequency table
attach(example3_1)
table1 = table(社区); table1
table2 = table(性别); table2
table3 = table(态度); table3

#configure layout
layout(matrix(c(1,2,3,3), 2,2, byrow = TRUE))
par(mai = c(0.6,0.6,0.3,0.1),cex = 0.7, font.main=1)

#plot a horizontal barplot
barplot(
  table2,
  xlab = "人数",
  ylab = "性别",
  horiz = TRUE,
  density = 10, #filling density,
  angle = 60, #angle of the density line
  col = c("grey50", "grey80"),
  border = "black",
  main = "(A) 水平条形图"
)

#plot vertical barplots on 社区 and 态度
barplot(
  table3,
  xlab = "态度",
  ylab = "人数",
  horiz = FALSE, #vertical barplot
  density = 20,
  angle = 60,
  col = c("red","blue"),
  border = c(2,4),
  main = "(B) 态度统计条形图"
)

barplot(
  table1,
  xlab = "社区",
  ylab = "人数",
  horiz = FALSE,
  density = 20,
  angle = 30,
  col = c("grey20", "grey40", "grey60", "grey80"),
  border = c(2,4),
  main = "(C) 社区统计图"
)

##Pareto Plot (similar to barplot)
example3_1 <- read.csv("examples/example3_1.csv")
tab <- sort(table(example3_1$社区),decreasing = TRUE) #1-D frequency table
palette <- RColorBrewer::brewer.pal(4,"Blues")
bar <- barplot( #record the height in bar
  height = tab,
  xlab = "社区",
  ylab = "频数",
  col = palette,
  ylim =c(0,1.2*max(tab))
)
text(x = bar, y = tab, labels = tab, pos=3,col="black") #add texts
y <- cumsum(tab)/sum(tab) #find cummulative frequency

par(new = TRUE) #a new plot based on the present plot
plot( #add cumulaive freq line
  y,
  type = "b", #b for points and lines
  pch = 15,
  axes = FALSE, #suppress both x and y axes
  xlab = '',
  ylab = '',
  main=''
)
axis(side = 4) #add axis to the 4th side
mtext("累积频率", side = 4, line = 3, cex = 0.8) #add label for the new axis
text(labels = "累积分布曲线", x = 3, y = 0.92, cex = 1) #add annotation

