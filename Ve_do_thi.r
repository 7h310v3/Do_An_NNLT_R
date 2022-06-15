install.packages("readxl")
install.packages("dplyr")

library(readxl)
library(dplyr)


setwd("D:\\R_Project\\Do_An_NNLT_R")

path <- readxl_example("GDP_VN.xlsx")
path

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

#xây dựng hàm đếm NA:
NAPerVariable <- function(X1) { 
  D1 <- is.na(X1) 
  colSums(D1) 
}
NAPerVariable(GDP)

#Ttrực quan hóa bằng scatter plot
plot(GDP$GDP.per.capita.local,GDP$GDP.per.capita.USD,
     #  xlab = "GDP",
     #  ylab = "GDP per capita USD",
     main = "Scatter Plot")
lm.fit <- lm(GDP.per.capita.USD ~ GDP.per.capita.local, data=GDP)
coef(lm.fit)

# Tạo đường tuyến tính:
plot(GDP$GDP.per.capita.local,GDP$GDP.per.capita.USD,
     xlab = "GDP",
     ylab = "GDP per capita USD",
     main = "Scatter Plot")
abline(lm.fit,lwd=3,col="red")

# Ta đã có được phương trình hồi quy:
# Tiến hành thay số ta được kết quả bị thiếu là:
235.229407595193 + 0.0404512653501748 * 6117.00

#thêm giá trị bị thiếu vào bảng 
GDP$GDP.per.capita.USD[2] = 482.67ls

# Kiểm tra dữ liệu:
GDP

#Biểu đồ GDP thay đổi theo thời gian hay biến year
par(
  mfrow=c(1,2), 
  oma = c(0, 0, 2, 0)
) 

#Make the margin around each graph a bit smaller
par(mar=c(4,2,2,2))

# Histogram and Scatterplot
hist(GDP$GDP,  main="" , breaks=30 , col=rgb(0.3,0.5,1,0.4) , xlab="height" , ylab="nbr of plants")
plot(GDP$Year, GDP$GDP, main="" , pch=20 , cex=0.4 , col=rgb(0.3,0.5,1,0.4)  , xlab="primadur" , ylab="Ixos" )

#And I add only ONE title :
mtext("Primadur : Distribution and correlation with Ixos", outer = TRUE, cex = 1.5, font=4, col=rgb(0.1,0.3,0.5,0.5) )

