package kr.co.book.event.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.book.event.dto.EventDTO;

public interface EventDAO {

	int totalEventList(int member_idx, String type);

	ArrayList<EventDTO> eventList(int member_idx, int offset, String type);

	int totalEventSearchList(HashMap<String, Object> data);

	ArrayList<EventDTO> eventSearchList(HashMap<String, Object> data);

	

}
