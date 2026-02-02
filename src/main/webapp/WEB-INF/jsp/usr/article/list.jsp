<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
<p>totalPages: ${totalPages}, currentPage: ${currentPage}, totalArticles: ${totalArticles}</p>
-->

<c:if test="${boardId != 0}">
    <c:set var="pageTitle" value="${board.name} LIST"></c:set>
</c:if>
<c:if test="${boardId eq 0}">
    <c:set var="pageTitle" value="전체글보기"></c:set>
</c:if>


<%@ include file="../common/head.jspf"%>


<section class="relative mt-8 px-4 max-w-6xl mx-auto md:flex md:gap-6">

    <!-- 사이드바 -->
<aside
  id="sidebar"
  class="
    transform
    transition-transform duration-300 ease-out
    -translate-x-full md:translate-x-0

    fixed md:static
    top-20 md:top-auto
    bottom-0
    left-0

    w-56
    bg-gray-100 md:bg-transparent
    z-40
    px-4 pt-6
  "
>
    <!-- 햄버거 버튼 (사이드바에 붙음) -->
    <button
      id="hamburgerBtn"
      class="
        absolute
        -right-10
        top-4
        md:hidden
        w-10 h-10
        bg-gray-800 text-white
        rounded-r
        flex items-center justify-center
        shadow
      "
      onclick="toggleSidebar()"
    >
        ☰
    </button>



    <h3 class="text-lg font-semibold mb-4">게시판</h3>
    <ul class="space-y-2">
        <c:forEach var="board" items="${boards}">
            <li>
                <a href="/usr/article/list?boardId=${board.id}"
                   class="block px-1 py-1 transition
                   ${board.id == boardId ? 'font-bold text-blue-600' : 'hover:text-blue-500'}">
                    ${board.name}
                </a>
            </li>
        </c:forEach>
    </ul>
</aside>

<!-- 메인 콘텐츠 -->
<main class="flex-1 bg-white shadow-md rounded-lg p-6">
        <div class="flex justify-between items-center mb-4">
            <h2 class="text-2xl font-bold">${pageTitle}</h2>
            <a href="../article/write"
               class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition">
                글쓰기
            </a>
        </div>

        <div class="overflow-x-auto">
            <table class="min-w-full border border-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="text-center py-2 w-12">ID</th>
                        <th class="text-center py-2 w-32">등록일</th>
                        <th class="text-left py-2 pl-20">제목</th>
                        <th class="text-center py-2 w-32 min-w-32">작성자</th>
                    </tr>
                </thead>
                <tbody>
	                <c:choose>	
	                
	                	<c:when test="${boardId == 0}">
							<c:forEach var="article" items="${currentPageArticles}">
							    <tr class="border-t hover:bg-gray-50">
							        <td class="text-center py-2">${article.id}</td>
							        <td class="text-center py-2 whitespace-nowrap px-4">${article.regDate.substring(0,10)}</td>
									<td class="text-left py-2 overflow-hidden text-ellipsis whitespace-nowrap" style="max-width: 20ch;">
									    <a href="/usr/article/detail?id=${article.id}&boardId=${boardId}&page=${currentPage}"
									       class="text-blue-600 hover:underline">
									        ${article.title}
									    </a>
									</td>
							        <td class="text-center py-2 whitespace-nowrap">${article.extra__writer}</td>
							    </tr>
							</c:forEach>
	                    </c:when>  
	                                  
	                	<c:otherwise>
	                    	<c:forEach var="article" items="${currentPageArticles}">
	                            <tr class="border-t hover:bg-gray-50">
	                                <td class="text-center py-2">${article.id}</td>
	                                <td class="text-center py-2 whitespace-nowrap px-4">${article.regDate.substring(0,10)}</td>
	                                <td class="text-left py-2 overflow-hidden text-ellipsis whitespace-nowrap" style="max-width: 20ch;">
										<a href="/usr/article/detail?id=${article.id}&boardId=${boardId}&page=${currentPage}"
										   class="text-blue-600 hover:underline">
										    ${article.title}
										</a>
	                                </td>
	                                <td class="text-center py-2 whitespace-nowrap">${article.extra__writer}</td>
	                            </tr>
	                    	</c:forEach>
	                    </c:otherwise>

                    </c:choose>
                </tbody>
            </table>
            
<!-- 페이지네이션 -->
<c:set var="pageRangeStart" value="${currentPage - 5}" />
<c:set var="pageRangeEnd" value="${currentPage + 4}" />

<c:if test="${pageRangeStart < 1}">
    <c:set var="pageRangeStart" value="1" />
</c:if>

<c:if test="${pageRangeEnd > totalPages}">
    <c:set var="pageRangeEnd" value="${totalPages}" />
</c:if>

<div class="mt-4 flex justify-center items-center gap-2">
    <c:if test="${currentPage > 1}">
        <a href="/usr/article/list?boardId=${boardId}&page=${currentPage-1}&keyword=${keyword}"
           class="px-3 py-1 bg-gray-100 text-gray-700 rounded hover:bg-gray-200">
            &laquo; 이전
        </a>
    </c:if>

    <c:forEach var="i" begin="${pageRangeStart}" end="${pageRangeEnd}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <span class="px-3 py-1 bg-blue-500 text-white rounded font-bold">${i}</span>
            </c:when>
            <c:otherwise>
                <a href="/usr/article/list?boardId=${boardId}&page=${i}&keyword=${keyword}"
                   class="px-3 py-1 bg-white text-gray-700 rounded hover:bg-gray-200">
                    ${i}
                </a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${currentPage < totalPages}">
        <a href="/usr/article/list?boardId=${boardId}&page=${currentPage+1}&keyword=${keyword}"
           class="px-3 py-1 bg-gray-100 text-gray-700 rounded hover:bg-gray-200">
            다음 &raquo;
        </a>
    </c:if>
</div>

<!-- 검색 바 -->
<section class="mt-6 px-4 max-w-6xl mx-auto px-8">
    <form action="/usr/article/list" method="get"
          class="flex items-center gap-2">

        <input type="hidden" name="boardId" value="${boardId}" />

        <select name="searchKeywordTypeCode"
                class="border border-gray-300 px-2 py-2 rounded text-sm
                       focus:outline-none focus:ring-1 focus:ring-blue-400">
            <option value="title"
                ${searchKeywordTypeCode == 'title' ? 'selected' : ''}>제목</option>
            <option value="body"
                ${searchKeywordTypeCode == 'body' ? 'selected' : ''}>내용</option>
            <option value="titleAndBody"
                ${searchKeywordTypeCode == 'titleAndBody' ? 'selected' : ''}>제목+내용</option>
        </select>

        <input type="text"
               name="keyword"
               value="${keyword}"
               placeholder="검색"
               class="flex-1 border border-gray-300 px-3 py-2 rounded text-sm
                      focus:outline-none focus:ring-1 focus:ring-blue-400" />

        <button type="submit"
                class="px-4 py-2 bg-gray-800 text-white rounded text-sm
                       hover:bg-gray-900 transition whitespace-nowrap">
            검색
        </button>
    </form>
</section>

			            
        </div>
    </main>
</section>

<script>
  function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    sidebar.classList.toggle('-translate-x-full');
  }
</script>




<%@ include file="../common/foot.jspf"%>
