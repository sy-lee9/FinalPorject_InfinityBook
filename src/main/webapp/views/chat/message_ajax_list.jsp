<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach var="tmp" items="${list }">
	<div class="chat_list_box${tmp.CODE_IDX }a${tmp.IDX } chat_list_box">
		<div type="button" class="chat_list" code="${tmp.CODE_IDX }" room="${tmp.IDX }" other-nick="${tmp.other_nick}" library="${tmp.LIBRARY_IDX}" apply-user="${tmp.applyuser}">
			<!-- active-chat -->
			<div class="chat_people">
				<!-- 
				<div class="chat_img" >
					<a href="other_profile.do?other_nick=${tmp.other_nick }">						
					</a>					 
				</div>
				 -->
				<div class="chat_ib">
					<h5>${tmp.other_nick}<span class="chat_date">${tmp.CHAT_DATE }</span></h5>
					<div class="row">
						<div class="col-10">
							<p>${tmp.CHAT_CHAT }</p>
						</div>
						<%-- 만약 현재사용자가 안읽은 메세지 갯수가 0보다 클때만 badge를 표시한다. --%>
						<c:if test="${tmp.unread > 0 }">
							<div class="col-2 unread${tmp.CODE_IDX }a${tmp.IDX }">
								<span class="badge bg-danger">${tmp.unread }</span>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>