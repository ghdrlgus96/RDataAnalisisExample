# 1. R-Studio에서 customer_rfm, vip 데이터를 불러와
# str(), head(), summary() 함수를 사용하여
# 두 데이터의 기초적인 탐색 수행

customer_rfm
str(customer_rfm)
head(customer_rfm)
summary(customer_rfm)

vip
str(vip)
head(vip)
summary(vip)



# 2. cbind() 함수를 사용해 두 데이터를 병합한
# customer_master 데이터프레임 생성

customer_master <- cbind(customer_rfm, vip)



# 3. customer_master 데이터를
# trans_id, monetary_level, frequency_level, recency_level, vip 변수로 추린
# customer_master1 데이터프레임 생성

customer_master1 <- customer_master[, c(1, 5, 6, 7, 9)]
customer_master1



# 4. 아래 조건에 맞게 vip 등급별 monetary level를 확인할 수 있는
# 막대그래프 생성
# [조건: ggplot(데이터프레임, aes(변수1,fill=factor(변수2)))+geom_bar(position=position_dodge())+theme_bw()]

library(ggplot2)
ggplot(customer_master1, aes(vip, fill=monetary_level))+geom_bar(position=position_dodge())+ggtitle("vip 등급별 monetary level")+theme_bw()



# 5. 생성된 데이터 시각화 (막대 그래프) 결과를 통해
# 고객 등급에 따른 구매력에 대한 시사점 제공

# customer_rfm 데이터를 기초 탐색한 결과 고객 세분화 방법 중 일정 기간 동안 발생한 고객의 구매 이력을 활용한 방법인
# RFM 분석을 이용하여 monetary, frequency, recency를 도출한 것을 파악할 수 있다.
# 또한, vip 데이터를 통하여 고객을 vip 고객과 일반 고객으로 도출한 것을 알 수 있다.
# 이 데이터를 병합한 후 ggplot의 막대 그래프로 시각화한 결과 일반 고객이 압도적으로 많았으며 vip 고객은 소수인 것을 파악할 수 있다.
# 또한, 일반 고객의 monetary_level이 Low > Middle > High 순으로 많았으며,
# vip 고객의 monetary_level은 Low > High > Middle 순으로 나타난다.
# 이때, 일반 고객이라고 해서 monetary_level이 Low인 고객만 있는 것이 아니라 Middle과 High 고객이 다수 존재하며,
# vip 고객이라고 해서 monetary_level이 High인 고객만 있는 것이 아니라 Middle과 Low 고객 또한 존재하는 것으로 나타난다.
# 이를 통하여 vip 등급은 monetary_level 뿐만이 아니라 frequency_level, recency_level이 큰 영향을 준다는 것을 알 수 있다.