<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE MODIFY"></c:set> 

<%@ include file="../common/head.jspf"%>

<hr />


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<c:if test="${not empty article}">
		    <c:if test="${article.userCanModify}">
		        <form action="../article/doModify" method="post">
		            <!-- 수정할 게시글 id 숨김 -->
		            <input type="hidden" name="id" value="${article.id}" />
		
		            <div>
		                <label for="title">제목:</label>
		                <input type="text" id="title" name="title" width="500px" value="${article.title}" required />
		            </div>
		
		            <div>
		                <label for="body">내용:</label>
		                <textarea id="body" name="body" rows="10" cols="30" required>${article.body}</textarea>
		            </div>
		
		            <button type="submit" onClick="../article/list">수정 완료</button>
		        </form>
		    </c:if>
		
		    <c:if test="${not article.userCanModify}">
		        <p>이 글을 수정할 권한이 없습니다.</p>
		    </c:if>
		</c:if>
		
		<c:if test="${empty article}">
		    <p>게시글이 존재하지 않습니다.</p>
		</c:if>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>