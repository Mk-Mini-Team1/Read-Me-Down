package mypage;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MyBoardDTO {
	String board_id, user_id, title, contents, write_date, update_date, delete_date, board_img, board_link, board_tag, codes, secret;
	int views, bookmarks;
	boolean bookmarked;
	String secretStatus;
    
}