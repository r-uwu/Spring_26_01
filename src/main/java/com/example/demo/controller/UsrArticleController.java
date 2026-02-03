package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.example.demo.service.BoardService;
import com.example.demo.service.ArticleService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrArticleController {
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private Rq rq;



	// 액션메서드
	@RequestMapping("/usr/article/detail")
	public String showDetail(HttpServletRequest req, Model model, int id) {

		Rq rq = (Rq) req.getAttribute("rq");
		
		articleService.increaseHit(id); 
		
		Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);
		

		model.addAttribute("article", article);

		
		return "usr/article/detail";
	
	}
	
	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public Object doModify(HttpServletRequest req, int id, String title, String body) {
		
		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined() == false) {
			return ResultData.from("F-A", "로그인이 필요합니다");
		}
		Article article = articleService.getArticleById(id);

		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시글은 없음", id));
		}
		
		ResultData userCanModifyRd = articleService.userCanModify(rq.getLoginedMemberId(), article);

		if (userCanModifyRd.isFail()) {
			return ResultData.from(userCanModifyRd.getResultCode(), userCanModifyRd.getMsg());
		}

		articleService.modifyArticle(id, title, body);
		article = articleService.getArticleById(id);

		//return ResultData.from(userCanModifyRd.getResultCode(), userCanModifyRd.getMsg(),"이번에 수정된 글 ", article);
				
		return Ut.jsReplace("S-D","게시글이 수정되었습니다","/usr/article/detail?id="+id);
	}
	
	@RequestMapping("/usr/article/modify")
	public String showModifyPage(HttpServletRequest req, Model model, int id) {
		
		Rq rq = (Rq) req.getAttribute("rq");

	    Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);

	    if (article == null) {
	        return "redirect:/usr/article/list";
	    }
	    if (!article.isUserCanModify()) {
	    	return "redirect:/usr/article/detail?id=" + id;
	    }

	    model.addAttribute("article", article);
	    return "usr/article/modify";
	}
	
	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(HttpServletRequest req, int id) {
		
		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined() == false) {
			return Ut.jsReplace("F-A", "로그인이 필요합니다","../member/login");
		}

		Article article = articleService.getArticleById(id);

		if (article == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 게시글은 없음", id));
		}
		
		ResultData userCanDeleteRd = articleService.userCanModify(rq.getLoginedMemberId(), article);
		
		if (userCanDeleteRd.isFail()) {
			return Ut.jsHistoryBack(userCanDeleteRd.getResultCode(), userCanDeleteRd.getMsg());
		}

		if (userCanDeleteRd.isSuccess()) {
			articleService.deleteArticle(id);
		}
		
//		if (article.getMemberId() != loginedMemberId) {
//			return ResultData.from("F-A2", "권한없음");
//		}
		return Ut.jsReplace(userCanDeleteRd.getResultCode(), userCanDeleteRd.getMsg(), "../article/list");
		//return ResultData.from("S-1", Ut.f("%d번 게시글이 삭제됨", id), "이번에 삭제된 게시글의 id", id);
	}
	
//	@RequestMapping("/usr/article/getArticles")
//	@ResponseBody
//	public ResultData<List<Article>> getArticles() {
//		List<Article> articles = articleService.getArticles();
//
//		return ResultData.from("S-1", Ut.f("게시글 목록"), "article 리스트", articles);
//	}
	
	@RequestMapping("/usr/article/list")
	public String showList(HttpSession session, Model model, Integer boardId, String searchKeywordTypeCode, Integer page, String keyword ) {

	    if (boardId == null) {
	        boardId = 0;
	    }
	    
	    
	    if (page == null || page <= 0) {
	        page = 1;
	    }
	    
	    if (keyword != null) {
	        session.setAttribute("keyword", keyword);
	    } else {
	        keyword = (String) session.getAttribute("keyword");
	    }
	    if(keyword == null) keyword = "";
	    
	    if (searchKeywordTypeCode != null) {
	        session.setAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
	    } else {
	        searchKeywordTypeCode = (String) session.getAttribute("searchKeywordTypeCode");
	    }
	    if(searchKeywordTypeCode == null)
	    {
	    	searchKeywordTypeCode="title";
	    }
	    
	    
	    // 세션에 현재 리스트 페이지 저장
	    String prevListPage = "/usr/article/list?boardId=" + boardId + "&page=" + page;
	    session.setAttribute("prevListPage", prevListPage);
		
		Board board = boardService.getBoardById(boardId);
		
		List<Article> articles = articleService.getArticles();
	    List<Board> boards = boardService.getBoards(); // 모든 게시판 가져오기
	    
	    model.addAttribute("boards", boards);
		model.addAttribute("articles", articles);
		model.addAttribute("board", board);
	    model.addAttribute("boardId", boardId);
	    
	    int perPage = 10;
	    int offset =  (page-1) * perPage;
	    
	    int totalArticles = articleService.getArticlesCount(boardId, searchKeywordTypeCode, keyword);
	    
	    List<Article> currentPageArticles =
	            articleService.getArticlesInPage(boardId, perPage, offset, keyword, searchKeywordTypeCode);
	    
   
	    int totalPages = (perPage > 0) ? (totalArticles / perPage) + (totalArticles % perPage > 0 ? 1 : 0) : 1;
	    if (totalPages < 1) totalPages = 1;
	    
	    model.addAttribute("currentPageArticles", currentPageArticles);
	    model.addAttribute("totalArticles", totalArticles);
	    model.addAttribute("offset", offset);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("perPage", perPage);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
	    
		return "/usr/article/list";
	}
	
	@RequestMapping("/usr/article/write")
	public String showLogin() {
		return "/usr/article/write";
	}
	
	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public Object doWrite(HttpServletRequest req, String title, String body) {

		Rq rq = (Rq) req.getAttribute("rq");

		if (rq.isLogined() == false) {
			return ResultData.from("F-A", "로그인이 필요합니다");
		}
		if (Ut.isEmptyOrNull(title)) {
			return ResultData.from("F-1", "제목을 작성하세요");
		}
		if (Ut.isEmptyOrNull(body)) {
			return ResultData.from("F-2", "내용을 작성하세요");
		}

		ResultData doWriteRd = articleService.writeArticle(rq.getLoginedMemberId(), title, body);

		int id = (int) doWriteRd.getData1();

		Article article = articleService.getArticleById(id);

		//return ResultData.newData(doWriteRd, "이번에 쓰여진 글 / 새로 INSERT 된 article", article);
		return Ut.jsReplace("S-W","게시글 작성이 완료되었습니다","/usr/article/detail?id="+id);
	}
	
}


