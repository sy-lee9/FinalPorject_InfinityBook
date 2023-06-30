package kr.co.book.club.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.book.club.dao.ClubDAO;
import kr.co.book.club.dto.ClubDTO;

@Service
@MapperScan(value= {"kr.co.book.club.dao"})
public class ClubService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ClubDAO dao;

	public String clubInsert() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getPhotoName(String email) {
		// TODO Auto-generated method stub
		return dao.getPhotoName(email);
	}

	public HashMap<String, String>clubApply(MultipartFile photo, HashMap<String, String> params) throws IOException {
		String MEMBER_IDX = "3"; //로그인 기능 완성 후 세션 저장된 값으로 바꿔줘야합니다
		params.put("member_idx", MEMBER_IDX);
		logger.info("photo 여부 :"+photo.isEmpty());
		String page = "redirect:/index";
		String IDX = params.get("IDX");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("page", page);
		
		if(photo.isEmpty()==false) {
		map = fileSave(IDX, photo);
		String new_photo_name = map.get("new_photo_name");
		logger.info("서비스 바뀐이름 : "+ new_photo_name);
		params.put("new_photo_name", new_photo_name);
		map.put("new_photo_name", new_photo_name);
		
		}
		try {
			Thread.sleep(1);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String date = params.get("clubMeetDate");
		String time = params.get("clubMeetTime");
		String clubDate = date.concat("/");
		String clubDatetime = clubDate.concat(time);
		params.put("clubDatetime", clubDatetime);
		
		logger.info("독서모임 등록 map에 담겨있는 것 : "+ map);
		logger.info("독서모임 등록 params에 담겨있는 것 : "+ params);
		
		dao.clubApply(params);

		return map;
	}

	private HashMap<String, String> fileSave(String IDX, MultipartFile photo) throws IOException {
		String ori_photo_name = photo.getOriginalFilename();
		String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
		logger.info("예전 이름 : "+ori_photo_name);
		
		String new_photo_name = System.currentTimeMillis()+ext;
		logger.info("바뀐이름 : "+new_photo_name);
		
		byte[] bytes = photo.getBytes();
		//1-5 추출한 바이트 저장
		Path path = Paths.get("C:/img/upload/"+new_photo_name); 
		Files.write(path, bytes);
		logger.info(new_photo_name+" save OK");

		dao.fileWrite(ori_photo_name,new_photo_name,IDX);
		
		//String page = "redirect:/clubList?user_id="+user_id;
		String page = "redirect:/index";
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("page", page);
		map.put("new_photo_name", new_photo_name);
		
		return map;

	}

	public ArrayList<ClubDTO> clubList() {
		// TODO Auto-generated method stub
		return dao.clubList();
	}

	public ClubDTO clubDetail(String CLUB_IDX) {
		// TODO Auto-generated method stub
		return dao.clubDetail(CLUB_IDX);
	}

	public ArrayList<String> clubDetailPhoto(String clubIdx) {
		// TODO Auto-generated method stub
		return dao.clubDetailPhoto(clubIdx);
	}

	public void saveBook(HashMap<String, String> bookInfo) {
		dao.saveBook(bookInfo);
		
	}

}
