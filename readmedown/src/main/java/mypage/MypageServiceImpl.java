package mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
