package kr.co.book.club.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.club.dto.ClubDTO;
@Mapper
public interface ClubDAO {

	String getPhotoName(String email);

	void fileWrite(String ori_photo_name, String new_photo_name, String IDX);

	void clubApply(HashMap<String, String> params);

	ArrayList<ClubDTO> clubList();

	ClubDTO clubDetail(String clubIdx);

	ArrayList<String> clubDetailPhoto(String clubIdx);

	void saveBook(HashMap<String, String> bookInfo);

}
