########## 데이터 통합 ###########
# 데이터 불러오기 및 탐색
travel
head(travel)
str(travel)

# 가장 높은 총액을 소비한 상위 10 고객
# 데이터의 형태가 바뀌었다는게 중요하다
# 고객을 id 별로 묶은 후에는 한번 씩만 나온다
cust_sum <- aggregate(cost~cust_id, data=travel, sum)
cust_sum[order(-cust_sum$cost),][1:10,]


# 가장 높은 평균 금액을 소비한 상위 10 고객
cust_mean <- aggregate(cost~cust_id, data=travel, mean)
cust_mean[order(-cust_mean$cost),][1:10,]


# 가장 낮은 총액을 보이는 세 도시
city_sum <- aggregate(cost~destination, data=travel, sum)
city_sum[order(city_sum$cost),][1:3,]


# 일본에 방문한 총 고객 수
# 일본 방문 -> 고객 추리기
japan_visit <- travel[travel$country=="일본",]
# sum 이 중요하지 않지만 써야 하므로 쓴것이다 통계치가 무조건 중요한 것은 아니다
aggregate(cost~cust_id, data=japan_visit, sum)



# 가장 많이 여행한 고객
# 여행 횟수에 대한 정보가 필요하다
# 중요한 부분이다!
travel$visit <- 1
visit_sum <- aggregate(visit~cust_id, data=travel, sum)
visit_sum[order(-visit_sum$visit),]


# 가장 여행을 많이 다닌 상위 세 고객이 방문한 도시
travel_most <- subset(travel, cust_id==1 | cust_id==2 | cust_id==3)
aggregate(visit~destination, data=travel_most, sum)




######### 데이터 병합 ##########
# 데이터 생성(국적 정보, 성병 정보)
nat<- data.frame(id=c(1,2,3),nationality=c("한국","프랑스","일본"))
gen<-data.frame(id=c(2,3,4),gender=c("남성","여성","남성"))

nat
gen


# 내부 병합
merge(x=nat,y=gen,by='id')



# 부분 외부 병합(국적)
merge(x=nat,y=gen,by='id',all.x=TRUE)



# 부분 외부 병합(성별)
merge(x=nat,y=gen,by='id',all.y=TRUE)



# 전체 외부 병합
merge(x=nat,y=gen,by='id',all=TRUE)
