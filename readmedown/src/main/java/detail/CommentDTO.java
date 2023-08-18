package detail;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CommentDTO {
	String 
	board_id,
	comment_writer,
	comment_contents,
	comment_imgurl,
	comment_write_date,
	comment_update_date,
	comment_delete_date;
	int comment_id,parent_id;
	boolean bookmarked;
}