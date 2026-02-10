<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>

<%@ include file="../common/head.jspf"%>

<script>
	const params = {};
	params.id = parseInt('${param.id}');
</script>

<script>
	function ArticleDetail__doIncreaseHitCount() {
		console.log('ajax call start, id =', params.id);
		
		$.get('../article/doIncreaseHitCountRd', {
			id : params.id,
			ajaxMode : 'Y'
		}, function(data) {
			console.log('ajax success', data);
			
			$('.article-detail__hit-count').html(data.data1);
			console.log(data);
			console.log('data.msg : ' + data.msg);
			console.log('data.data1 : ' + data.data1);
		}, 'json')
		.fail(function(jqXHR, textStatus, errorThrown) {
	        console.error('ajax failed', textStatus, errorThrown);
	    });
	}

	$(function() {
		ArticleDetail__doIncreaseHitCount();
		 		//setTimeout(ArticleDetail__doIncreaseHitCount, 2000);
	})
</script>

<script>
async function doReaction(id, type) {
    console.log(type + " 시도 게시물 번호:", id);

    try {
        const url = '/usr/article/do' + type + '?articleId=' + id;
        
        const response = await fetch(url);
        const rd = await response.json();

        alert(rd.msg || rd.message);
        
        if (rd.success) {
            location.reload();
        }
    } catch (e) {
        console.error("통신 에러:", e);
        alert("에러가 발생했습니다.");
    }
}
</script>

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
                        <th class="py-2 text-gray-500">Hit</th>
                        <td style="text-align: center;">
							<span class="article-detail__hit-count">${article.hit}</span>
						</td>
                        <script></script>
                    </tr>
                    <tr>
                        <th class="py-2 text-gray-500 align-top">Body</th>
                        <td class="py-2 text-gray-800 whitespace-pre-wrap">${article.body}</td>
                    </tr>
                </tbody>
            </table>

            <!-- 버튼 그룹 -->
            <div class="flex flex-wrap gap-3 mt-4">
            <button onClick="doReaction(${article.id},'Like')" class="px-4 py-2 bg-gray-200 text-gray-800 rounded-lg hover:bg-blue-300 hover:text-white transition">
            좋아요 <span id="like-count">${article.likeCount}</span></button>
            <button onClick="doReaction(${article.id},'Dislike')" class="px-4 py-2 bg-gray-200 text-gray-800 rounded-lg hover:bg-white hover:text-gray-500 transition">
            싫어요 <span id="dislike-count">${article.dislikeCount}</span></button>
            </div>
            
            
            
            
            
               
            <div class="flex flex-wrap gap-3 mt-4">
			    <a href="${sessionScope.prevListPage != null ? sessionScope.prevListPage : '/usr/article/list'}" 
			       class="px-4 py-2 bg-gray-200 text-gray-800 rounded-lg hover:bg-gray-300 transition">
			        뒤로가기
			    </a>

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