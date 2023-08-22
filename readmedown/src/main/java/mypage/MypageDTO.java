package mypage;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MypageDTO {
	String board_id, user_id, email, password, name, git_id ;
	String profile_image;
	Date created_date;
	
}