# 벡터, 매트릭스, 리스트 등의 데이터 형식이 존재한다

# Vector
v <- c(1,2,3,4,5)
v

# 세미클론을 이용해서 벡터 생성 가능하다
v1 <- c(1:5)
v1

v2 <- c(1:5, 10, 100, 101:105, -10)
v2
# numeric이 integer보다 큰 개념이다
# 벡터를 이용한 간단한 연산작업
# v 벡터의 모든 값에 1이 증가되어 있다
v + 1

# 값이 대응되어서 합산된다
v + v1

# 논리연산
# 각 벡터의 값들이 3보다 크면 True 아니면 False가 반환된다
v > 3
# 1이랑 같은지 비교
v == 1

# 벡터에 값을 추가할 수 있다 1회용!
c(v, 6)
# 값이 비어있다 라는 의미이다
c(v, NA)

# 이 데이터의 형식이 numeric 인지 확인
is.numeric(v)
is.factor(v)

# 벡터의 유형은 하나이다. 즉 숫자와 문자가 혼합될 수 없다
# 숫자만 들어있는 벡터에 문자를 넣으면 모든 숫자가 문자로 강제 변환된다!
is.factor(c(v, "남자"))

# v라는 벡터에는 NA를 찾을 수 없다 단 추가했으므로 마지막에 True 출력된다
is.na(c(v, NA))




###############################################

head(iris)
str(iris)
# 덮어써준다 만들거나 덮어쓰기 가능하다
iris$Species <- as.character(iris$Species)
# factor에서 chr로 변했다
str(iris)


iris_1 <- iris[1:10,]
iris_2 <- iris[11:20,]
# rbind 에서 변수명 중요한 이유는 변수명과 변수의 개수가 동일 해야만이 쓸 수 있다
rbind(iris_1, iris_2)

# cbind 다른 두 데이터의 변수를 변수명이 달라도 상관없지만 개수는 같아야한다
BOD
cbind(BOD, iris[1:6,])

# 데이터 병합이다


#################################################

str(credit_data)
head(credit_data)
summary(credit_data)

# 회귀 분석에 factor 형식으로 해야지 가능하다
credit_data$bank <- as.factor(credit_data$bank)
# 주거래 은행에 따른 평균 거래 금액
aggregate(monetary ~ bank, data=credit_data, mean)


# 4) 로지스틱 회귀분석 수행 결과는 참고만 합시다
model <- glm(fraud~bank+credit_card+monetary,data=credit_data,family="binomial")
summary(model)

# 5) 로지스틱 회귀분석으로부터 부정사용 의심 점수 계산
score<-fitted(model)*100
head(score)

# 6) cbind 함수를 사용해 기존 데이터에 부정사용 의심 점수를 결합
# 형태는 데이터 프레임이다
result<-cbind(credit_data,score)
result


library(ggplot2)

# 주거래은행에 따른 부정 사용의심점수 시각화
ggplot(result,aes(x=score,fill=bank))+
  geom_histogram(binwidth=0.6,alpha=0.5,position="identity")+
  ggtitle("주거래은행에 따른 고객의심 부정사용 의심 점수")+
  theme_bw()
