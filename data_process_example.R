# 데이터 다루기 실습

# 벡터로 데이터 프레임 생성
# 2개 이상 값을 넣기 위해서는 combine 쓰자
x <- c(1, 2, 3)
y <- c("남자", "여자", "남자")
# 데이터 프레임 생성
df <- data.frame(x, y)
df

# 고객 데이터 불러오기
# customer_dat을 customer로 받아오기
str(customer)
head(customer)

# 5명의 고객을 임의로 추출
# sample 함수 <- 랜덤으로 추출해주는 함수
# 일반화 시켜서 nrow 쓴다
# 매번 수행할 때마다 랜덤으로 추출된다
customer[sample(nrow(customer), 5),]


# 서울에 거주하는 남성 고객들의 id, 성별, 가입일자 정보를 출력
# 서울에 거주하는 남성 먼저 추출
# id, 성별, 가입일자를 추출
customer_man<-subset(customer, gender=="남자" & area=="서울")
# 데이터 프레임의 위치 정보를 숫자로 입력
customer_man[, c(1, 2, 5)]


# 전체 고객을 구매 금액이 높은 순으로 나열
# order 쓰면 내림차순으로 정렬된다
customer[order(-customer$cost),]


# 구매 금액이 가장 높은 남성 고객과 여성 고객의 id 확인
# 정렬 변수를 2개를 가져가자
customer[order(customer$gender, -customer$cost),]


# 서울 지역에 거주하는 고객중 가장 구매 금액이 낮을 고객의 id 확인

customer_seoul<-customer[customer$area=="서울", ]
customer_seoul[order(customer_seoul$cost), ]




########### 데이터를 변수 관점에서 다루기 ################
# 고객 id와 금액만 출력
# 데이터 덮어쓰기 없었으므로 기존의 데이터는 변동사항이 없다
customer[, c(1, 3)]
customer[, -c(2, 4, 5)]
# 변수 삭제
customer$gender <- NULL


# 금액 기준으로 상위고객, 하위고객을 정의
customer$level<-ifelse(customer$cost>570000, "High", "Low")
head(customer)


# 월별 구매 금액 총액 계산
# 문자열 처리 위해서는 chr 형으로 바꿔야 한다
customer$register <- as.character(customer$register)
customer$month <- substr(customer$register, 6,7)
customer
aggregate(cost ~ month, data=customer, sum)

