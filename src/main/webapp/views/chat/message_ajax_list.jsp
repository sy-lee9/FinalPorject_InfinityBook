<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach var="tmp" items="${list }">
	<div class="chat_list_box${tmp.code_idx}-${tmp.idx } chat_list_box">
		<div type="button" class="chat_list" code="${tmp.code_idx }" room="${tmp.idx}" library="${tmp.library_idx}" apply-user="${tmp.applyuser}">
			<!-- active-chat -->
			<div class="chat_people">
				<div class="chat_ib">
					<h5> 
						${tmp.nicknames}						
					</h5>
					<br/>
					<div class="row">
						<div class="col-10">							
							<p>${tmp.chat_chat}</p>
							<p>${tmp.chat_date }</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>