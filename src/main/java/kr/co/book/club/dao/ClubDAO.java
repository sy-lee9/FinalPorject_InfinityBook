package kr.co.book.club.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.club.dto.ClubDTO;

@Mapper
public interface ClubDAO {

	int totalClubList();

	ArrayList<ClubDTO> clubList(int offset);

	int totalClubListSearch(String searchText);

	ArrayList<ClubDTO> clubListSearch(int offset, String searchText);

	ClubDTO clubDetail(String club_idx);



}
