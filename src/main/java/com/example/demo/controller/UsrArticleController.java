package com.example.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Controller

public class UsrArticleController {
	

	@Autowired
	private ArticleService articleService;
	
	public UsrArticleController() {
//		articleService = new ArticleService(); --> @Autowired로 대체 됨
	}
	
	
	@RequestMapping("/usr/home/list")
	@ResponseBody
	public List<Article> articleList(){
		return articleService.getArticles();
	}

	

	// 액션메서드
	@RequestMapping("/usr/article/getArticle")
	@ResponseBody
	public ResultData getArticle(int id) {

		Article article = articleService.getArticleById(id);

		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시글은 없음", id));
		}

		return ResultData.from("S-1", Ut.f("%d번 게시글입니다.", id), article);
	}
	
	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public ResultData<Article> doModify(HttpSession session, int id, String title, String body) {
		
		boolean isLogined = false;
		int loginedMemberId = 0;

		if (session.getAttribute("loginedMemberId") != null) {
			isLogined = true;
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}

		if (isLogined == false) {
			return ResultData.from("F-A", "로그인이 필요합니다");
		}
		Article article = articleService.getArticleById(id);

		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시글은 없음", id));
		}
		
		articleService.modifyArticle(id, title, body);
		article = articleService.getArticleById(id);
		
		return ResultData.from("S-1", Ut.f("%d번 게시글이 수정됨", id), article);
	}
	
	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public ResultData<Integer> doDelete(HttpSession session, int id) {
		
		boolean isLogined = false;
		int loginedMemberId = 0;

		if (session.getAttribute("loginedMemberId") != null) {
			isLogined = true;
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}

		if (isLogined == false) {
			return ResultData.from("F-A", "로그인이 필요합니다");
		}

		Article article = articleService.getArticleById(id);

		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시글은 없음", id));
		}

		return ResultData.from("S-1", Ut.f("%d번 게시글이 삭제됨", id), id);
	}


	@RequestMapping("/usr/article/doWhite")
	@ResponseBody
	public ResultData<Article> doWrite(HttpSession session, String title, String body) {

		boolean isLogined = false;
		int loginedMemberId = 0;

		if (session.getAttribute("loginedMemberId") != null) {
			isLogined = true;
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}

		if (isLogined == false) {
			return ResultData.from("F-A", "로그인이 필요합니다");
		}
		if (Ut.isEmptyOrNull(title)) {
			return ResultData.from("F-1", "제목을 작성하세요");
		}
		if (Ut.isEmptyOrNull(body)) {
			return ResultData.from("F-2", "내용을 작성하세요");
		}

		ResultData doWriteRd = articleService.writeArticle(loginedMemberId, title, body);

		int id = (int) doWriteRd.getData1();

		Article article = articleService.getArticleById(id);

		return ResultData.newData(doWriteRd, article);
	}
	
}


