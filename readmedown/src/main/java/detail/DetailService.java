package detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailService {
	@Autowired
	DetailDAO dao;
	

	//글 조회
	public DetailDTO detail(String board_id) {
		return dao.detail(board_id);
	};
	
	/*
	 * //북마크 int addBookmark(BookmarkDTO dto) { return dao.addBookmark(dto); }; int
	 * deleteBookmark(BookmarkDTO dto) { return dao.deleteBookmark(dto); };
	 */
}
