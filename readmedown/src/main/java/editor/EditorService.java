package editor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.UserDTO;

@Service
public class EditorService {
	@Autowired
	EditorDAO dao;
	
	List<BadgeDTO> getBadges(String keyword){
		return dao.getBadges(keyword);
	}
	
	List<StatsThemeDTO> getStatsThemes(String keyword){
		return dao.getStatsThemes(keyword);
	}
	
	List<HitDTO> getHits(String keyword){
		return dao.getHits(keyword);
	}
	
	boolean isBoardIdExist(String new_id) {
		return dao.isBoardIdExist(new_id);
	}
	
	int deleteNoSaveBoard(String user_id) {
		return dao.deleteNoSaveBoard(user_id);
	}
	
	UserDTO getLoginUser(String user_id) {
		return dao.getLoginUser(user_id);
	}
	
	String helpBoardCodes() {
		return dao.helpBoardCodes();
	}

}
