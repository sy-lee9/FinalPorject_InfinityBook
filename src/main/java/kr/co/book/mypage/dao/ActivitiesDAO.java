package kr.co.book.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ActivitiesDAO {

	int totalChangeList(HashMap<String, Object> params);

	ArrayList<HashMap<String, Object>> changeList(HashMap<String, Object> params);

	int totalChangeListSearch(String searchText);

	ArrayList<HashMap<String, Object>> changeListSearch(int offset, String searchText);


}
