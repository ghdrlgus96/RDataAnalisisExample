# 데이터에서 변수 제한
# 케이스 선택 등

# 뽑아낼 변수 개수 정함
iris[,1:2]
# 4개의 값을 가진 벡터
1:4

# 변수제한
iris[1:10,c("Sepal.Length", "Sepal.Width")]


# 많은 변수를 뽑아내야 하면 일일히 입력하기는 어렵다
# names 함수를 이용하자 데이터 프레임에서 변수명이 추출한다
names(iris)
names(iris)[1:4]

# 저장
iris_name <- names(iris)[1:4]
iris[,iris_name]

# 벡터 값의 길이는 다르지만 유형은 같다
# 뽑아내야할게 많을수록 names를 사용하면 빠르게 작업 가능
c("Sepal.Length", "Sepal.Width")
names(iris)[1:4]


# case 범위 선택
iris[1:10,]
# 조건 부여 방식
iris[iris$Sepal.Length>7,]
iris[iris$Species=="virginica",]
# 두 조건을 동시에 만족 해야한다
iris[iris$Sepal.Length>7 & iris$Species=="virginica",]
# subset(변수, 조건)
subset(iris, Sepal.Length>7 & Species=="virginica")


iris[iris$Species=="virginica" & iris$Petal.Width>2.3,4:5]
subset(iris[,4:5], Species=="virginica" & Petal.Width>2.3)



# 고객 가치 분석
# 군집분석과 고객등급 분석을 통하여 고객 가치 분석
# 데이터 탐색
str(customer_purchase)
head(customer_purchase)
# monetary / frequency = purchase_price
summary(customer_purchase)
# 군집분석 함수 kmeans(하고 싶은 것, 나누고 싶은 그룹 수)
km <- kmeans(customer_purchase, 3)
# clusters suze 그룹에 몇명씩 할당 되었는지
# cluster means 통합 결과 출력 1번 군집이 가장 가치가 높다
# cluster vector 492명 각각에 다라 벡터의 정보
# 그 아래는 부가적인 정보들
km
# 군집분석 결과가 cluster에 저장되어 있다
result<-cbind(customer_purchase, cluster=km$cluster, cust_level=customer_vip$vip)
summary(result)
# cluster를 factor 유형으로 변경할 필요가 있다
result$cluster<-as.factor(result$cluster)
summary(result)

# 통합을 수행해서 고객의 등급별로 금액 수행
# 상이하다
aggregate(monetary~cust_level, data = result, mean)
aggregate(monetary~cluster, data = result, mean)
# 비즈니스 적인 vip와 군집에서 vip랑 상당히 다르다
# 비즈니스적 가치와 통계적인 가치의 관점이 조금 다르다

# 1번군집이 생각보다 적다
subset(result, cust_level!="일반")
# 비즈니스 적인 vip는 구매 금액만으로 결정되지 않는다
