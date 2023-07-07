package kr.co.book.transaction.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.transaction.dto.TransactionListDTO;

@Mapper
public interface TransactionListDAO {

	ArrayList<TransactionListDTO> searchUserChange(String isbn);
	
	ArrayList<TransactionListDTO> searchUserRent(String isbn);

	TransactionListDTO searchDetail(String library_idx);

	ArrayList<TransactionListDTO> changeMyBook(String member_idx);

	String deposit(String member_idx);

	
}
