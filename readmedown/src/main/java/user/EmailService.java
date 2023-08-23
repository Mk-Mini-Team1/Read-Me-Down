package user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {
	
    @Autowired
    private JavaMailSender javaMailSender;
    private static final String senderEmail = "readmedown3@gmail.com";
    private static final String charSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    @Autowired
    private UserDAO userDAO; // UserDAO 주입

    public static String createPassword() {
        StringBuilder password = new StringBuilder();

        int charSetLength = charSet.length();
        for (int i = 0; i < 10; i++) {
            int randomIndex = (int) (charSetLength * Math.random());
            password.append(charSet.charAt(randomIndex));
        }
        return password.toString();
    } 

    public int sendEmail(String email) {
        String password = createPassword();
        int result = 0;
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, "utf-8");

            helper.setFrom(senderEmail);
            helper.setTo(email);
            helper.setSubject("임시 비밀번호 안내");

            String body = "";
            body += "<h3>" + "요청하신 임시 비밀번호는" + "</h3>";
            body += "<h1>" + password + "</h1>";
            body += "<h3>" + "입니다. 로그인 후에 비밀번호를 변경해주세요." + "</h3>";
            helper.setText(body, true);

            javaMailSender.send(message); //
           
            // 임시 비밀번호로 업데이트
            UserDTO userdto = new UserDTO(); 
            userdto.setEmail(email); //userdto선언 이후 set
            userdto.setPassword(password);
            result = userDAO.newPassword(userdto);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result; 
    }

} 
