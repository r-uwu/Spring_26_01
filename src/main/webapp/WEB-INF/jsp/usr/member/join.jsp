<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MEMBER JOIN"></c:set>

<%@ include file="../common/head.jspf"%>

<hr />

<section class="mt-8 text-xl px-4">
  <div class="mx-auto">
    <form action="/usr/member/doJoin" method="post">
      <table border="0" cellspacing="5" cellpadding="5" style="width: 100%; border-collapse: collapse;">
        <tbody>
          <tr>
            <th><label for="loginId">아이디</label></th>
            <td><input type="text" name="loginId" id="loginId" placeholder="아이디 입력" required></td>
          </tr>

          <tr>
            <th><label for="loginPw">비밀번호</label></th>
            <td>
              <input type="password" name="loginPw" id="loginPw" placeholder="비밀번호 입력" required>
            </td>
          </tr>

          <tr>
            <th><label for="loginPwConfirm">비밀번호 확인</label></th>
            <td>
              <input type="password" name="loginPwConfirm" id="loginPwConfirm" placeholder="비밀번호 재입력" required>
              <br><label id="pwMsg" style="color: gray; font-size:0.9rem"></label>
            </td>
          </tr>

          <tr>
            <th><label for="name">이름</label></th>
            <td><input type="text" name="name" id="name" placeholder="이름 입력" required></td>
          </tr>

          <tr>
            <th><label for="nickname">닉네임</label></th>
            <td><input type="text" name="nickname" id="nickname" placeholder="닉네임 입력" required></td>
          </tr>

          <tr>
            <th><label for="cellphoneNum">전화번호</label></th>
            <td><input type="tel" name="cellphoneNum" id="cellphoneNum" placeholder="010-0000-0000" required></td>
          </tr>

          <tr>
            <th><label for="email">이메일</label></th>
            <td><input type="email" name="email" id="email" placeholder="example@email.com" required></td>
          </tr>

          <tr>
            <td colspan="2" style="text-align:end;">
              <button type="submit" id="submitBtn" disabled>가입하기</button>
            </td>
          </tr>

          <tr>
            <td colspan="2" style="text-align:end; font-size:0.9rem;">
              이미 계정이 있으신가요? <a href="/usr/member/login">로그인</a>
            </td>
          </tr>
        </tbody>
      </table>
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
  </div>
</section>

<%@ include file="../common/foot.jspf"%>
