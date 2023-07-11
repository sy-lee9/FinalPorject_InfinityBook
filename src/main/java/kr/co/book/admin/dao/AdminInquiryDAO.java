package kr.co.book.admin.dao;


import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.admin.dto.AdminInquiryDTO;

@Mapper
public interface AdminInquiryDAO {

	AdminInquiryDTO inquirydetail(String inquiry_idx);

	void inquiryreplywrite(HashMap<String, Object> params);

	void inquirystateupdate(HashMap<String, Object> params);

}
