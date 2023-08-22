package mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FollowService {
	@Autowired
	FollowDAO dao;
	
	List<FollowDTO> getFollowList(String user_id){
		return dao.getFollowList(user_id);
	}
	
	int deleteFollow(String follow_id) {
		return dao.deleteFollow(follow_id);
	}
	
}
