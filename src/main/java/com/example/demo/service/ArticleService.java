package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.vo.Article;

public class ArticleService {
	private int lastArticleId;
	public List<Article> articles;
	
	public ArticleService() {
		articles = new ArrayList<>();
		lastArticleId = 0;
		
		makeTestData();
	}

	// 서비스메서드
	private void makeTestData() {
		for (int i = 1; i <= 10; i++) {
			String title = "제목 " + i;
			String body = "내용 " + i;

			writeArticle(title, body);
		}
	}

	public Article writeArticle(@RequestParam String title,@RequestParam String body) {
		
		lastArticleId++;
		int id = lastArticleId;
		Article article = new Article(id, title, body);
		articles.add(article);
		return article;	
	}
	
	

	public Article getArticleById(int id) {
		for (Article article : articles) {
			if (article.getId() == id) {
				return article;
			}
		}
		return null;
	}
	

	public void modifyArticle(int id, String title, String body) {

		Article article = getArticleById(id);
		article.setTitle(title);
		article.setBody(body);


	}

	public void deleteArticle(int id) {

		Article article = getArticleById(id);
		articles.remove(article);
	}

}
