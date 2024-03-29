<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<!-- page-wrapper 없으면 nav가 튀어나오는 오류 발생 -->
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Read</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board Read Page</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					
						<div class="form-group">
							<label>Bno</label> <input class="form-control" name="bno"
								value='<c:out value="${board.bno}"/>' readonly>
						</div>
						<div class="form-group">
							<label>Title</label> <input class="form-control" name="title"
								value='<c:out value="${board.title}"/>' readonly>
						</div>
						<div class="form-group">
							<label>Text area</label><textarea class="form-control" rows="3" name="content" style="resize:none;" readonly><c:out value="${board.content}"/></textarea> 
						</div>
						<div class="form-group">
							<label>Writer</label> <input class="form-control" name="writer"
								value='<c:out value="${board.writer}"/>' readonly>
						</div>
						<form id='actionForm' action="/board/list" method="get">
							<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'/>
							<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'/>
							<input type="hidden" name='bno' value='<c:out value="${board.bno}"/>'/>
						</form>
						<button type="button" class="btn btn-info listBtn"><a href="/board/modify?bno=<c:out value='${bno}'/>">List</a></button>
						<button type="button" class="btn btn-info modBtn">
							<a href="/board/modify?bno=<c:out value='${board.bno}'/>">Modify</a></button>
						<script>
							var actionForm = $('#actionForm');
							$('.listBtn').on('click',function(e){
								e.preventDefault();
								actionForm.submit();
							});
							$('.modBtn').on('click',function(e){
								e.preventDefault();
								actionForm.attr("action","/board/modify");
								actionForm.submit();
							});
						</script>
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
