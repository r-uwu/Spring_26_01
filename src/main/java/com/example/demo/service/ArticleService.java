package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;

@Service
public class ArticleService {

	private ArticleRepository articleRepository;
	
	@Autowired
	public ArticleService(ArticleRepository articleRepository) {
		
		this.articleRepository = articleRepository;

	}

	// 서비스메서드
	public ResultData writeArticle(int loginedMemberId, String title, String body) {

		articleRepository.writeArticle(loginedMemberId,title, body);
		
		int id = articleRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 게시글 작성", id), "이번에 쓰여진 글의 id", id);
	}

	public ResultData userCanModify(int loginedMemberId, Article article) {

		if (article.getMemberId() != loginedMemberId) {
			return ResultData.from("F-A2", Ut.f("%d번 게시글에 대한 권한 없음", article.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 게시글을 수정", article.getId()));
	}

	
	public void modifyArticle(int id, String title, String body) {

		articleRepository.modifyArticle(id, title, body);
	}
	
	public Article getForPrintArticle(int loginedMemberId, int id) {

		Article article = articleRepository.getForPrintArticle(id);

		updateForPrintData(loginedMemberId, article);

		return article;
	}

	private void updateForPrintData(int loginedMemberId, Article article) {
		if (article == null) {
			return;
		}

		ResultData userCanModifyRd = userCanModify(loginedMemberId, article);
		article.setUserCanModify(userCanModifyRd.isSuccess());
	}

	public void deleteArticle(int id) {

		articleRepository.deleteArticle(id);
	}
	
	public Article getArticleById(int id) {
		return articleRepository.getArticleById(id);
	}

	public List<Article> getArticles() {
		return articleRepository.getArticles();
	}
	
	public List<Article> getArticlesinPage(int perPage, int offset){
		return articleRepository.getArticlesinPage(perPage, offset);
	}
	
	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String keyword) {
		return articleRepository.getArticlesCount(boardId, searchKeywordTypeCode, keyword);
	}

	public List<Article> getArticlesInPage(Integer boardId, int perPage, int offset, String keyword, String searchKeywordTypeCode) {
		return articleRepository.getArticlesInPage(boardId, perPage, offset, keyword, searchKeywordTypeCode);
	}

	
//	public List<Article> SearchKeywordByTitle(String keyword){
//		return articleRepository.SearchKeywordByTitle(keyword);
//	}
	
	public Article increaseHit(int id) {
		return articleRepository.increaseHit(id);
	}


	
}
