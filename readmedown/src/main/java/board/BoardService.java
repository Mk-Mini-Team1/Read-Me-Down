package board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	@Autowired
	BoardDAO dao;
	
	//글 작성
	public int first_insert_board(BoardDTO dto) {
		return dao.first_insert_board(dto);
	};
	public int second_insert_board(BoardDTO dto) {
		return dao.second_insert_board(dto);
	};
	//글 조회
	public BoardDTO boardDetail(String board_id) {
		return dao.boardDetail(board_id);
	};
	//글 수정
	public int first_update_board(BoardDTO dto) {
		return dao.first_update_board(dto);
	};
	public int second_update_board(BoardDTO dto) {
		return dao.second_update_board(dto);
	};
	//북마크
	public int addBookmark(BookmarkDTO dto) {
		return dao.addBookmark(dto);
	};
	public int deleteBookmark(BookmarkDTO dto) {
		return dao.deleteBookmark(dto);
	};
}
