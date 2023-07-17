<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<c:forEach var="tmp" items="${list }">
	<div class="chat_list_box${tmp.code_idx}-${tmp.idx } chat_list_box">
		<div type="button" class="chat_list" code="${tmp.code_idx }" room="${tmp.idx}" library="${tmp.library_idx}" apply-user="${tmp.applyuser}">
			<!-- active-chat -->
			<div class="chat_people">
				<div class="chat_ib">
					<h5>
					<c:if test="${tmp.code_idx eq '2'}">${tmp.library_title}</c:if>
					<c:if test="${tmp.code_idx eq '3'}">${tmp.library_title}</c:if> 
					<c:if test="${tmp.code_idx eq '4'}">${tmp.club_name}</c:if>				
					</h5>
					<br/>
					<div class="row">
						<div class="col-10">
							<p>${tmp.member_nickname}</p>								
							<p>${fn:substring(tmp.chat_chat, 0, 10)}....</p>																	
							<!-- <p>${tmp.chat_chat}</p> -->
							<p>${tmp.chat_date }</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>