package detail;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;
import user.UserDTO;

@Component
@Data
public class DetailDTO {
	String board_id, user_id, title, contents, write_date, update_date,  board_img, board_link, board_tag, codes, secret;
	int views, bookmarks;
	Date delete_date;
	boolean bookmarked;
	  UserDTO user; // Add UserDTO field
}