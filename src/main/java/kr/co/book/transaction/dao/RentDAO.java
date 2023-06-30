package kr.co.book.transaction.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RentDAO {

	void rentapply(HashMap<String, String> params);

	String findrent_idx(HashMap<String, String> params);

}
