#Chapter 2: Getting Data into R

# Bài 1:

# Tạo biến
LengthCT <- c(75,85,91.6,95,NA,105.5,106)
Tb <- c(0,0,1,NA,0,0,0)
# Tính giá trị trung bình bỏ qua NA
mean (LengthCT, na.rm=TRUE)

#Bài 2: 

# Tạo 2 biến Farm và Month
Farm <-c("MO","MO","MO","MO","LN","SE","QM")
Month <- c(11,07,07,NA,09,09,11)

# Kết hợp 2 biến Farm và Month 
Boar<-cbind(Farm,Month,LengthCT,Tb)
Boar
# Số lượngng động vật:
nrow(Boar)
# Số biến:
ncol(Boar)

#Bài 3: 

tb2 <- vector(mode="numeric",length=7)
tb2[3]<-1
tb2[4]<-NA
tb2

#Bài 4: 

# Tạo vector chứa các giá trị của phần tử trong ma trận
vec<-c(1,2,3,4,2,1,2,3,0)
#  Tạo ma trận
D<-matrix(vec,nrow=3,byrow=TRUE)
D
# Ma trận chuyển vị
Dt<-t(D)
Dt
# Ma trận nghịch đảo
Ds<-solve(D)
Ds
# Nhân D với ma trận nghịch đảo
I<-D%*%Ds
I

#Bài 5: 

Year <- c(0,0,1,NA,3,3,2)
Sex<- c(1,2,2,2,1,2,2)
LengthClass<- c(1,1,1,1,1,1,1)
Ecervi<- c(0,0,0,NA,0,0,0)

# Tạoo cộtt dữ  liệu căn bậc hai độ dài
sqrtlengh<-sqrt(LengthCT)
sqrtlengh
# Tạo khung chứa dữ liệu    
dframe<-data.frame(Farm,Month,Year,Sex,LengthClass,LengthCT,Ecervi,Tb,sqrtlengh)
dframe
#Sử dụng list thay data.frame
lframe<-list(Farm,Month,Year,Sex,LengthClass,LengthCT,Ecervi,Tb,sqrtlengh)
lframe

#Bài 6:

# Nhập dữ liệu vào R bằng hàm read.table()
setwd("D:/R_Project/RBook")
ISIT<-read.table("ISIT.txt",header=TRUE)
ISIT
# Lưu dữ liệu vào file ascii
save(ISIT, file="ISITASCII.txt",ascii = TRUE)
ISIT
# Kiểm tra kiểu của biến ISIT
is.matrix(ISIT)
is.data.frame(ISIT)
# Nhập dữ liệu vào R bằng scan()
ISITSCAN<-scan(file="ISIT.txt",what="character")
ISITSCAN
# Lưu dữ liệu sang file ascii
save(ISITSCAN, file="ISITSCANASCII.txt",ascii = TRUE)
ISITSCAN
# Kiểm tra kiểu của biến ISITSCAN
is.matrix(ISITSCAN)
is.data.frame(ISITSCAN)
is.vector(ISITSCAN)

#Bài 7: 

setwd("D:/R_Project/RBook")
Deer<-read.table("Deer.txt",header=TRUE)
Deer
#Lưu dữ liệu sang file ascii
save(Deer, file="DeerASCII.txt",ascii = TRUE)
Deerascii<-read.table("DeerASCII.txt",header=TRUE)
Deerascii

#Chapter 3: Accessing Variables and Managing Subsets of Data

setwd("D:/R_Project/RBook")
# Bài 1:

birdflu<-read.table(file='BirdFluCases.txt',header=TRUE, sep = "\t")
attach(birdflu)
str(birdflu)
birdflu
namecases=c('cases2003','cases2004','cases2005','cases2006','cases2007','cases2008')
# Tổng số ca bệnh cúm trên mỗi quốc gia
print("Tổng số ca bệnh cúm của mỗi quốc gia: ")
for (i in Country){
  sumcases_country=0
  for(j in namecases ){
    sumcases=sumcases+birdflu[birdflu$Country==i,j]
  }
  print(paste(i,':',sumcases_country))
}
# Tổng số ca cúm mỗi năm:
print('Tổng số ca bệnh mỗi năm: ')
for (i in namecases){
  sumcases_year=sum(birdflu[,i])
  print(paste('2003: ',sumcases_year))
}

# Bài 2:

ISIT <- read.table(file = "ISIT.txt", header= TRUE, dec = ".")
names(ISIT)
str(ISIT)
#Dữ liệu station1
ISIT.Station1 <- ISIT[ISIT$Station ==1,]
ISIT.Station1
names(ISIT.Station1)
str(ISIT.Station1)
# Số quan sát được thực hiện
nrow(ISIT.Station1)
# minimum, median, mean, maximum độ sâu lấy mẫu
# Station 1
min(ISIT.Station1$SampleDepth)
median(ISIT.Station1$SampleDepth)
mean(ISIT.Station1$SampleDepth)
max(ISIT.Station1$SampleDepth)
# Station 2
ISIT.Station2 <- ISIT[ISIT$Station ==2,]
nrow(ISIT.Station2)
min(ISIT.Station2$SampleDepth)
median(ISIT.Station2$SampleDepth)
mean(ISIT.Station2$SampleDepth)
max(ISIT.Station2$SampleDepth)
# Station 3
ISIT.Station3 <- ISIT[ISIT$Station ==3,]
nrow(ISIT.Station3)
min(ISIT.Station3$SampleDepth)
median(ISIT.Station3$SampleDepth)
mean(ISIT.Station3$SampleDepth)
max(ISIT.Station3$SampleDepth)
#Kiểm tra station nào ít hon
tapply(ISIT$Station, INDEX = ISIT$Station,length)
#Tạo dataframe mà loại bỏ station ít hơn
ISIT2 <- ISIT[ISIT$Station!=4 & ISIT$Station!=5 ,]
ISIT2
#Lấy dữ liệu năm 2002
Year2002 <- ISIT2[ISIT2$Year ==2002,]
#Lấy dữ liệu tháng 4 
AllYear <- ISIT2[ISIT2$Month ==4,]
# Trích xuất dữ liệu được đo ở độ sâu lớn hơn 2000 mét
ISIT2Depth2000 <- ISIT2[ISIT2$SampleDepth >2000,]
# Hiển thị dữ liệu theo giá trị độ sâu tăng dần
I1 <- order(ISIT2Depth2000$SampleDepth)
showdata <-ISIT2Depth2000[I1,]
# Trích xuất dữ liệu được đo ở độ sâu lớn hơn 2000 mét trong tháng 4
E3 <- ISIT2[ISIT2$Month ==4 & ISIT2$SampleDepth >2000,]

#Bài 3.

#Using the write.table function 
write.table(E3, file="ISITDepth2000April.txt")

#Bài 4.

# Biến tháng mới
ISIT$NewMoth <- NA
ISIT$NewMoth[ISIT$Station <=5] <- "April"
ISIT$NewMoth[ISIT$Station > 5 & ISIT$Station<=11] <- "August"
ISIT$NewMoth[ISIT$Station > 11 & ISIT$Station<=15] <- "March"
ISIT$NewMoth[ISIT$Station >= 16 & ISIT$Station<=19] <- "October"
ISIT$NewMoth
ISIT$NewMoth <- factor(ISIT$NewMoth)
# Biến tháng mới
ISIT$NewYear <- NA
ISIT$NewYear[ISIT$Station <=11] <- 2001
ISIT$NewYear[ISIT$Station  >=12 & ISIT$Station<=19] <- 2002
ISIT$NewYear
ISIT$NewYear <- factor(ISIT$NewYear)

#Chapter4
#Exercise 1. Viec su dung cac ham tapply, sapply va lapply de tinh nhiet di trung binh moi thang.
temp <- read.table(file = "Temperature.txt", header = TRUE)
mean <- matrix(nrow = 16, ncol = 12)
std <- matrix(nrow = 16, ncol = 12)
count <- matrix(nrow = 16, ncol = 12)
allyear <- unique(temp$Year)
for (i in 1:16) {
  year = allyear[i]
  val = temp[temp$Year == year,]
  mean[,i] = tapply(val$Temperature, 
                    val$Month, mean,
                    na.rm = TRUE)
  std[i,] = tapply(val$Temperature,
                   val$Month, sd,
                   na.rm = TRUE)
  count[i,] = tapply(val$Temperature,
                     val$Month, length)
}
#Exercise 2. Viec su dung chuc nang bang cho du lieu nhiet do.
table(temp$Station)
table(temp$Year)
table(temp$Year, temp$Station)

#Chapter 5: Gioi thieu ve cac cong cu ve do thi co ban

# Sử dụng tập dữ liệu Amphibian_road_Kills.txt để vẽ biểu đồ
setwd('D:/R_Project/RBook')
rk<- read.table('Amphibian_road_Kills.txt', header = TRUE)
rk
names(rk)
str(rk)
plot(x=rk$D_PARK,y=rk$TOT_N,
     xlab="Distance to park",
     ylab="Number of dead animals")
M.Loess <- loess(TOT_N~D_PARK, data =rk)
Fit <- fitted(M.Loess)
Ord1<- order(rk$D_PARK)
lines(rk$D_PARK[Ord1],Fit[Ord1], lwd=3,lty=2)

plot(x=rk$D_PARK,y=rk$TOT_N,
     cex = 0.5+3* rk$OLIVE/max(rk$OLIVE),
     xlab="Distance to park",
     ylab=" Number of dead animals")


#Chapter 6: Vòng lặp và hàm
# Bài 1:

setwd("D:/R_Project/RBook")
data<-read.table("Temperature.txt", header=TRUE)
data
setwd("D:/IMG/")
allstation <- unique(data$Station)
allstation
allyear<-unique(data$Year)
allyear
for (i in 1:30){ 
  station.i<-allstation[i]
  for (j in 1:16){
    year.j<-allyear[j]
    data.i <- data[data$Station == station.i & data$Year==year.j, ]
    YourFileName <- paste(station.i,year.j, ".jpg", sep = "")
    jpeg(file = YourFileName)
    plot(x = data.i$Month, 
         y = data.i$Temperature,
         xlab = "Month",
         ylab = "Temperature", main = paste(station.i,year.j))
    dev.off()
  }
}

