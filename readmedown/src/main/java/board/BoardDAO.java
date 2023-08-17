package board;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface BoardDAO {
	//글 작성
	int first_insert_board(BoardDTO dto);
	int second_insert_board(BoardDTO dto);
	//글 조회
	BoardDTO boardDetail(String board_id);
	//글 수정
	int first_update_board(BoardDTO dto);
	int second_update_board(BoardDTO dto);
	//북마크
	int addBookmark(BookmarkDTO dto);
	int deleteBookmark(BookmarkDTO dto);
	
	
}//class
