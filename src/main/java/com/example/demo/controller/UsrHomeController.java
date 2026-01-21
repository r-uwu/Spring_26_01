package com.example.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Controller
public class UsrHomeController {
	
	int lastArticleId;
	List<Article> articles;
	
	public UsrHomeController() {
		articles = new ArrayList<>();
		lastArticleId = 0;
	}
	
	
	@RequestMapping("/usr/home/doAdd")
	@ResponseBody
	public Article doAdd(@RequestParam String title,@RequestParam String body) {
		
		lastArticleId++;
		int id = lastArticleId;
		Article article = new Article(id, title, body);
		articles.add(article);
		return article;	
	}
	
	@RequestMapping("/usr/home/list")
	@ResponseBody
	public List<Article> articleList(){
		return articles;
	}
	

	@RequestMapping("/usr/home/getArticle")
	@ResponseBody
	public Article getArticle() {
		
		return null;
	}	
}


@Data
@AllArgsConstructor
@Getter
@Setter
class Article {
	
	private int id;
	private String title;
	private String body;
	
	public Article(int id, String title, String body) {
		
		this.id = id;
		this.title = title;
		this.body = body;
	}

}


