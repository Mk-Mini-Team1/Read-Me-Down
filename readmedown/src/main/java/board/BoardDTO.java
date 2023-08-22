package board;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardDTO {
	String board_id, user_id, title, contents, write_date, update_date, delete_date, board_img, board_link, board_tag, codes, secret;
	int views, bookmarks;
	boolean bookmarked;
	BookmarkDTO bookmarkdto;
}