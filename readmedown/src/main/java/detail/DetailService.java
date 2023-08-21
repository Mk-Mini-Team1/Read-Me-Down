package detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.BookmarkDTO;
import user.UserDTO;

@Service
public class DetailService {
	@Autowired
	DetailDAO dao;
	

	//글 조회
	public DetailDTO detail(String board_id) {
		return dao.detail(board_id);
	};
	public UserDTO detailuser(String user_id) {
		return dao.detailuser(user_id);
	};

	public UserDTO getUserInfoByBoardId(String board_id) {
		return dao.getUserInfoByBoardId(board_id);
	};

	
	  //북마크 
	int addDBookmark(BookmarkDTO dto) { return dao.addDBookmark(dto); }; 
	int deleteDBookmark(BookmarkDTO dto) { return dao.deleteDBookmark(dto); };
	public int isDBookmarked(BookmarkDTO dto) {
  		return dao.isDBookmarked(dto);
  	}
	public void deleteBoard(DetailDTO dto) {
	    // 매퍼 메서드 호출
	    dao.deleteBoard(dto);
	}
	public List<CommentDTO> comment(String board_id) {
	    return (List<CommentDTO>) dao.comment(board_id); // 댓글 목록을 리스트로 반환하도록 수정
	}


}
