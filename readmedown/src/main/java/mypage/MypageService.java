package mypage;

public interface MypageService {
    MypageDTO userInfo(String user_id);
    void updateUser(String user_id, String name, String profile_image, String git_id);
    String checkPw(String user_id);
    void updatePw(String password, String user_id);
}
