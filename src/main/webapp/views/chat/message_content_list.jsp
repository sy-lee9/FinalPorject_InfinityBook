<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<c:forEach var="tmp" items="${clist}">
    <div id='talk' code="${tmp.code_idx }" room="${tmp.idx}">
        <c:if test="${sessionScope.loginIdx ne tmp.chat_sender}">
            <!-- 받은 메세지 -->
            <div class="incoming_msg">
                <div class="received_withd_msg">
                    <c:choose>
                        <c:when test="${fn:startsWith(tmp.chat_chat, '/upload/') && (fn:endsWith(tmp.chat_chat, '.jpg') || fn:endsWith(tmp.chat_chat, '.png') || fn:endsWith(tmp.chat_chat, '.gif'))}">
                            <!-- 조건이 참일 때 수행할 작업 -->
                            <span>${tmp.member_nickname}</span>
                            <image src="${tmp.chat_chat}" width="auto" height="auto"/>                            
                            <span class="time_date">${tmp.chat_date}</span>
                        </c:when>
                        <c:otherwise>
                        	<span>${tmp.member_nickname}</span>
                            <p>${tmp.chat_chat}</p>
                            <span class="time_date">${tmp.chat_date}</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:if>

        <c:if test="${sessionScope.loginIdx eq tmp.chat_sender}">
            <!-- 보낸 메세지 -->
            <div class="outgoing_msg">
                <div class="sent_msg">
                    <c:choose>
                        <c:when test="${fn:startsWith(tmp.chat_chat, '/upload/') && (fn:endsWith(tmp.chat_chat, '.jpg') || fn:endsWith(tmp.chat_chat, '.png') || fn:endsWith(tmp.chat_chat, '.gif'))}">
                            <!-- 조건이 참일 때 수행할 작업 -->
                            <image src="${tmp.chat_chat}" width="auto" height="auto" />                            
                            <span class="time_date">${tmp.chat_date}</span>
                        </c:when>
                        <c:otherwise>
                            <p>${tmp.chat_chat}</p>
                            <span class="time_date">${tmp.chat_date}</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:if>
    </div>
</c:forEach>

	
	
	
	
	
