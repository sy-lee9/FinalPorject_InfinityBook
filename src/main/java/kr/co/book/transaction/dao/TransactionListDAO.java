package kr.co.book.transaction.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.transaction.dto.TransactionListDTO;

@Mapper
public interface TransactionListDAO {

	ArrayList<TransactionListDTO> searchUser(String isbn);

	TransactionListDTO searchDetail(String LIBRARY_IDX);

}
