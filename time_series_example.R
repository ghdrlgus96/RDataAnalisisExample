# R의 통계분석을 알아보자
# R에서 사용할 수 있는 통계분석 기능

iris
# 차별로 스펙 정보가 있다
mtcars

m1<-mean(iris$Sepal.Length)
# 중위수 -> 가장 가운데 수 뽑아내기
m2<-median(iris$Sepal.Length)
# 표준편차 구하기
s1<-sd(iris$Sepal.Length)


# 표준화 수행
iris$Sepal.Length_z<-(iris$Sepal.Length-m1)/s1
head(iris)


# 상관분석
# iris로 상관분석을 해본다
cor(iris, method=c("pearson"))
# str로 변수 유형을 봐야 한다. Species가 없어야 상관분석이 가능하다

# matrix 형태이므로(행렬) 한쪽만 봐야한다
cor(iris[,c(1:4)], method=c("pearson"))

library(PerformanceAnalytics)
chart.Correlation(iris[,c(1:4)],pch=19)


# t 검정 <- 두 집단의 평균 수치를 비교 해준다
iris_test<-subset(iris, Species=="setosa" | Species=="virginica")
# 가운데 작대기가 중위수이다
boxplot(Sepal.Length~Species,data=iris_test)
t.test(iris_test$Sepal.Length~iris_test$Species, var.equal=T)


# 카이제곱 검정
table(mtcars$vs,mtcars$cyl)
# 독립적인지 아닌지? 두개의 범주의 관계?
# X-squared = 21.34, df = 2, p-value = 2.323e-05 낮으므로 관계가 있다

chisq.test(mtcars$vs,mtcars$cyl)




## 시계열 분석 예측 

# 데이터 불러오기
# 승객의 수가 월별로 저장되어 있는 데이터
AirPassengers

# 시계열 데이터 시각화
ts.plot(AirPassengers)
title("1949~1960년 월별 탑승 승객")

# 시계열 분해
# decpmpose로 시즌 패턴 트랜트 패턴 랜덤 패턴 등이 분류된다
ts<-decompose(AirPassengers)
ts
# 데이터의 시각화
# 굴곡의 변화 <- 트랜드로 명확하게 볼 수 있다
# 시즌 패턴 볼 수 있다 <- 명확하게 보인다 <- 시즌성이 강하다
# 랜덤패턴
plot(ts)

# 시계열 분석 수행
fit <- arima(AirPassengers, order=c(1,0,0), list(order=c(2,1,0), period=12))

# 시계열 예측 수행 
predict <- predict(fit, n.ahead=24)

# visual
ts.plot(AirPassengers, predict$pred, col=c(1,2,4,4), lty = c(1,1,2,2))
legend("topleft", c("실제", "예측"), col=c(1,2), lty=c(1,1))
