<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- header.jsp  -->
	<%@ include file="/WEB-INF/views/layout/header.jsp" %>	
	
	<div class="container p-5">
    <div class="card">
        <div class="card-header"><b>익명 글쓰기 화면입니다</b></div>
        <div class="card-body">
            <form action="/board/save" method="post">
                <div class="mb-3">
                  <label for="username">작성자:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="mb-3">
                <label for="title">제목:</label>
                    <input type="text" class="form-control" id="title" placeholder="Enter title" name="title">
                </div>
                <div class="mb-3">
                <label for="content">내용:</label>
                    <textarea class="form-control" rows="5"  id="content" name="content"></textarea>
                </div>
                <button type="submit" class="btn btn-primary form-control">글쓰기완료</button>
                
            </form>
        </div>
    </div>
</div>

<!-- footer.jsp  -->
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>	