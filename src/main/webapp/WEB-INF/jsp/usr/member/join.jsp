<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MEMBER JOIN"></c:set>

<%@ include file="../common/head.jspf"%>

<hr />

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
	  <form action="/usr/member/doJoin" method="post">
	
	    <div>
	      <label for="loginId">아이디</label><br>
	      <input type="text" name="loginId" id="loginId" placeholder="아이디 입력" required>
	    </div>
	    
	    <div>
	      <label for="loginPw">비밀번호</label><br>
	      <input type="password" name="loginPw" id="loginPw" placeholder="비밀번호 입력" required>
	    </div>

	    <div>
	      <label for="loginPwConfirm">비밀번호 확인</label><br>
	      <input type="password" name="loginPwConfirm" id="loginPwConfirm" placeholder="비밀번호 재입력" required>
	    <label id="pwMsg" style="color: gray; font-size:1rem"></label>
	    </div>

	    <div>
	      <label for="username">이름</label><br>
	      <input type="text" name="name" id="name" placeholder="이름 입력" required>
	    </div>
	    
	    <div>
	      <label for="nickname">이름</label><br>
	      <input type="text" name="nickname" id="nickname" placeholder="닉네임 입력" required>
	    </div>

	    <div>
	      <label for="cellphoneNum">전화번호</label><br>
	      <input type="tel" name="cellphoneNum" id="cellphoneNum" placeholder="010-0000-0000" required>
	    </div>

	    <div>
	      <label for="email">이메일</label><br>
	      <input type="email" name="email" id="email" placeholder="example@email.com" required>
	    </div>
	
	    <div>
	      <button type="submit" id="submitBtn" disabled>가입하기</button>
	    </div>
	
	    <p style="font-size:1rem">
	      이미 계정이 있으신가요? <a href="/usr/member/login">로그인</a>
	    </p>
	
	  </form>
	  
	  	    
<script>
const pw = document.getElementById('loginPw');
const pwConfirm = document.getElementById('loginPwConfirm');
const msg = document.getElementById('pwMsg');
const btn = document.getElementById('submitBtn');

function checkPw() {
  if (pwConfirm.value === '') {
    msg.textContent = '';
    btn.disabled = true;
    return;
  }

  if (pw.value !== pwConfirm.value) {
    msg.textContent = '비밀번호가 일치하지 않습니다';
    btn.disabled = true;
  } else {
    msg.textContent = '비밀번호가 일치합니다';
    btn.disabled = false;
  }
}

pw.addEventListener('input', checkPw);
pwConfirm.addEventListener('input', checkPw);
</script>
  </div>
</section>

<style>
  #submitBtn:disabled {
    background-color: #ccc;
    color: #666;
    cursor: not-allowed;
  }

  #submitBtn:not(:disabled) {
    background-color: #4CAF50;
    color: white;
    cursor: pointer;
  }
</style>

<%@ include file="../common/foot.jspf"%>