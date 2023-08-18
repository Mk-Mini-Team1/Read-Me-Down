package detail;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import board.BookmarkDTO;

@Mapper
@Repository
public interface DetailDAO {
	
	//글 조회
	DetailDTO detail(String board_id);
	
	//북마크
 int addDBookmark(BookmarkDTO dto); 
 int deleteDBookmark(BookmarkDTO dto);
public Integer isDBookmarked(BookmarkDTO dto);
	
	
}//class
