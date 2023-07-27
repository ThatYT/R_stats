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

par(
  mar = c(5,5,5,5)
)

bar <- barplot( #record the height in bar
  height = tab,
  xlab = "社区",
  ylab = "频数",
  col = palette,
  ylim =c(0,1.2*max(tab))
)
text(x = bar, y = tab, labels = tab, pos=3,col="black") #add texts
y <- cumsum(tab)/sum(tab) #find cummulative frequency

par(
  new = TRUE, #a new plot based on the present plot
  mar = c(5,5,5,5)
)

plot( #add cumulaive freq line
  y = y,
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


##2Juxtaposed Bar Plot
example3_1 <- read.csv("examples/example3_1.csv")
tab1 <- table(example3_1$性别, example3_1$社区)
tab2 <- table(example3_1$性别, example3_1$态度)
tab3 <- table(example3_1$社区, example3_1$态度)


library(DescTools)
par(
  mfrow = c(2,2), #fill by row, 2 by 2
  mar = c(3, 3, 3, 3),
  cex = 0.8,
  cex.main = 1,
  font.main = 1
)

#vertical side by side barplot
b1 <- barplot(
  height = tab1,
  beside = TRUE,
  xlab = "社区",
  ylab = "人数",
  main = "(a) 垂直并列条形图",
  col = c("lightgreen", "lightblue"),
  legend = rownames(tab1), #add legend
  args.legend = list(x = 14, y = 19, ncol = 2, cex = 0.7, box.col = "grey80"), 
  #set legend arguments to 2 columns
  ylim = c(0, 10*ceiling(max(tab1)/10)+5)
)

BarText(
  height = tab1,
  b = b1,
  beside = TRUE,
  cex = 1
)

#horizontal side by side barplot
b2 <- barplot(
  height = tab2,
  beside = TRUE,
  horiz = TRUE, #horizontal barplot
  xlab = "人数",
  ylab = "态度",
  main = "(b) 水平并列条形图",
  col = c("lightgreen", "lightblue"),
  legend = row.names(tab2),
  args.legend = list(
    x=8, y = 7,
    ncol = 2, cex = 0.7, box.col = "grey80"
  ),
  xlim = c(0, 10*ceiling(max(tab2)/10)+5)
)

BarText(
  height = tab2,
  b = b2,
  beside = TRUE,
  horiz = TRUE,
  cex = 1
)

#vertical stacked barplot
b3 <- barplot(
  height = tab3,
  beside = FALSE,
  col = c("lightgreen", "lightblue", "lightyellow", "lightpink"),
  legend = rownames(tab3),
  args.legend = list(
    x = 1.15, y = 50,
    ncol = 2, cex = 0.7, box.col = "grey80"
  ),
  ylim = c(0, max(sum(tab3[,1]), sum(tab3[,2]))+20),
  main = "(c) 垂直堆叠条形图"
)

BarText(
  height = tab3,
  b = b3,
  beside = FALSE,
  horiz = FALSE,
  cex = 1
)

#horizontal stacked barplot
b4 <- barplot(
  main = "(d) 水平堆叠条形图",
  height = tab3,
  horiz = TRUE,
  beside = FALSE,
  col = c("lightgreen", "lightblue", "lightyellow", "lightpink"),
  legend = rownames(tab3),
  args.legend = list(
    x = 40, y = 2.8,
    ncol = 4, cex = 0.7, box.col = "grey80"
  )
)


##3 Spine Plot (showing proportions)
example3_1 <- read.csv("examples/example3_1.csv")
attach(example3_1)
par(
  mfrow = c(1,2), #fill by row, 1r by 2c
  mar = c(3,3,3,3),
  cex = 0.8,
  cex.main = 1,
  font.main = 1
)
palette <- rev(RColorBrewer::brewer.pal(4,"Blues"))
spineplot(
factor(性别)~factor(社区), #y~x
data = example3_1,
col = palette[1:2],
xlab = "社区",
ylab = "性别",
main = "(a) 性别与社区的脊型图"
)

spineplot(
  factor(社区)~factor(性别), #y~x
  data = example3_1,
  col = palette,
  xlab = "性别",
  ylab = "社区",
  main = "(b) 社区与性别的脊型图"
)


##4 Mosaic Plot
example3_1 <- read.csv("examples/example3_1.csv")
mosaicplot(
  ~性别+社区+态度, #as a function of 性别 社区 态度 
  data = example3_1,
  col = palette,
  cex.axis = 0.8,
  off = 3,
  main = "Mosaic Plot"
)

##5 dendogram 树状图
library(treemap)

example3_1 <- read.csv("examples/example3_1.csv")

#generate dataframe with cross-tab frequency
tab <- ftable(example3_1)
d <- as.data.frame(tab)
df <- data.frame(d[,-4],频数=d$Freq) #d[,-4] means strip the 4th columns from d

#plot the dendogram
treemap(
  df,
  index = c("社区", "性别", "态度"),
  vSize = "频数",
  type = "index", #colors are determined by the index variables
  fontsize.labels = 9,
  position.legend = "bottom",
  title = ""
)





