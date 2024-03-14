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
									<!-- c:out을 "굳이" 사용하는 이유??: 보안성-->
									<td><c:out value="${board.bno}" /></td>
									<td><c:out value="${board.title}" /></td>
									<td><c:out value="${board.writer}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- table -->
					
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
		
		function checkModal(result){
			if(result === ''){
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