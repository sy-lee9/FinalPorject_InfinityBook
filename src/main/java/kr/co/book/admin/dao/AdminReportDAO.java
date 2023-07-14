package kr.co.book.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface AdminReportDAO {

	int reportSend(HashMap<String, Object> params);

	ArrayList<HashMap<String, Object>> reportList(HashMap<String, Object> params);

}
