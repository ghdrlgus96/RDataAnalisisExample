# 데이터 통합과 병합 응용
## 제공 데이터 : 16 시즌 경기 기록 상세, 15 시즌 특정, 2016 수상 후보, 2016 유로 입상 국가

# 데이터 불러오기 및 탐색
str(CL_16)
CL_16


# 2016 수상 후보의 16 시즌 득점 기록
Award
player_sum_16 <- aggregate(Goals~Player, data=CL_16, sum)
merge(x=player_sum, y=Award, by="Player", all.y=TRUE)


# 2016 유로 대회에서 입상한 국가에 속한 선수들의 16 시즌 득점 기록
Euro
National_sum <- aggregate(Goals~Nationality, data=CL_16, sum)
merge(x=National_sum, y=Euro, by="Nationality", all.y=TRUE)


# 15, 16 시즌에 모두 골을 기록한 선수
player_sum_15
player_sum_16
merge(x=player_sum_15, y=player_sum_16, by="Player")



############# 기초적인 R 프로그래밍 ###############
# x의 값이 3보다 큰 경우 'more than 3'라는 텍스트를 반환하는 조건문 생성
x <- 10
if(x > 3) {
  print("more than 3")
}


# y의 값이 0보다 큰 경우 'more than 0'라는 텍스트를 반환하고
# 그렇지 않은 경우 'less than 0'라는 텍스트를 반환
y <- -10
if(y > 0) {
  print("more than 0")
} else {
  print("less than 0")
}


# 1~5 값을 포함하고 있는 z 벡터의 값을 순차적으로 출력해주는 반복문 생성 
z <- 10:20
for (i in z){
  print(i)
}

# 1~5 값을 포함하고 있는 x 벡터의 제곱값을 반환해주는 사용자 정의 함수 생성
square <- function(x){
  x^2
}

# 함수 사용
x<-1:5
square(x)
