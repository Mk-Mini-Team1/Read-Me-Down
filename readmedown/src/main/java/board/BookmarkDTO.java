package board;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BookmarkDTO {
	String bookmark_id, board_id, user_id;
	
}