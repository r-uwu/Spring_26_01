package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.vo.Board;

@Service
public class BoardService {

    // 실제로는 DB에서 가져오겠지만, 테스트용으로 하드코딩
    public List<Board> getBoards() {
        List<Board> boards = new ArrayList<>();
        boards.add(new Board(1, "게시판1", "board1", 1));
        boards.add(new Board(2, "게시판2", "board2", 2));
        boards.add(new Board(3, "게시판3", "board3", 3));
        return boards;
    }

}