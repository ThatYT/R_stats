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

#factor (categorical variables)
v = c("金融", "地产", "医药","医药", "金融", "医药")
f1 = factor(v); f1
as.numeric(f1)

#convert to ordinal factors
b = c("very good", "good", "moderate", "bad", "very bad")
f2 = factor(b, ordered=TRUE, levels = )
f2
as.numeric(f2)

##data sampling
df = read.csv("examples/example2_1.csv")
n1 = sample(df$姓名,size=10); n1 #sample 10 students without replacement
n2 = sample(df$姓名,size=10,replace=TRUE); n2 #sample 10 students with replacement

#sample 10 testing scores
n3 = sample(df$考试分数, size=10); n3
n4 = sample(df$考试分数, size=10); n4

#set random seed
set.seed(1)

##Selecting data
df = read.csv("examples/example2_1.csv")
sample(df$姓名[df$考试分数<60])
df[df$考试分数<60,]

sample(df$姓名[df$考试分数>=90])
sample(df$姓名[df$专业=="会计学"])

#using filter()
library(dplyr)
filter(df, 考试分数>=90)
filter(df, 性别=="女" & 专业=="会计学")
filter(df, 性别=="女" & 专业=="会计学" & 考试分数>=90)

##generate random numbers
#random number following normal distribution
rnorm(n=5, mean=0, sd=1)

set.seed(15)
rnorm(n=5, mean=50, sd=5)

#random number following uniform distribution
runif(n=5, min = 0, max = 10)


##transforming data structure
table2_1 = read.csv("examples/table2_1.csv")

#df to vectors
v1 = as.vector(table2_1$统计学); v1
v2 = as.vector(c(table2_1$统计学,table2_1$数学)); v2

#df to matrix
mat1 = as.matrix(table2_1[,2:4]); mat1
v3 = as.vector(mat1); v3

#interchange: df and matrix
table2_1 = read.csv("examples/table2_1.csv")
mat = as.matrix(table2_1); mat
#set row and column names
rownames(mat) = table2_1[,1] #use 姓名 as row names
mat

#matrix to df
as.data.frame(mat)

#from short format to long format
table2_1 = read.csv("examples/table2_1.csv"); table2_1 #this is a short format
#using melt from package:reshape2
library(reshape2)
df1 = melt(table2_1, id.vars="姓名", variable.name="课程", value.name="分数")
df1 #this is a long format

#using gather from package:tidyr
library(tidyr)
df2 = gather(table2_1, key = "课程", value="分数","统计学","数学","经济学");df2

##Frequency Distribution Table
example2_2 = read.csv("examples/example2_2.csv"); head(example2_2)
prop.table(tab1)*100 #find percentages

#2-D contingency table
example2_2 = read.csv("examples/example2_2.csv"); head(example2_2)
attach(example2_2) #attach df, access items in df without actually calling df
tab2 = table(态度,社区);tab2

#without attach
tab2 = table(example2_2$态度, example2_2$社区); tab2

#add margins
addmargins(tab2)

#convert to percentages
addmargins(prop.table(tab2)*100)


#higher dimensional contingency table

#use ftable
example2_2 = read.csv("examples/example2_2.csv"); head(example2_2)
tab3 = ftable(example2_2, row.vars = c("性别", "态度"), col.vars = "社区")
tab3
#add margins
ftable(addmargins(table(example2_2$性别, example2_2$态度, example2_2$社区)))
addmargins(table(example2_2$性别, example2_2$态度, example2_2$社区))


#using structable() from package:vcd
library(vcd)
structable(性别+态度~社区, data=example2_2)

#interchange contingency table and data frames
library(DescTools)
mytable = ftable(example2_2)
df = Untable(mytable)

#from contingency table to df with frequency
tab = ftable(example2_2); tab #frequency table
df = as.data.frame(tab); df

#decriptive analysis of frequency table
#1 Dimensional analysis
example2_2 = read.csv("examples/example2_2.csv")
library(DescTools)
Desc(example2_2$社区)

#2 Dimensional analysis
Desc(table(example2_2$性别, example2_2$态度))

# Multi dimensional analysis
Desc(table(example2_2))


##Categorization
example2_1 = read.csv("examples/example2_1.csv")
head(example2_1)
dim(example2_1)

#decide number of groups K
#K = 1+lg(n)/lg(2)
n = dim(example2_1)[1];n
K = 1 + log10(n)/log10(2);K
K = floor(K);K

#cut into groups
library(DescTools)
tab1 = Freq(example2_1$考试分数, breaks = K); tab1
tab2 = Freq(
  example2_1$考试分数, #specify data
  breaks = c(50,60,70,80,90,100), #specify intervals
  right = FALSE #[,)
  ) 
tab2

library(scales)
tab2 = data.frame(
  分组 = tab2$level,
  频数 = tab2$freq,
  百分比 = percent(tab2$perc),
  累积频数 = tab2$cumfreq,
  累积百分比 = percent(tab2$cumperc)
)
print(tab2, digits = 3) #3 digits
