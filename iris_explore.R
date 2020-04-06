# 데이터 불러오기
iris <- read.csv("C:/Users/skim178/Desktop/working/lesson_2/iris.txt", sep="")

# 데이터 구조 확인
str(iris)

# 상위 6개 케이스 확인
head(iris)

# 기술통계 산출
summary(iris)

# ggplot를 활용한 iris 데이터 시각화
library(ggplot2)
ggplot(iris, aes(Sepal.Length, Sepal.Width))+
  geom_point(aes(colour = Species, size=Petal.Width), alpha=I(0.7))+theme_bw()
