package kr.co.book.alarm.dao;

import java.util.ArrayList;

import kr.co.book.alarm.dto.AlarmDTO;

public interface AlarmDAO {

	int totalAlarmCount(String member_idx);

	ArrayList<AlarmDTO> alarmList(int offset, String member_idx);

	void alarmCheck(String member_idx);

}
