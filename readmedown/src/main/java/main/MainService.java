package main;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.BoardDAO;
import board.BoardDTO;
import board.BookmarkDTO;
import pagination.Pagination;
import pagination.PagingResponse;
import pagination.SearchDTO;

@Service
public class MainService {
	@Autowired
	MainDAO dao;
	
	//글목록 불러오기 -------paging
  	public PagingResponse<BoardDTO> allBoardList(SearchDTO dto){
  		// 조건에 해당하는 데이터가 없는 경우, 응답 데이터에 비어있는 리스트와 null을 담아 반환
        int count = dao.allBoardCnt();
        if (count < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }

        // Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
        Pagination pagination = new Pagination(count, dto);
        dto.setPagination(pagination);

        // 계산된 페이지 정보의 일부(limitStart, recordSize)를 기준으로 리스트 데이터 조회 후 응답 데이터 반환
        List<BoardDTO> list = dao.allBoardList(dto);
        return new PagingResponse<>(list, pagination);

  	};

  	//유저 북마크 목록
  	public List<BookmarkDTO> userBookmarkList(String user_id){
  		return dao.userBookmarkList(user_id);
  	};
  	//유저 북마크 여부
  	public int isBookmarked(BookmarkDTO dto) {
  		return dao.isBookmarked(dto);
  	};
  	
}
