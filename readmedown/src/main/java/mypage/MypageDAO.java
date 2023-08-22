package mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import board.BoardDTO;
import pagination.SearchDTO;

@Mapper
@Repository
public interface MypageDAO {
    MypageDTO userInfo(String user_id);
    void updateUser(String user_id, String name, String profile_image, String git_id);
    String checkPw(String user_id);
    void updatePw(String password, String user_id);
    List<BoardDTO> allTemplatesList(SearchDTO searchDTO);
    Integer allTemplatesCnt(SearchDTO searchDTO);
    List<BoardDTO> allBookmarksList(SearchDTO searchDTO);
    Integer allBookmarksCnt(SearchDTO searchDTO);
    
    
    
}
