package com.example.demo.repository;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;
//import org.apache.ibatis.annotations.Select;
//import org.apache.ibatis.annotations.Update;
//import org.apache.ibatis.annotations.Delete;
//import org.apache.ibatis.annotations.Insert;

import com.example.demo.vo.Article;

@Mapper
public interface ArticleRepository {

    //INSERT INTO article SET regDate=NOW(), updateDate=NOW(), title = ?, body = ?;
	//@Insert("INSERT INTO article SET regDate=NOW(), updateDate=NOW(), title = ?, body = ?;")
	//public Article writeArticle(String title, String body);
	public int writeArticle(int memberId, String title, String body);
	
	//DELETE FROM article WHERE id = ?;
	//@Delete("DELETE FROM article WHERE id = ?;")
	public void deleteArticle(int id);

	//UPDATE article updateDate = NOW(), title = ?, body = ?;
	//@Update("UPDATE article updateDate = NOW(), title = ?, body = ?;")
	public void modifyArticle(int id, String title, String body);

	
	//SELECT * FROM article WHERE id = ?;
	//@Select("SELECT * FROM article WHERE id = ?;")
	public Article getArticleById(int id);
	
	//SELECT * FROM article ORDER BY id DESC;
	//@Select("SELECT * FROM article ORDER BY id DESC;")
	public List<Article> getArticles();

	public int getLastInsertId();

	public Article getForPrintArticle(int id);

	
//	sql.append("LIMIT ?", itemsPerPage);
//	sql.append("OFFSET ?", offset);
	public List<Article> getArticlesinPage(int perPage, int offset);
	
	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword);

	public List<Article> getArticlesInPage(Integer boardId, int perPage, int offset, String keyword);

	public int getArticlesCountAll();

	public List<Article> getArticlesInPageAll(int perPage, int offset);
	
	public List<Article> SearchKeywordByTitle(String keyword);

}
