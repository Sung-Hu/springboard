<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- heafer.jsp -->
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container p-5">
	<c:choose>
		<c:when test="${posts != null && !empty posts}">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="post" items="${posts}">
						<tr>
							<td>${post.id}</td>
							<td>${post.title}</td>
							<td>${post.content}</td>
							<td>${post.username}</td>
							<td>
								<div class="d-flex">

									<form action="/board/delete/${post.id}" method="post">
										<button class="btn btn-danger">삭제</button>
									</form>

									<form action="/board/update" method="get">
									<input type="hidden" id="id" name="id" value="${post.id}">
										<button class="btn btn-warning">수정</button>
									</form>
								</div>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		<div class="d-flex justify-content-center" >
			<ul class="pagination">
				<li class="page-item  <c:if test='${currentPage == 1}'>disabled</c:if>">
					<a class="page-link" href="?type=${type}&page=${currentPage - 1}&size=${size}" >Previous</a>
				</li>
				<c:forEach begin="1" end="${totalPages}"  var="page" >
				<li class="page-item  <c:if test='${page == currentPage}'>active </c:if>">
					<a class="page-link"  href="?type=${type}&page=${page}&size=${size}" >${page}</a>
				</li>
				</c:forEach>
				<li class="page-item <c:if test='${currentPage == totalPages}'>disabled</c:if>" >
					<a class="page-link" href="?type=${type}&page=${currentPage + 1}&size=${size}" >Next</a>
				</li>
			</ul>
			
		</div>
		</c:when>
		<c:otherwise>
			<div>
				<h5>아직 게시글이 없습니다</h5>
			</div>
		</c:otherwise>
	</c:choose>

</div>

<!-- foofer.jsp -->
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>