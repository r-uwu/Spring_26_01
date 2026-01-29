package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BoardService;
import com.example.demo.vo.Board;

@Controller
@RequestMapping("/usr/board")
public class UsrBoardController {
	
    @Autowired
    private BoardService boardService;
//
//    @GetMapping("/list")
//    public String showBoardList(Model model) {
//        // 테스트용 게시판 데이터
//    	List<Board> boards = boardService.getBoards();
//
//        // JSP에 전달
//        model.addAttribute("boards", boards);
//
//        // boardList.jspf를 포함할 JSP
//        return "usr/home/main"; // main.jsp에서 boardList.jspf를 include
//    }
}