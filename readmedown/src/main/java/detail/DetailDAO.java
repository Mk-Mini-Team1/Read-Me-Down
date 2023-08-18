package detail;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface DetailDAO {
	
	//글 조회
	DetailDTO detail(String board_id);
	
	//북마크
	/*
	 * int addBookmark(BookmarkDTO dto); int deleteBookmark(BookmarkDTO dto);
	 */
	
}//class
