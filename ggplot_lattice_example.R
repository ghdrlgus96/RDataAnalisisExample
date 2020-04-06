## Lattice 패키지 소개

# 패키지 불러오기
library(lattice)

# Lattice 시각화 예시 
trellis.device()
show.settings()

# 산점도 매트릭스
# 4개의 변수의 관계를 알 수 있다
# 대각선을 기준으로 대칭이므로 한 부분만 보면 된다
# 오존이 올라갈수록록 바람이 약해지는 반비례 관계를 볼 수 있다
splom(~environmental,
      panel=function(x,y){
        panel.xyplot(x,y)
        panel.loess(x,y)
      })

# 다변량 시각화 예시
# 굉장히 복잡하다
# 여러가지 다변수를 가지고 시각화가 가능하다
x <- seq(pi/4, 5 * pi, length.out = 100)
y <- seq(pi/4, 5 * pi, length.out = 100)
r <- as.vector(sqrt(outer(x^2, y^2, "+")))
grid <- expand.grid(x=x, y=y)
grid$z <- cos(r^2) * exp(-r/(pi^3))
levelplot(z~x*y, grid, cuts = 50, scales=list(log="e"), xlab="",
          ylab="", main="Weird Function", sub="with log scales",
          colorkey = FALSE, region = TRUE)



# 적합한 도표를 추가한다음 시각화가 가능하다
## 실무에 사용할 수 있는 데이터 시각화
# 패키지 불러오기
library(ggplot2)

# 일변량 <- 변수가 1개일때

# 연속형 <- 숫자 데이터 일때
# ggplot입력 후 대상 데이터, 요소.... 등 정의
# x 축에 꽆받침의 길이, y 축에 수
ggplot(iris,aes(x=Sepal.Length))+stat_bin(binwidth=0.2,aes(fill=..count..),colour="black")+ggtitle("꽃받침의 길이 분포")+theme_bw()
# 밀도를 그리는 시각화
# 단순한 형태의 도표이다
ggplot(iris,aes(x=Sepal.Length))+geom_density(alpha=.2)+ggtitle("꽃받침의 너비 밀도")+theme_bw()

# 도표의 제목을 이해하기 쉽게 작성하는 것이 즁요하다

# 범주형 <- 단순히 퍼센트밖에 못하기 때문에 제한 된다
ggplot(infert, aes(education,fill=education))+geom_bar()+ggtitle("환자의 교육수준")+theme_bw()
# 원도표
ggplot(infert, aes(education,fill=education))+geom_bar()+coord_polar(theta = "y")+ggtitle("환자의 교육수준")+theme_bw()



# 이변량

# 연속형 x 연속형
ggplot(mtcars,aes(wt,disp))+geom_point()+geom_abline(intercept=-80,slope=100,colour="red")+ggtitle("무게에 따른 이동범위")+theme_bw()

# 범주형 x 범주형
ggplot(mtcars, aes(vs,fill=factor(cyl)))+geom_bar(position=position_dodge())+ggtitle("엔진 유형에 따른 실린더 수")+theme_bw()

# 연속형 x 범주형
ggplot(iris, aes(x=factor(Species), y=Sepal.Width))+geom_boxplot(aes(fill=factor(Species)))+ggtitle("붓꽃 유형에 따른 꽃받침의 너비")+theme_bw()
ggplot(iris,aes(x=Sepal.Width,fill=Species))+geom_density(alpha=.3)+ggtitle("붓꽃 유형에 따른 꽃받침의 너비 밀도")+theme_bw()
ggplot(diamonds,aes(price,fill=clarity))+geom_histogram(binwidth = 600)+ggtitle("선명도 수준에 따른 다이아몬드의 가격분포")+scale_fill_brewer("YlGn")+theme_bw()


# 다변량

# 연속형 x 연속형 + @
ggplot(mtcars,aes(wt,disp))+geom_point(aes(size=cyl))+ggtitle("무게에 따른 이동범위 + 실린더 수")+theme_bw()
ggplot(diamonds,aes(carat,price))+geom_point(aes(colour=clarity))+ggtitle("캐럿에 따른 다이아몬드의 가격 + 선명도 수준")+theme_bw()


# ggplot 부가 기능

# 도표 분할 
ggplot(diamonds,aes(carat))+geom_histogram(binwidth = 0.5,aes(fill=..count..))+facet_wrap(~ cut, ncol=5)+theme_bw()

# 다른 두 산점도를 한번에 시각화
ggplot(iris)+geom_point(aes(Sepal.Length,Sepal.Width),colour="brown",pch=17)+geom_point(aes(Petal.Length,Petal.Width),colour="purple",pch=19)+theme_bw()



# 굉장히 직관적인 시각화 기능이다
#### 데이터는 시각화를 통해 데이터 제공이 가장 중요하다 ####