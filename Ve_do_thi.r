# Doc du lieu
GDP <- read.table("GDP_VN.txt",header = TRUE, sep = "\t")

dim(GDP)

names(GDP)

str(GDP)

GDP


P1 <- c(GDP$X2000[1], GDP$X2001[1], GDP$X2002[1], GDP$X2003[1],
        GDP$X2004[1], GDP$X2005[1], GDP$X2006[1], GDP$X2007[1],
        GDP$X2008[1], GDP$X2009[1], GDP$X2010[1], GDP$X2011[1],
        GDP$X2012[1], GDP$X2013[1], GDP$X2014[1])
png(file = "TONG SAN PHAM TRONG NUOC THEO GIA THUC TE - TY DONG.jpg")
plot(P1,type = "o")
dev.off()

P2 <- c(GDP$X2000[2], GDP$X2001[2], GDP$X2002[2], GDP$X2003[2],
        GDP$X2004[2], GDP$X2005[2], GDP$X2006[2], GDP$X2007[2],
        GDP$X2008[2], GDP$X2009[2], GDP$X2010[2], GDP$X2011[2],
        GDP$X2012[2], GDP$X2013[2], GDP$X2014[2])
png(file = "TONG SAN PHAM TRONG NUOC BINH QUAN DAU NGUOI THEO GIA THUC TE - NOI TE - NGHIN DONG.jpg")
plot(P2,type = "o")
dev.off()

P3 <- c(GDP$X2000[3], GDP$X2002[3], GDP$X2003[3],
        GDP$X2004[3], GDP$X2005[3], GDP$X2006[3], GDP$X2007[3],
        GDP$X2008[3], GDP$X2009[3], GDP$X2010[3], GDP$X2011[3],
        GDP$X2012[3], GDP$X2013[3], GDP$X2014[3])
png(file = "TONG SAN PHAM TRONG NUOC BINH QUAN DAU NGUOI THEO GIA THUC TE - NGOAI TE (THEO TY GIA HOI DOAI BINH QUAN) - USD.jpg")
plot(P3,type = "o")
dev.off()

P4 <- c(GDP$X2000[4], GDP$X2001[4], GDP$X2002[4], GDP$X2003[4],
        GDP$X2004[4], GDP$X2005[4], GDP$X2006[4], GDP$X2007[4],
        GDP$X2008[4], GDP$X2009[4], GDP$X2010[4], GDP$X2011[4],
        GDP$X2012[4], GDP$X2013[4], GDP$X2014[4])
png(file = "TICH LUY TAI SAN THEO GIA THUC TE - TY DONG.jpg")
plot(P4,type = "o")
dev.off()

P5 <- c(GDP$X2000[5], GDP$X2001[5], GDP$X2002[5], GDP$X2003[5],
        GDP$X2004[5], GDP$X2005[5], GDP$X2006[5], GDP$X2007[5],
        GDP$X2008[5], GDP$X2009[5], GDP$X2010[5], GDP$X2011[5],
        GDP$X2012[5], GDP$X2013[5], GDP$X2014[5])
png(file = "TIEU DUNG CUOI CUNG THEO GIA THUC TE - TY DONG.jpg")
plot(P5,type = "o")
dev.off()

P6 <- c(GDP$X2000[6], GDP$X2001[6], GDP$X2002[6], GDP$X2003[6],
        GDP$X2004[6], GDP$X2005[6], GDP$X2006[6], GDP$X2007[6],
        GDP$X2008[6], GDP$X2009[6], GDP$X2010[6], GDP$X2011[6],
        GDP$X2012[6], GDP$X2013[6], GDP$X2014[6])
png(file = "XUAT KHAU HANG HOA VA DICH VU THEO GIA THUC TE - TY DONG.jpg")
plot(P6,type = "o")
dev.off()

GDP$X2001 <- as.numeric(GDP$X2001)

P <- c(GDP$X2000, GDP$X2002, GDP$X2003,
       GDP$X2004, GDP$X2005, GDP$X2006, GDP$X2007,
       GDP$X2008, GDP$X2009, GDP$X2010, GDP$X2011,
       GDP$X2012, GDP$X2013, GDP$X2014)

png(file = "P7.jpg")
barplot(P, main = "BARPLOT GDP",
        horiz = FALSE)
dev.off()


png(file = "P8.jpg")
boxplot(P, main = "BOXPLOT GDP",
        col = "orange", border = "brown",
        horizontal = TRUE, notch = TRUE)
dev.off()


png(file = "P9.jpg")
plot(P, main = "PLOT GDP",
     col = "blue", 
     pch = 19)
dev.off()


png(file = "P10.jpg")
boxplot(P, main ='BOXPLOT')
dev.off()

png(file = "P11.jpg")
hist(P, main = "HIST PLOT",
     col ="yellow",
     freq = TRUE)
dev.off()


