package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.repository.MemberRepository;
import com.example.demo.vo.Member;

public class MemberService {

	private MemberRepository memberRepository;
	
	@Autowired
	public MemberService(MemberRepository memberRepository)
	{
		this.memberRepository = memberRepository;
	}
	
	public int doJoin (String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email)
	{
		Member existsMember = getMemberByLoginId(loginId);
		System.out.println("existsMember : " + existsMember);

		if (existsMember != null) {
			return -1;
		}
		
		memberRepository.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);
		
		return memberRepository.getLastInsertId();
	}
	
	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}
	
	public Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}
}
