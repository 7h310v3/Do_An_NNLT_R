install.packages("readxl")
install.packages("dplyr")
install.packages("ggplot2")

library(readxl)
library(dplyr)
library("ggplot2")


setwd("D:\\R_Project\\Do_An_NNLT_R")

#đọc dữ liệu 
GDP <- read_excel("GDP_VN.xlsx", sheet = 1)

GDP

#hiển thị số dòng số côt 
dim(GDP)

#hiển thị tên các cột (biến) của dữ liệu 
names(GDP)

#hiển thị tên các cột (biến) và các thông tin đi kèm 
str(GDP)

#hiển thị tập dữ liệu 
GDP

plot(x = GDP$"2000",
     xlab = colnames(GDP),
     main = "Chi tieu nam 2000"
)

plot(GDP)

barplot(GDP$"2000",
        main = "Chi tieu nam 2000",
        xlab = colnames(GDP), horiz = FALSE
)

barplot(GDP)
