package mypage;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.BoardDTO;
import pagination.Pagination;
import pagination.PagingResponse;
import pagination.SearchDTO;

@Service
public class MypageServiceImpl implements MypageService {
	
    @Autowired
    MypageDAO dao;

    public MypageDTO userInfo(String user_id) {
        return dao.userInfo(user_id);
    }

    public void updateUser(String user_id, String name, String profile_image, String git_id) {
        dao.updateUser(user_id, name, profile_image, git_id);
    }

    public String checkPw(String user_id) {
        return dao.checkPw(user_id);
    }

    public void updatePw(String password, String user_id) {
        dao.updatePw(password, user_id);
    }

    public PagingResponse<BoardDTO> allTemplatesList(SearchDTO dto){
    	// 조건에 해당하는 데이터가 없는 경우, 응답 데이터에 비어있는 리스트와 null을 담아 반환
        int count = dao.allTemplatesCnt(dto);
        if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }

        // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
        Pagination pagination = new Pagination(count, dto);
        dto.setPagination(pagination);

        // 계산된 페이지 정보의 일부(limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 반환
        List<BoardDTO> list = dao.allTemplatesList(dto);
        return new PagingResponse<>(list, pagination);
    };
    
    public PagingResponse<BoardDTO> allBookmarksList(SearchDTO dto){
    	// 조건에 해당하는 데이터가 없는 경우, 응답 데이터에 비어있는 리스트와 null을 담아 반환
        int count = dao.allBookmarksCnt(dto);
        if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }

        // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
        Pagination pagination = new Pagination(count, dto);
        dto.setPagination(pagination);

        // 계산된 페이지 정보의 일부(limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 반환
        List<BoardDTO> list = dao.allBookmarksList(dto);
        return new PagingResponse<>(list, pagination);
    };
}
