<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12"> <h1 class="page-header">Board List Page</h1> </div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading"> Board List Page
					<button id='regBtn' type="button" class="btn btn-xs pull-right">Register New Board</button>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="board">
								<tr>
									<!--
										c:out을 "굳이" 사용하는 이유??: 보안성
										input에 <script>를 작성하는 경우 자바스크립트를
										그대로 실행시킬 위험이 있다.
										c:out은 <,>,&,',"같은 특수기호들을 글자 그대로 출력하기 때문에
										XSS 공격에 대비할 수 있다.
									-->
									<td><c:out value="${board.bno}" /></td>
									<td><a href="/board/get?bno=<c:out value='${board.bno}'/>">
										<c:out value="${board.title}" /></a></td>
									<td><c:out value="${board.writer}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- table -->
						<div class='pull-right'>
							<ul class="pagination">
								<%-- <c:if test="${pageMaker.prev}"> --%>
									<!-- bootstrap 버전이 달라서 교재와 class가 다를 수 있음 -->
									<li class="page-item"><a class="page-link" href="list?pageNum=${pageMaker.startPage-1}">Previous</a></li>
								<%-- </c:if> --%>
								<c:forEach begin="${pageMaker.startPage}"
											end="${pageMaker.endPage}"
											var="num">
									<li class="page-item ${pageMaker.cri.pageNum == num ? 'active':'' }">
										<a class="page-link" href="list?pageNum=${num}">${num}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next}">
									<li class="page-item"><a class="page-link" href="list?pageNum=${pageMaker.endPage+1}">Next</a></li>
								</c:if>
							</ul>
						</div>
						
					<!-- 모달 시작 -->
					<div class="modal" tabindex="-1" id="myModal" role="dialog">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title">Modal title</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <p>처리가 완료되었습니다.</p>
					      </div>
					      <div class="modal-footer">
					      	<!-- data-bs-dismiss 대신에 data-dismiss사용(버전 문제) -->
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary">Save changes</button>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- modal -->
					
				</div>
				
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-6 -->
	</div>
	<!-- /.row -->

	<%@include
		file="../includes/footer.jsp"%>
		
		
<script>
	$(document).ready(function(){
		//controller로부터 가져온 값을 result 변수로 대입
		let result = '<c:out value="${result}"/>';
		
		checkModal(result);
		
		//register.jsp에서 location.reload() 설정 하지 않았을 경우 작성할 수 있는 코드
		history.replaceState({},null, null);
		
		function checkModal(result){
			if(result === '' || history.state){
				return;
			}
			
			//데이터가 있으면 모달 나타남
			if(parseInt(result) > 0){
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}
			
			$("#myModal").modal("show");
		}
		
		/*
			[또 다른 방법] location.href = "/board/register";
			self? : window 객체
		*/
		$("#regBtn").on("click", function(){
			self.location = "/board/register";
		})
		
	});
</script>