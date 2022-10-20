![슬라이드1](./images/슬라이드1.PNG)
![슬라이드2](./images/슬라이드2.PNG)
![슬라이드3](./images/슬라이드3.PNG)
![슬라이드4](./images/슬라이드4.PNG)
![슬라이드5](./images/슬라이드5.PNG)
![슬라이드6](./images/슬라이드6.PNG)
![슬라이드7](./images/슬라이드7.PNG)
![슬라이드8](./images/슬라이드8.PNG)
![슬라이드9](./images/슬라이드9.PNG)
![슬라이드10](./images/슬라이드10.PNG)
![슬라이드11](./images/슬라이드11.PNG)
![슬라이드12](./images/슬라이드12.PNG)
![슬라이드13](./images/슬라이드13.PNG)
![슬라이드14](./images/슬라이드14.PNG)
![슬라이드15](./images/슬라이드15.PNG)
![슬라이드16](./images/슬라이드16.PNG)
![슬라이드17](./images/슬라이드17.PNG)
![슬라이드18](./images/슬라이드18.PNG)
![슬라이드19](./images/슬라이드19.PNG)
![슬라이드20](./images/슬라이드20.PNG)
![슬라이드21](./images/슬라이드21.PNG)
![슬라이드22](./images/슬라이드22.PNG)
![슬라이드23](./images/슬라이드23.PNG)
![슬라이드24](./images/슬라이드24.PNG)
![슬라이드25](./images/슬라이드25.PNG)
![슬라이드26](./images/슬라이드26.PNG)
![슬라이드27](./images/슬라이드27.PNG)
![슬라이드28](./images/슬라이드28.PNG)
![슬라이드29](./images/슬라이드29.PNG)
![슬라이드30](./images/슬라이드30.PNG)
![슬라이드31](./images/슬라이드31.PNG)
![슬라이드32](./images/슬라이드32.PNG)
![슬라이드33](./images/슬라이드33.PNG)
![슬라이드34](./images/슬라이드34.PNG)
![슬라이드35](./images/슬라이드35.PNG)
![슬라이드36](./images/슬라이드36.PNG)

<h3> 1. preprocess.ipynb </h3>
  
크롤링으로 수집된 csv 데이터에 위, 경도를 추가하고 DB에 import 가능한 json 형태로 바꾸는 데이터 전처리 코드

<h3> 2. app1. py </h3>

firestore에서 user 콜렉션의 select 변수에 저장된 정보를 불러온다.
이후 data_apt 콜렉션을 호출해, 각 문서의 주소 변수에 저장된 정보가 위의 select 변수에 저장된 정보와 일치하는지 확인한다.
만약 일치한다면, 해당 문서에 있는 매물 세부 정보 데이터를 반환한다.

<h3> 3. app2. py </h3>
  
firestore에서 data_apt와 data_anm 콜렉션을 호출한다.
이후 user 콜렉션에서 first, second, third 변수를 호출해 매물과 반려동물 시설 간의 1km 내의 개수와 해당 시설들의 평균 거리를 계산한다.
평균 거리를 이용해 점수를 매기고, 데이터 프레임을 생성한다.
이후 최종점수를 이용해 K-Means를 진행하고 생성된 군집을 통해 매물을 분류한다.
분류된 매물 중 사용자가 원하는 매물과 가장 가까운 매물부터 번호를 붙인 후, recommend 콜렉션에 저장한다.

<h3> 4. kmeans_score.ipynb </h3>

K-means를 진행하기 위해 Elbow method와 Silhouette Score을 진행한 코드

<h3> 5. house_crawling.py </h3>
매물을 크롤링하여 수집하는 코드

<h3> 6. petband 폴더 </h3>
Android Studio에서 dart를 이용해 어플리케이션을 구현한 코드
