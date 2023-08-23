package user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO dao;

	public int insertUser(UserDTO userDTO) {
		return dao.insertUser(userDTO);
	}
	
	public int checkEmail(String email) {
		return dao.checkEmail(email);
	}
	
	public UserDTO loginUser(String email) {
		return dao.loginUser(email);
	} 
	
	public int newPassword(UserDTO userDTO) {
		return dao.newPassword(userDTO);
	}  
	public int findpwEmail(String email) {
		return dao.findpwEmail(email);
	}
	  
}
