# Spring legacy Project

 스프링 레거시를 통한 기초적 웹사이트 구축해보자
 
 글 올리기, 수정, 삭제, 파일 올리기, 댓글 작성
 
## Skills

스프링 레거시는 부트와 달리 xml로 직접 관리해야함

현재 프로젝트는 maven으로 작성되었슴. mvn 에서 artifactId로 검색

###### Spring

```
spring-context
spring-webmvc
spring-test
spring-jdbc
spring-tx
```

###### Db

```
mybatis
mybatis-spring
mysql-connector-java
HikariCP
```

###### Servlet

```
javax.servlet-api
jsp-api
jstl // JSP 내 템플릿 엔진
```

###### Util

```
lombok // Getter, Setter 관련 편리한 기능 제공
thumbnailator // 이미지 파일 업로드시 자그마한 이미지로 가공해줌
quartz // 배치 프로그램
quartz-jobs
```



## Structure

#### ![경로](https://user-images.githubusercontent.com/51068026/131460770-c81c06d6-e4ab-4a92-be99-487f156df838.PNG)

이클립스의 STS (Spring Tool Suite)를 쓰면 기본적으로 만들어지는 경로이다.

### src/main/

#### java/[프로젝트명]

controller : 주소의 경로를 읽어서 처리하는 로직

domain : db 의 데이터 정보를 읽어 VO 객체나 DTO 객체로 저장함

interceptor : 컨트롤러가 실행되기 전에 사전에 읽는 요소

mapper : 마이베티스 프레임워크 내 DB 와 연결 될  SQL 문을 저장하는 인터페이스

​                없을 시 resource/[프로젝트명]/mapper 내 XML을 읽어들인다.

service : 프로젝트내 필요한 서비스 로직의 매서드를 저장시켜둠.

 util : 자주 사용하게 될 자바스크립트를 만드는 로직을 모아둠



> ##### 매퍼와 서비스의 분리된 이유
>
> 두 개의 클래스가 긴밀하게 연결되지 않도록 중간에 추상적인 느슨한 연결고리를 만든다.
>
> 자바의 경우는 인터페이스를 통해 구현한 클래스에 대한 구체적인 정보는 감출 수 있다.



#### resources

 [프로젝트명]/mapper : mapper 내 인터페이스의 메서드 명과 일치한 SQL문을 불러옴

static : 고정적인 뷰페이지 저장

mybatis-config.xml : 마이베티스 내 설정값 저장



#### webapp

resources : image, css, javascript 등 뷰 관련 리소스

WEB-INF : 톰캣내 설정이나 뷰가 위치함



#### WEB-INF

##### spring 

root-context.xml : 디비 관련 설정이 들어 있음

servlet-context : Servlet 설정 관련 내용 저장됨

views : 프론트 페이지





 

