package com.example.demo.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Article {
	
	private int id;
	private String title;
	private String body;
	
	public Article(int id, String title, String body) {
		
		this.id = id;
		this.title = title;
		this.body = body;
	}

}
