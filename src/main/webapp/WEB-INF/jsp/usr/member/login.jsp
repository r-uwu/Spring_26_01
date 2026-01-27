<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="LOGIN"></c:set> 

<%@ include file="../common/head.jspf"%>

<hr />


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<div>
			<label for="title">아이디:</label>
			<input type="text" id="title" name="title" value="${article.title}" required />
		</div>
		<div>
			<label for="title">비밀번호:</label>
			<input type="text" id="title" name="title" value="${article.title}" required />
		</div>
		
		<a href="../article/modify?id=${article.id }">로그인</a>

	</div>
</section>

<%@ include file="../common/foot.jspf"%>