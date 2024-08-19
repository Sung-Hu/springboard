<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header.jsp  -->
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container p-5">
    <div class="card">
        <div class="card-header">
            <b>글수정 화면입니다</b>
        </div>
        <div class="card-body">
            <form action="/board/update" method="post">
                <input type="hidden" name="id" value="${post.id}">
                <label for="title">제목:</label>
                <input type="text" id="title" name="title" value="${post.title}" required>
                <br>
                <label for="content">내용:</label>
                <textarea id="content" name="content" required>${post.content}</textarea>
                <br>
                <label for="username">작성자:</label>
                <input type="text" id="username" name="username" value="${post.username}" required>
                <br>
                <button type="submit">수정</button>
            </form>
        </div>
    </div>
</div>

<!-- footer.jsp  -->
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
