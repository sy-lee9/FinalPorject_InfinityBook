<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${alarmlist.list.size() > 0}">
	<button onclick="alarmdel_all()" style="float: right; width: 100%; height: 45px;">전체 삭제 🗑</button>
		<c:forEach var="tmp" items="${alarmlist.list}">
				<div class="alaram_list" type="button" code="${tmp.code_idx}" idx="${tmp.idx}" style="text-overflow: ellipsis;">
					<div>
						<a href="/alarmdetail.go?code_idx=${tmp.code_idx}&idx=${tmp.idx}">
							<div style="font-size:15px;">${tmp.alarm_content}</div>
							<div style="font-size:13px;">${tmp.alarm_date}</div>
						</a>
						<a href="/alarmdel.go?alarm_idx=${tmp.alarm_idx}">🗑</a>
					</div>
				</div>	
		</c:forEach>
</c:if>