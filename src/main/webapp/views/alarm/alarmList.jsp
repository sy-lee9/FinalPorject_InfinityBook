<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<button onclick="alarmdel_all()" style="float: right; width: 120px; height: 50px;">전체 삭제</button>
<c:forEach var="tmp" items="${alarmlist.list}">
		<div class="alaram_list" type="button" code="${tmp.code_idx}" idx="${tmp.idx}">
			<div>
				<a href="/alarmdetail.go?code_idx=${tmp.code_idx}&idx=${tmp.idx}">${tmp.alarm_content}<br/>${tmp.alarm_date}</a>
			</div>
		</div>	
</c:forEach>