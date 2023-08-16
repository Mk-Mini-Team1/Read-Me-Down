package main;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import board.BoardDTO;

@Mapper
public interface MainDAO {
	
	//글목록
	public List<BoardDTO> mainBoardList();

}
