package kr.co.book.club.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.club.dto.ClubDTO;

@Mapper
public interface ClubDAO {

	int totalClubList();

	ArrayList<ClubDTO> clubList(int offset);

	int totalClubListSearch(String searchText);

	ArrayList<ClubDTO> clubListSearch(int offset, String searchText);

	ClubDTO clubDetail(String club_idx);

	ArrayList<ClubDTO> clubMember(String club_idx);

	void clubApply(String club_idx, String member_idx);

	ArrayList<ClubDTO> applyMember(String club_idx);

	void applyAccept(String club_idx, String member_idx);

	void applyReject(String club_idx, String member_idx);

	ArrayList<ClubDTO> locationCode();

	void clubWrite(ClubDTO dto);

	void clubJoin(String club_idx, int member_idx);



}
