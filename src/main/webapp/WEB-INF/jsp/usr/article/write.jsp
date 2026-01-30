<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE WRITE"></c:set> 

<%@ include file="../common/head.jspf"%>

<section class="mt-8 px-4">
    <div class="max-w-3xl mx-auto bg-white p-6 rounded-lg shadow-md">
        
        <h2 class="text-2xl font-bold mb-6">${pageTitle}</h2>
        
        <!-- 작성 가능 여부 확인 -->
        <c:if test="true">
            <form action="${pageContext.request.contextPath}/usr/article/doWrite" method="post" class="space-y-6">

                <!-- 제목 -->
                <div class="flex flex-col">
                    <label for="title" class="font-semibold mb-1">제목</label>
                    <input type="text" id="title" name="title" placeholder="제목" required
                           class="border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400" />
                </div>

                <!-- 내용 -->
                <div class="flex flex-col">
                    <label for="body" class="font-semibold mb-1">내용</label>
                    <textarea id="body" name="body" rows="10" placeholder="내용" required
                              class="border border-gray-300 rounded px-3 py-2 resize-y focus:outline-none focus:ring-2 focus:ring-blue-400"></textarea>
                </div>

                <div>
                    <button type="submit" 
                            class="bg-blue-500 text-white px-6 py-2 rounded hover:bg-green-600 transition">
                        작성하기
                    </button>
                </div>

            </form>
        </c:if>

        <c:if test="false">
            <p class="text-red-600 font-semibold">작성할 권한이 없습니다.</p>
        </c:if>

    </div>
</section>

<%@ include file="../common/foot.jspf"%>