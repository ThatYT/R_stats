setwd("Ch2_DataHandlingAndGraph/")

#exercise 2.1
rank = c("低收入户", "中等偏下户", "中等收入户", "中等偏上户", "高收入户")
yr2018 = c(3750, 7338, 10508, 14823, 28225)
yr2019 = c(4647, 9330, 13506, 19404, 36957)
yr2020 = c(6545, 12674, 18277, 26044, 49175)
yr2021 = c(8004, 17024, 24832, 35576, 67132)
yr2022 = c(10422, 21636, 31685, 45639, 85541)
df_income = data.frame(
  "收入户等级" = rank,
  "2018" = yr2018,
  "2019" = yr2019,
  "2020" = yr2020,
  "2021" = yr2021,
  "2022" = yr2022
)
#2.1.1 write to csv file
write.csv(df_income,file = "ex2_1_income.csv")

#2.1.2 convert to matrix
mat_income = as.matrix(df_income)
mat_income

#2.1.3 convert to long format
library(reshape2)
df_income_long = melt(df_income, id.vars = "收入户等级", variable.name = "年份", value.name = "数量")
df_income_long


#exercise 2.2
library(dplyr)
df_stu = read.csv("exercises/exercise2_2.csv"); df_stu

#2.2.1 rank by 姓名
df_stu = arrange(df_stu, 姓名); df_stu

#2.2.2 sample by name with replacement, n = 5
n1 = sample(df_stu$姓名, size = 5); n1 #by default: replace = FALSE

#2.2.3 select student majoring economics
df_stu_econ = filter(df_stu, 专业 == "经济学" & 性别 == "女"); df_stu_econ

#2.2.4 select student with stats grades <60 or >=90
df_stat_outliers = filter(df_stu, 统计学 < 60 | 数学 >= 90); df_stat_outliers


#exercise 2.3
randnumbers = rnorm(20)
mat4by5 = matrix(randnumbers, nrow = 4, ncol = 5); mat4by5
mat5by4 = matrix(randnumbers, nrow = 5, ncol = 4); mat5by4

#exercise 2.4
df_titanic = as.data.frame(Titanic)
head(df_titanic)

#2.4.1 generate 2-D contingency table
tab_titanic = table(df_titanic$Sex, df_titanic$Survived)
tab_titanic

#2.4.2 generate higher dimensional contingency table
#uncount df_titanic
library(tidyr)
df_titanic_raw = uncount(data = df_titanic, weights = Freq); df_titanic_raw

#multi dimensional contingency table
library(stats)
tab_mul_titanic = ftable(
  x = df_titanic_raw,
  row.vars = c("Class", "Sex"),
  col.vars = c("Age", "Survived")
)
tab_mul_titanic

#2.4.3 generate frequency interval table
library(DescTools)
freq_tab_titanic = Freq(tab_mul_titanic)
freq_tab_titanic


#exercise 2.5
rand_num1 = rnorm(1000, mean = 200, sd = 10)
break_basket = seq(
  from = 10*floor(min(rand_num1)/10), 
  to = 10*ceiling(max(rand_num1)/10), by = 10
)
#generate frequency table
Freq(rand_num1, breaks = break_basket)

#exercise 2.6
df_stu = read.csv("exercises/exercise2_2.csv"); head(df_stu); dim(df_stu)
library(RColorBrewer)
my_breaks = hist(df_stu$统计学)$breaks
my_colors <- rep("#1b98e0", length(my_breaks)) 
my_colors[my_breaks >= 90] <- "red"
my_colors[my_breaks < 50] = "green"

hist(
  df_stu$统计学,
  col = my_colors
)
