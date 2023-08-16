package editor;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EditorDAO {
	List<BadgeDTO> getBadges(String keyword);

}
