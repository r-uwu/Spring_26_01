package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.vo.Article;

public class ArticleService {

	private ArticleRepository articleRepository;
	
	@Autowired
	public ArticleService(ArticleRepository articleRepository) {
		
		this.articleRepository = articleRepository;
	
		makeTestData();
	}

	// 서비스메서드
	private void makeTestData() {
		for (int i = 1; i <= 10; i++) {
			String title = "제목 " + i;
			String body = "내용 " + i;

			articleRepository.writeArticle(title, body);
		}
	}

	public Article writeArticle(@RequestParam String title,@RequestParam String body) {
		
		return articleRepository.writeArticle(title, body);
	}
	
	public void modifyArticle(int id, String title, String body) {

		articleRepository.modifyArticle(id, title, body);
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
	
}
