package kr.co.book.event.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.book.event.dto.EventDTO;

public interface EventDAO {
	
		int totalCount();

		int etotalCountSearch(String search);

		ArrayList<EventDTO> evlist(int cnt, int offset);

		ArrayList<EventDTO> eventSearch(String search);

		String eventWrite(HashMap<String, String> params);

		int eventWrite(EventDTO dto);

	    int totalEventList(int member_idx, String type);
	  
	    ArrayList<EventDTO> eventList(int member_idx, int offset, String type);
	  
	    int totalEventSearchList(HashMap<String, Object> data);
	    
	    ArrayList<EventDTO> eventSearchList(HashMap<String, Object> data);

		void event_FileSave(int i, String ori_photo_name, String new_photo_name, String member_idx);
	 

	

}
