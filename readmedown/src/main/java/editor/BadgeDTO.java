package editor;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BadgeDTO {
	String badge_id, badge_category, badge_name, badge_link;
}
