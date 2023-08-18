package main;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import board.BoardDTO;
import board.BookmarkDTO;
import pagination.SearchDTO;

@Mapper
public interface MainDAO {
	//글목록
	public int allBoardCnt();
	public List<BoardDTO> allBoardList(SearchDTO dto);
	//유저 북마크 목록
	public List<BookmarkDTO> userBookmarkList(String user_id);
	//유저 북마크 여부
	public Integer isBookmarked(BookmarkDTO dto);
	
}
