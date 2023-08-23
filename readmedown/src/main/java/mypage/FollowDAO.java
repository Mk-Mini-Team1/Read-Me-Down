package mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import board.BoardDTO;
import pagination.SearchDTO;
import user.UserDTO;

@Mapper
@Repository
public interface FollowDAO {
	List<FollowDTO> getFollowList(String user_id);
	int deleteFollow(String follow_id);
	int deleteFollowdto(FollowDTO dto);
	int insertFollowdto(FollowDTO dto);
	Integer getFollowerCnt(String user_id);
	boolean isFollowing(FollowDTO dto);
	
	UserDTO getOtherUserInfo(String user_id);
	List<BoardDTO> getOtherUserBoards(SearchDTO dto);
	Integer getOtherUserBoardsCount(SearchDTO dto);
}
