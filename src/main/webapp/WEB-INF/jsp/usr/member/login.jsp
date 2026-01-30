<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MEMBER LOGIN"></c:set>

<%@ include file="../common/head.jspf"%>

<hr />

<section class="mt-8 px-4">
    <div class="mx-auto max-w-md bg-white shadow-md rounded-lg p-8">
        <h2 class="text-3xl font-semibold mb-6 text-center">회원 로그인</h2>

        <form action="../member/doLogin" method="POST">
            <table class="w-full border-collapse">
                <tbody>
                    <tr>
                        <th class="text-left py-3 pr-4 align-top w-32">아이디</th>
                        <td class="py-2">
                            <input id="loginId" name="loginId" type="text" autocomplete="off" placeholder="아이디 입력"
                                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400" required />
                        </td>
                    </tr>
                    <tr>
                        <th class="text-left py-3 pr-4 align-top">비밀번호</th>
                        <td class="py-2">
                            <input id="loginPw" name="loginPw" type="password" autocomplete="off" placeholder="비밀번호 입력"
                                   class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400" required />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-right pt-6">
                            <button type="submit" 
                                    class="px-8 py-3 rounded transition bg-blue-500 text-white hover:bg-blue-600 font-semibold">
                                로그인
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-right text-sm text-gray-600 pt-2">
                            계정이 없으신가요? <a href="/usr/member/join" class="text-blue-500 hover:underline">회원가입</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-right pt-2">
                            <button type="button" onClick="history.back();" 
                                    class="px-4 py-2 bg-gray-200 rounded hover:bg-gray-300 transition">
                                이전 페이지로 돌아가기
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</section>

<%@ include file="../common/foot.jspf"%>