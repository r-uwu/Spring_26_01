package com.example.demo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Member;

import jakarta.servlet.http.HttpSession;

@Controller
public class UsrMemberController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public ResultData doLogout(HttpSession session) {

		boolean isLogined = false;

		if (session.getAttribute("loginedMemberId") != null) {
			isLogined = true;
		}

		if (!isLogined) {
			return ResultData.from("F-A", "이미 로그아웃중");
		}

		session.removeAttribute("loginedMemberId");

		return ResultData.from("S-1", "로그아웃 되었습니다");
	}
	
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public ResultData<Member> doLogin(HttpSession session, String loginId, String loginPw) {

		boolean isLogined = false;

		if (session.getAttribute("loginedMemberId") != null) {
			isLogined = true;
		}

		if (isLogined) {
			return ResultData.from("F-A", "이미 로그인중");
		}

		if (Ut.isEmptyOrNull(loginId)) {
			return ResultData.from("F-1", "loginId 입력해");
		}
		if (Ut.isEmptyOrNull(loginPw)) {
			return ResultData.from("F-2", "loginPw 입력해");
		}

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			return ResultData.from("F-3", Ut.f("%s는 없는 아이디", loginId));
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			return ResultData.from("F-4", "비밀번호 x");
		}

		session.setAttribute("loginedMemberId", member.getId());

		return ResultData.from("S-1", Ut.f("%s님 환영합니다", member.getNickname()), member);
	}

	@RequestMapping("/usr/member/join")
	@ResponseBody
	public Object doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {
		
		if (Ut.isEmptyOrNull(loginId)) {
			return "loginId를 입력하세요";
		}
		if (Ut.isEmptyOrNull(loginPw)) {
			return "loginPw를 입력하세요";
		}
		if (Ut.isEmptyOrNull(name)) {
			return "name를 입력하세요";
		}
		if (Ut.isEmptyOrNull(nickname)) {
			return "nickname를 입력하세요";
		}
		if (Ut.isEmptyOrNull(cellphoneNum)) {
			return "cellphoneNum를 입력하세요";
		}
		if (Ut.isEmptyOrNull(email)) {
			return "email를 입력하세요";
		}
		
		int id = memberService.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);

		if(id == -1) {
			return Ut.f("이미 사용중인 loginId(%s) 입니다", loginId);
		}
		if(id == -2) {
			return Ut.f("이미 사용중인 name(%s)과 email(%s) 입니다", name, email);
		}
		
		Member member = memberService.getMemberById(id);

		return member;
	}

}
