<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<!-- page-wrapper 없으면 nav가 튀어나오는 오류 발생 -->
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Modify</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board Modify Page</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<form action="/board/modify" method="post">
					
						<div class="form-group">
							<label>Bno</label> <input class="form-control" name="bno"
								value='<c:out value="${board.bno}"/>' readonly>
						</div>
						<div class="form-group">
							<label>Title</label> <input class="form-control" name="title"
								value='<c:out value="${board.title}"/>'>
						</div>
						<!-- textarea버그: textarea를 두 줄로 작성했을 경우 들여쓰기 한 부분까지 내용으로 인식하여 편집기의 들여쓰기까지 고스란히 들어간다.
							해결: 그냥 한 줄로 작성하면 된다. -->
						<div class="form-group">
							<label>Text area</label><textarea class="form-control" rows="3" name="content" style="resize:none;"><c:out value="${board.content}"/></textarea> 
						</div>
						<div class="form-group">
							<label>Writer</label> <input class="form-control" name="writer"
								value='<c:out value="${board.writer}"/>' readonly>
						</div>
						<div class="form-group">
							<label>RegDate</label> <input class="form-control" name="regDate"
								value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.regdate}" />' readonly>
						</div>
						<div class="form-group">
							<label>Update Date</label> <input class="form-control" name="updateDate"
								value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.updateDate}" />' readonly>
						</div>
						<button type="submit" data-oper="modify" class="btn btn-default">Modify</button>
						<button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
						<button type="submit" data-oper="list" class="btn btn-info">List</button>
					
					</form>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-6 -->
	</div>
	<!-- /.row -->
</div>
<%@include file="../includes/footer.jsp"%>
<script>
	$(document).ready(function(){
		const formObj = $("form");
		$('button').on("click", function(e){
			e.preventDefault();
			const operation = $(this).data('oper');
			
			console.log(operation);
			
			//클릭한 버튼의 data-oper 속성이 remove라면 remove로 이동
			if(operation === 'remove'){
				formObj.attr("action", "/board/remove");
			//클릭한 버튼의 data-oper 속성이 list라면 list로 이동
			}else if(operation === 'list'){
				self.location = "/board/list";
				return;
			}
			formObj.submit();
		});
	})
</script>