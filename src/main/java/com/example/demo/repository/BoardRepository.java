package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Board;

@Mapper
public interface BoardRepository {
	
	public Board getBoardById(int id);
	
	public Board getBoards(int id, String name, int order);

	public List<Board> getBoards();

}
