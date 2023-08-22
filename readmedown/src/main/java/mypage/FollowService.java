package mypage;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.BoardDTO;
import main.MainDAO;
import pagination.Pagination;
import pagination.PagingResponse;
import pagination.SearchDTO;
import user.UserDTO;

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
	int deleteFollowdto(FollowDTO dto) {
		return dao.deleteFollowdto(dto);
	}
	int insertFollowdto(FollowDTO dto) {
		return dao.insertFollowdto(dto);
	}
	
	Integer getFollowerCnt(String user_id) {
		return dao.getFollowerCnt(user_id);
	}
	
	boolean isFollowing(FollowDTO dto) {
		return dao.isFollowing(dto);
	}
	
	UserDTO getOtherUserInfo(String user_id) {
		return dao.getOtherUserInfo(user_id);
	}
	
	public PagingResponse<BoardDTO> getOtherUserBoards(SearchDTO dto){
  		// 조건에 해당하는 데이터가 없는 경우, 응답 데이터에 비어있는 리스트와 null을 담아 반환
        int count = dao.getOtherUserBoardsCount(dto);
        if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }

        // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
        Pagination pagination = new Pagination(count, dto);
        dto.setPagination(pagination);

        // 계산된 페이지 정보의 일부(limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 반환
        List<BoardDTO> list = dao.getOtherUserBoards(dto);
        return new PagingResponse<>(list, pagination);
  	};
	
}
