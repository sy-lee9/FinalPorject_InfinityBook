<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<c:forEach var="tmp" items="${clist}">
    <div id='talk' code="${tmp.CODE_IDX}" room="${tmp.IDX}">
        <c:if test="${sessionScope.MEMBER_NICKNAME ne tmp.CHAT_SENDER}">
            <!-- 받은 메세지 -->
            <div class="incoming_msg">
                <div class="received_withd_msg">
                    <c:choose>
                        <c:when test="${fn:startsWith(tmp.CHAT_CHAT, '/upload/') && (fn:endsWith(tmp.CHAT_CHAT, '.jsp') || fn:endsWith(tmp.CHAT_CHAT, '.png') || fn:endsWith(tmp.CHAT_CHAT, '.gif'))}">
                            <!-- 조건이 참일 때 수행할 작업 -->
                            <image src="${tmp.CHAT_CHAT}" width="80%"/>                            
                            <span class="time_date">${tmp.CHAT_DATE}</span>
                        </c:when>
                        <c:otherwise>
                            <p>${tmp.CHAT_CHAT}</p>
                            <span class="time_date">${tmp.CHAT_DATE}</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:if>

        <c:if test="${sessionScope.MEMBER_NICKNAME eq tmp.CHAT_SENDER}">
            <!-- 보낸 메세지 -->
            <div class="outgoing_msg">
                <div class="sent_msg">
                    <c:choose>
                        <c:when test="${fn:startsWith(tmp.CHAT_CHAT, '/upload/') && (fn:endsWith(tmp.CHAT_CHAT, '.jsp') || fn:endsWith(tmp.CHAT_CHAT, '.png') || fn:endsWith(tmp.CHAT_CHAT, '.gif'))}">
                            <!-- 조건이 참일 때 수행할 작업 -->
                            <image src="${tmp.CHAT_CHAT}" width="80%"/>                            
                            <span class="time_date">${tmp.CHAT_DATE}</span>
                        </c:when>
                        <c:otherwise>
                            <p>${tmp.CHAT_CHAT}</p>
                            <span class="time_date">${tmp.CHAT_DATE}</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:if>
    </div>
</c:forEach>

	
	
	
	
	
