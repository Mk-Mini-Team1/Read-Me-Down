package detail;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;
import user.UserDTO;

@Component
@Data
public class CommentDTO {
	String 
	user_id,
	board_id,
	comment_writer,
	comment_contents,
	comment_imgurl,
	comment_write_date,
	comment_update_date,
	comment_delete_date;
	
	int 	parent_id, comment_id;

	  UserDTO user; // Add UserDTO field
}