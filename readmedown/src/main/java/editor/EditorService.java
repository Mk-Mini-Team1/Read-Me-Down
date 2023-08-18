package editor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	boolean isBoardIdExist(String new_id) {
		return dao.isBoardIdExist(new_id);
	}
	
	int deleteNoSaveBoard(String user_id) {
		return dao.deleteNoSaveBoard(user_id);
	}

}
