iris <- read.csv("D:/R/iris.txt", sep="")

str(iris)

# 상위 6개만 출력(작업이 성공적인지 확인)
head(iris)

# 통계치와 빈도까지 나옴 ex) mean은 평균치를 나타냄
# 데이터의 탐색은 눈으로 하는 것이 아닌 데이터를 요약하면서 정리
# 기술 통계 산출
summary(iris)

# 데이터 시각적으로 확인
library(ggplot2) #ggplot2 패키지 불러오기
ggplot(iris, aes(Sepal.Length, Sepal.Width))+
  geom_point(aes(colour = Species, size=Petal.Width), alpha=I(0.7))+theme_bw()
# plot tab에 나오게 된다
# 색상에 따라 다르게 표현


# R script 정리하는 방법
# 주석처리는
# 이다
# 코멘트로 인식된다
# 한글 입력이 안되면 R Session에 오류가 있는 것이므로 종료 후 재 실행
