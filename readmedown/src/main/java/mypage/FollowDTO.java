package mypage;

import org.springframework.stereotype.Component;

import lombok.Data;
import user.UserDTO;

@Component
@Data
public class FollowDTO {
	String follow_id,my_id,your_id;
	UserDTO user;

}
