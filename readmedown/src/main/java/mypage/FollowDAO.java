package mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface FollowDAO {
	List<FollowDTO> getFollowList(String user_id);
	int deleteFollow(String follow_id);
}
