# ex03
Spring Framework 기반으로 국비지원 수업 때 진행된 게시판 CRUD 실습 예제 프로젝트입니다. ('코드로 배우는 스프링' 서적 참고)

## :computer: 개발 환경
* `JAVA11`
* `STS3`
* `MySql`
* `Spring` `MyBatis`
* `Bootstrap`

## :memo: 요구사항
### 게시글 등록
|주요기능(함수)|설명|SQL
|---|---|---|
|void register()|register.jsp로 이동|
|String register()|게시글 등록하고 board/list.jsp로 이동하여 사용자에게 등록 확인|`CREATE`|

### 게시글 리스트 조회
|주요기능(함수)|설명|SQL
|---|---|---|
|list()|Criteria(검색기준)을 받아서 검색기준에 부합하는 상품 리스트 출력|`SELECT`|

### 상세 페이지 조회
|주요기능(함수)|설명|SQL
|---|---|---|
|get()|현재 페이지 출력|`SELECT`|

### 삭제
|주요기능(함수)|설명|SQL
|---|---|---|
|String remove()|게시글 삭제하고 사용자에게 확인|`DELETE`
### 수정
|주요기능(함수)|설명|SQL
|---|---|---|
|void get()|수정 페이지 출력|
|String modify()|게시글 수정하고 사용자에게 확인|`UPDATE`

### 페이지 VO
|클래스|설명|
|---|---|
|Criteria|상품 검색기준. 현재 페이지 숫자와 출력되는 페이지의 양 외에도 검색되는 키워드와 검색 카테고리를 담을 수 있다.|
|PageDTO|Criteria를 비롯해서 전체 글 수와 페이지 블록 정보를 담을 수 있다.|
## :open_file_folder: 구조
### 클래스
#### controller
* BoardController
* HomeController
#### domain
* BoardVO
* Criteria
* PageDTO
#### service
* BoardService
* BoardServiceImpl
#### mapper
* BoardMapper
### views
* get.jsp
* modify.jsp
* register.jsp
* list.jsp
* home.jsp
* footer.jsp
* header.jsp
## :wrench: 개선사항

## :bulb: 알게 된 점
* Bootstrap으로 페이지를 구성하니 html구조가 복잡해지긴 했어도 디자인은 훨씬 보기 좋게 바뀌었다.
* MyBatis의 trim, foreach, choose 등을 이용해서 동적으로 쿼리를 생성할 수 있었다.
* 페이징과 검색 기능을 사용하여 좀 더 실용성 있는 게시판을 만들 수 있었다.
