<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE WRITE"></c:set> 

<%@ include file="../common/head.jspf"%>

<hr />


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		    <c:if test="true">
		        <form action="../article/doWrite" method="post">
		            <!-- 수정할 게시글 id 숨김 -->
		            <input type="hidden" name="id" value="${article.id}" />

				<table border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">
				<tbody>
				
				<tr>
					<th>제목 </th>
					<td>
					<input type="text" id="title" name="title" style="width: 400px" placeholder="제목" required />
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td>
						<textarea id="body" name="body" rows="10" cols="30" placeholder="내용" required></textarea>
					</td>
				</tr>
				</tbody>
				</table>

		            <button type="submit" >작성하기</button>
		        </form>
		    </c:if>
		
		    <c:if test="">
		        <p>작성할 권한이 없습니다.</p>
		    </c:if>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>