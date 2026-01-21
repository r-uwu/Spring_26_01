package com.example.demo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Controller

public class UsrHomeController {
	
	@RequestMapping("/usr/home/main")
	@ResponseBody
	public String showMain() {
		return "안녕";
	}
	
	@RequestMapping("/usr/home/main2")
	@ResponseBody
	public String showMain2() {
		return "잘가";
	}
	
	@RequestMapping("/usr/home/main3")
	@ResponseBody
	public int showMain3() {
		int a = 1;
		int b = 2;
		return a+b;
	}
	

	int count;
	
	public UsrHomeController() {
		count = 0;
	}
	
	@RequestMapping("/usr/home/count")
	@ResponseBody
	public int count() {
		return ++count;
	}
	
	@RequestMapping("/usr/home/setCountValue")
	@ResponseBody
	public String setCountValue(@RequestParam(defaultValue = "0") int value) {
		this.count = value;
		return "밸류 설정 완료 : "+value;
	}
	
	@RequestMapping("/usr/home/getMap")
	@ResponseBody
	public Map<String, Object> getMap() {
		Map<String, Object> map = new HashMap<>();
		
		map.put("1번값 ", 10);
		map.put("2번값 ", 20);
		
		return map;	
	}
	
	@RequestMapping("/usr/home/getList")
	@ResponseBody
	public List<String> getList() {

		List<String> list = new ArrayList<>();
		list.add("밍맹뭉");
		list.add("배가 고픔,,,");
		return list;	
	}
	
	@RequestMapping("/usr/home/getDouble")
	@ResponseBody
	public Double getDouble()
	{
		double d = 1234;
		return d;
	}
	
	@RequestMapping("/usr/home/getBoolean")
	@ResponseBody
	public boolean getBoolean()
	{
		boolean bool = true;
		return bool;
	}

	@RequestMapping("/usr/home/getArticle")
	@ResponseBody
	public Article getArticle() {
		Article article = new Article();
		
		return article;	
	}	
}

@AllArgsConstructor
@Getter
@Setter
class Article {
	public int id;
	public String title;
	private String body;
}


