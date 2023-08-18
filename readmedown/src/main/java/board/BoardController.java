package board;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import main.MainService;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	@Autowired
	MainService service2;
	
	@GetMapping("/writingForm")
	public ModelAndView writingForm(String bi) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("board_id", bi);
		mv.setViewName("writingForm");
		return mv;
	}
	
	// 글 작성 페이지에서 이미지 업로드
	@PostMapping("/board/imageUpload")
	@ResponseBody
	public HashMap<String, Object> boardImageUpload(MultipartFile[] uploadFile) {
		HashMap<String, Object> result = new HashMap<>(); // ajax로 반환할 데이터(json)
        String uploadFolder = "C:\\upload";
        
        // 날짜 폴더 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String formatDate = sdf.format(date); // 2023-07-17
        String datePath = formatDate.replace("-", File.separator); // 2023/07/17
        File uploadPath = new File(uploadFolder, datePath); // c:/upload/2023/07/17
        if (uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }
        
        // 파일 업로드
        for (MultipartFile multipartFile : uploadFile) {
        	String fileName = multipartFile.getOriginalFilename();
            String uploadFileName = fileName;
            
            // UUID로 업로드 하는 파일명 생성
            String uuid = UUID.randomUUID().toString();
            uploadFileName = uuid + "_" + uploadFileName;
            
            // 저장할 파일, 생성자로 경로와 이름을 지정해줌.
            File saveFile = new File(uploadPath, uploadFileName);

            try {
                // void transferTo(File dest) throws IOException 업로드한 파일 데이터를 지정한 파일에 저장
                multipartFile.transferTo(saveFile);    
            } catch (Exception e) {
                e.printStackTrace();
            }
            result.put("uploadPath", uploadPath);
            result.put("uuid", uuid);
            result.put("fileName", fileName);
        }
        return result;
	}//이미지업로드
	
	//업로드한 이미지 보여주기
	@ResponseBody
	@GetMapping(value = "/display")
	public ResponseEntity<byte[]> showImageGET(@RequestParam("fileName") String fileName) {
        File file = new File(fileName);
	    ResponseEntity<byte[]> result = null;

	    try {
	        HttpHeaders header = new HttpHeaders();
	        /*
	        Files.probeContentType() 해당 파일의 Content 타입을 인식(image, text/plain ...)
	        없으면 null 반환

	        file.toPath() -> file 객체를 Path객체로 변환
	        */
	        header.add("Content-type", Files.probeContentType(file.toPath()));
	        result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    return result;
	}//업로드한 이미지 display
	
	//두번째 보드 insert
	@RequestMapping("/secondinsert")
	public ModelAndView second_insert_board(
		String title, String contents, String board_img, String board_tag, String board_link, String board_id, String secret) {
		
		BoardDTO dto = new BoardDTO();
		dto.setTitle(title);
		dto.setContents(contents);
		dto.setBoard_img(board_img);
		dto.setBoard_tag(board_tag);
		dto.setBoard_link(board_link);
		dto.setSecret(secret);
		dto.setBoard_id(board_id);
		
		int result = service.second_insert_board(dto);
		ModelAndView mv = new ModelAndView();
		if(result > 0) {
			mv.addObject("msg", "템플릿 작성이 완료되었습니다.");
			mv.addObject("url", "detail?board_id="+board_id);			
			mv.setViewName("alert");						
		}
		else {
			mv.addObject("msg", "문제가 발생했습니다.");
			mv.addObject("url", "writingForm?board_id="+board_id);			
			mv.setViewName("alert");						
		}
		return mv;
	}
	
	//글 조회(수정용)
	@RequestMapping("/boardupdateform")
	public ModelAndView board_detail(String bi) {
		//System.out.println(board_id);
		BoardDTO dto = service.boardDetail(bi);
		ModelAndView mv = new ModelAndView();
		mv.addObject("dto", dto);
		mv.setViewName("update_writingForm");
		return mv;	
	};
	
	//두번째 보드 update
	@RequestMapping("/secondupdate")
	public ModelAndView second_update_board(
			String title, String contents, String board_img, String board_tag, String board_link, String board_id, String secret) {
		
		BoardDTO dto = new BoardDTO();
		dto.setTitle(title);
		dto.setContents(contents);
		dto.setBoard_img(board_img);
		dto.setBoard_tag(board_tag);
		dto.setBoard_link(board_link);
		dto.setSecret(secret);
		dto.setBoard_id(board_id);
		
		int result = service.second_update_board(dto);
		ModelAndView mv = new ModelAndView();
		if(result == 1) {
			mv.addObject("msg", "수정이 완료되었습니다.");
			mv.addObject("url", "mypage");			
			mv.setViewName("alert");						
		}
		else {
			mv.addObject("msg", "문제가 발생했습니다.");
			mv.addObject("url", "mypage");			
			mv.setViewName("alert");						
		}
		return mv;
	}
	
	//북마크 추가
	@RequestMapping(value="/addBookmark", produces = {"application/json;charset=utf-8"})
	public @ResponseBody int addBookmark (String board_id, HttpSession session) {
		String userId = (String)session.getAttribute("user_id");
		BookmarkDTO dto = new BookmarkDTO();
		dto.setBoard_id(board_id);
		dto.setUser_id(userId);
		int bookmarkExist = service2.isBookmarked(dto);
		int result;
		if(bookmarkExist == 0) {
			result = service.addBookmark(dto);
		}
		else {
			result = -1;
		}		
		return result;
	}
	
	//북마크 삭제
	@RequestMapping(value="/deleteBookmark", produces = {"application/json;charset=utf-8"})
	public @ResponseBody int deleteBookmark (String board_id, HttpSession session) {
		String userId = (String)session.getAttribute("user_id");
		BookmarkDTO dto = new BookmarkDTO();
		dto.setBoard_id(board_id);
		dto.setUser_id(userId);
		int bookmarkExist = service2.isBookmarked(dto);
		int result;
		if(bookmarkExist > 0) {
			result = service.deleteBookmark(dto);
		}
		else {
			result = -1;
		}		
		return result;
	}
	
}//class
