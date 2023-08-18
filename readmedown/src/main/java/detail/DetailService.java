package detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.BookmarkDTO;

@Service
public class DetailService {
	@Autowired
	DetailDAO dao;
	

	//글 조회
	public DetailDTO detail(String board_id) {
		return dao.detail(board_id);
	};
	
	
	  //북마크 
	int addDBookmark(BookmarkDTO dto) { return dao.addDBookmark(dto); }; 
	int deleteDBookmark(BookmarkDTO dto) { return dao.deleteDBookmark(dto); };
	public int isDBookmarked(BookmarkDTO dto) {
  		return dao.isDBookmarked(dto);
  	};
}
