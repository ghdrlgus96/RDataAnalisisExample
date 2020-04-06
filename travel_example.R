# 간략한 탐색
str(travel)
head(travel)

travel

#travel의 case 1~20으로 줄인다
#부분집합의 느낌
travel[1:20,]

# 통합변수를 입력하면... 도시의 이름을 고유하게 출력해준다, 중복 안되게!
aggregate(. ~ destination, data=travel, sum)

# 필요한 데이터만 추려내는 방법
# , 기준 왼쪽은 케이스 연산 오른쪽은 변수 연산
travel <- travel[, c("cust_id", "destination")]
travel

c("cust_id", "destination")

travel[1:20, c("cust_id", "destination")]

# 데이터를 트랜잭션 형태로 변환
# 반드시 변환작업이 필요함
# 고객 아이디별로 고객이 방문한 도시가 묶여 나온다
travel2 <- split(travel$destination, travel$cust_id)
travel2

travel3 <- as(travel2, "transactions")
travel3

summary(travel3)

as(travel3, "data.frame")

# 테이블 형태로 나온다
table(travel)

#supp 지지도 conf 신뢰도
rules <- apriori(travel3, parameter = list(supp=0.15, conf = 0.8))
summary(rules)
inspect(rules)




# 구매상품 연관성분석 수행

# 0) 관련 패키지 다운로드
library(arules)
library(datasets)

# 1) 데이터 불러오기
data(Groceries)
summary(Groceries)


# 2) 가장 많이 구매한 상위 20개 상품, summary 와 동일하게 나타남
itemFrequencyPlot(Groceries,topN=20,type="absolute")


# 3) 연관성분석을 수행하고 확인
rules <- apriori(Groceries, parameter = list(supp=0.001, conf = 0.8))
summary(rules)
inspect(rules)


# 4) Whole milk 구매의 연관규칙만 확인
# 신뢰도가 높은 규칙부터 실행되어라
rules2<-sort(apriori(Groceries, parameter=list(supp=0.001,conf = 0.08,minlen=2), 
                     appearance = list(default="rhs",lhs="whole milk"),
                     control = list(verbose=F)),decreasing=TRUE,by="confidence")
inspect(rules2)
summary(rules2)
inspect(rules2[1:5,])


# 5) 연관성 규칙 시각화
library(arulesViz)
plot(rules2,method="graph",interactive=TRUE,shading=NA)

