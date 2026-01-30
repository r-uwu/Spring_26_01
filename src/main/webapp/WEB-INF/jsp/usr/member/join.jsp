<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MEMBER JOIN"></c:set>

<%@ include file="../common/head.jspf"%>

<hr />

<section class="mt-8 px-4">
  <div class="mx-auto max-w-lg bg-white shadow-md rounded-lg p-8">
    <h2 class="text-3xl font-semibold mb-6 text-center">회원가입</h2>

    <form action="/usr/member/doJoin" method="post">
      <table class="w-full border-collapse">
        <tbody>
          <tr class="mb-4">
            <th class="text-left py-3 pr-4 w-32 align-top">아이디</th>
            <td class="py-2">
              <input type="text" name="loginId" placeholder="아이디 입력" required
                     class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400" />
            </td>
          </tr>

          <tr>
            <th class="text-left py-3 pr-4 align-top">비밀번호</th>
            <td class="py-2">
              <input type="password" name="loginPw" id="loginPw" placeholder="비밀번호 입력" required
                     class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400" />
            </td>
          </tr>

          <tr>
            <th class="text-left py-3 pr-4 align-top">비밀번호 확인</th>
            <td class="py-2">
              <input type="password" name="loginPwConfirm" id="loginPwConfirm" placeholder="비밀번호 재입력" required
                     class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400" />
              <p id="pwMsg" class="text-sm text-gray-500 mt-1"></p>
            </td>
          </tr>

          <tr>
            <th class="text-left py-3 pr-4 align-top">이름</th>
            <td class="py-2">
              <input type="text" name="name" placeholder="이름 입력" required
                     class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400" />
            </td>
          </tr>

          <tr>
            <th class="text-left py-3 pr-4 align-top">닉네임</th>
            <td class="py-2">
              <input type="text" name="nickname" placeholder="닉네임 입력" required
                     class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400" />
            </td>
          </tr>

          <tr>
            <th class="text-left py-3 pr-4 align-top">전화번호</th>
            <td class="py-2">
              <input type="tel" name="cellphoneNum" placeholder="010-0000-0000" required
                     class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400" />
            </td>
          </tr>

          <tr>
            <th class="text-left py-3 pr-4 align-top">이메일</th>
            <td class="py-2">
              <input type="email" name="email" placeholder="example@email.com" required
                     class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400" />
            </td>
          </tr>

          <tr>
            <td colspan="2" class="text-right pt-6">
              <button type="submit" id="submitBtn" disabled
                      class="px-8 py-3 rounded transition disabled:bg-gray-300 disabled:text-gray-600 disabled:cursor-not-allowed
                             bg-green-500 text-white hover:bg-green-600 font-semibold">
                가입하기
              </button>
            </td>
          </tr>

          <tr>
            <td colspan="2" class="text-right text-sm text-gray-600 pt-2">
              이미 계정이 있으신가요? <a href="/usr/member/login" class="text-blue-500 hover:underline">로그인</a>
            </td>
          </tr>
        </tbody>
      </table>
    </form>
  </div>

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
</section>

<%@ include file="../common/foot.jspf"%>