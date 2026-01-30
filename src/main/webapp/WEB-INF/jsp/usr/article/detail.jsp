<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>

<%@ include file="../common/head.jspf"%>

<section class="mt-8 px-4">
    <div class="max-w-4xl mx-auto bg-white border border-gray-200 rounded-xl overflow-hidden">

        <!-- 제목 영역 -->
        <div class="bg-gray-100 px-6 py-4">
            <h2 class="text-2xl font-semibold text-gray-800">${pageTitle}</h2>
        </div>

        <!-- 게시글 정보 -->
        <div class="p-6 space-y-4">
            <table class="w-full text-left border-collapse">
                <tbody class="divide-y divide-gray-200">
                    <tr>
                        <th class="w-1/4 py-2 text-gray-500">ID</th>
                        <td class="py-2 text-gray-800">${article.id}</td>
                    </tr>
                    <tr>
                        <th class="py-2 text-gray-500">Writer</th>
                        <td class="py-2 text-gray-800">${article.extra__writer}</td>
                    </tr>
                    <tr>
                        <th class="py-2 text-gray-500">Registration Date</th>
                        <td class="py-2 text-gray-800">${article.regDate.substring(0,10)}</td>
                    </tr>
                    <tr>
                        <th class="py-2 text-gray-500">Update Date</th>
                        <td class="py-2 text-gray-800">${article.updateDate.substring(0,10)}</td>
                    </tr>
                    <tr>
                        <th class="py-2 text-gray-500">Title</th>
                        <td class="py-2 text-gray-800 font-medium">${article.title}</td>
                    </tr>
                    <tr>
                        <th class="py-2 text-gray-500 align-top">Body</th>
                        <td class="py-2 text-gray-800 whitespace-pre-wrap">${article.body}</td>
                    </tr>
                </tbody>
            </table>

            <!-- 버튼 그룹 -->
            <div class="flex flex-wrap gap-3 mt-4">
                <button type="button" onclick="history.back();" 
                        class="px-4 py-2 bg-gray-200 text-gray-800 rounded-lg hover:bg-gray-300 transition">
                    뒤로가기
                </button>

                <c:if test="${article.userCanModify}">
                    <a href="../article/modify?id=${article.id}" 
                       class="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition">
                        수정
                    </a>
                    <a href="../article/doDelete?id=${article.id}" 
                       class="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600 transition">
                        삭제
                    </a>
                </c:if>
            </div>
        </div>
    </div>
</section>

<%@ include file="../common/foot.jspf"%>