##vectors
a = c(2,5,8,3,9); a
v1 <- 1:6; v1
v2 <-seq(from=2, to=4, by=0.5);v2
v3 <-rep(1:3,times=3);v3
v4 <-rep(1:3,each=3);v4
LETTERS[1:10]
letters[1:10]
month.abb
month.name


##Matrices
v <- 1:6
mat = matrix(
  v,
  nrow = 2, ncol=3,
  byrow=TRUE
)
print(mat)

#add row name
rownames(mat)=c("A", "B")
colnames(mat)=c("item1", "item2", "item3")
mat

#transpose matrix
t(mat)

#data frame
#from vectors to df
names = c("Liu Wentao", "Wang Yuxiang", "Tian Siyu", "Xu Lina", "Ding Wenbin")
stat = c(68, 85, 74, 88, 63)
math = c(85, 91, 74, 100, 82)
econ = c(84, 63, 61, 49, 89)

table2_1 = data.frame(
  stu_name = names,
  stat = stat,
  math = math,
  econ = econ
)
table2_1

#Accessing df
#df from csv fiels
table2_1 = read.csv("examples/table2_1.csv")
head(table2_1) #first 6 rows
head(table2_1, 3) #first 3 rows
tail(table2_1, 3) #last 3 rows

#check row and column number
nrow(table2_1)
ncol(table2_1)
dim(table2_1) #check dimension (row, col)

#check data types
class(table2_1)

#check data structure
str(table2_1)

#access specific row col
table2_1[,1:3] #access col1 to col3
table2_1[,c(1,3)] #access col1 and col3
table2_1[3,] #access row3
table2_1[c(2,4),] #access row2 and row4
table2_1[3,2] #access cell(3,2)
table2_1[c(1,3),c(1,2:3)]

#combining data frames
table2_1 = read.csv("examples/table2_1.csv"); head(table2_1)
table2_2 = read.csv("examples/table2_2.csv"); head(table2_2)

#combine by row
mytable = rbind(table2_1, table2_2)
mytable

#sorting data frame
table2_1 = read.csv("examples/table2_1.csv")
table2_2 = read.csv("examples/table2_2.csv")
library(dplyr)
arrange(table2_1, by=姓名) #arrange (sort) by 姓名 increasingly
arrange(table2_1, desc(姓名)) #arrange (sort) by 姓名 decreasingly

#sorting using order()
table2_2[order(table2_2$姓名),] #sort by 姓名 ascendingly
table2_2[order(table2_2$统计学,decreasing = TRUE),] #sort by 统计学 descendingly