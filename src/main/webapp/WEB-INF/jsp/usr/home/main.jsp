<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MAIN PAGE"></c:set>

<%@ include file="../common/head.jspf"%>

<hr />

<section class="mt-8 px-4">
  <div class="max-w-6xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-6">
    
    <!-- 왼쪽 사이드 영역 -->
    <div class="bg-white shadow rounded p-6">
      <h2 class="text-xl font-semibold mb-4">공지사항</h2>
      <p class="text-gray-700 text-sm">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic exercitationem quasi aliquid perferendis iure
        ratione minima amet nostrum numquam repellat ullam eaque fugit magni! Id quibusdam nemo sed debitis ducimus.
      </p>
    </div>

    <!-- 가운데 콘텐츠 -->
    <div class="col-span-2 bg-white shadow rounded p-6">
      <h2 class="text-xl font-semibold mb-4">환영합니다!</h2>
      <p class="text-gray-700 text-base mb-2">
        안녕하세요. 여기는 메인 페이지입니다. 원하는 콘텐츠를 여기에 넣을 수 있습니다.
      </p>
      <p class="text-gray-700 text-base">
        최신 게시글, 공지사항, 링크 등을 이 영역에 배치하면 깔끔하고 보기 좋습니다.
      </p>
    </div>

  </div>
</section>

<%@ include file="../common/foot.jspf"%>
