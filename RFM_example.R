# 데이터에서 변수를 추출하는 방법
iris$Sepal.Length

# ifelse 함수
y <- ifelse(iris$Sepal.Length > 5, "more than 5", "less than 5")
y

# iris$Sepal.Length_level는 기존에 없던 변수이다
iris$Sepal.Length_level <- y
# 기존 5개였던 iris가 6개가 된다

head(iris)

# 데이터의 통합
# 50개에 대한 평균
# 3종류 나온다
# 데이터 내의 특정 변수를 기준으로 다른 변수의 통계값
aggregate(Sepal.Length ~ Species, data=iris, mean)
aggregate(Sepal.Length ~ Species, data=iris, sum)
# 4개 변수의 평균치
aggregate(. ~ Species, data=iris, mean)


str(customer_rfm)
head(customer_rfm)

# trans_id는 고객의 고유 id 이므로 중복되어서는 안된다
aggregate(monetary ~ monetary_level, data=customer_rfm, mean)
aggregate(frequency ~ frequency_level, data=customer_rfm, mean)
aggregate(recency ~ recency_level, data=customer_rfm, mean)

rfm_level <- aggregate(. ~ monetary_level+frequency_level+recency_level, data=customer_rfm, mean)
rfm_level

library(rgl)
plot3d(customer_rfm$monetary, customer_rfm$frequency, customer_rfm$recency, 
       xlab = 'Monetray',ylab = 'Frequency',zlab = 'Recency',col="blue", size=1)
