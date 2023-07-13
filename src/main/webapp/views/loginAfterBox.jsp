<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="login"></div>
<script>
    var content = "<div class='top-content'>";
    content += "<div class='container'>";
    content += "<div class='row'>";
    content += "<div class='col-md-12'>";
    content += "<div class='right-element'>";
    content += "<a href='/admin/adminMain' style='color: red;'>[관리자 페이지]&nbsp;&nbsp;</a>" + "반가워요 <b>${sessionScope.loginNickname}</b>님! <a href='logout.do' style='color: blue;'>[로그아웃]</a>&nbsp;&nbsp;&nbsp;&nbsp;";
    content += "<a href='message_list.go'>채팅하기</a>&nbsp;&nbsp;&nbsp;&nbsp;";
    content += "<a href='alarm.go' class='cart for-buy'><i style='font-style:normal;'>🔔</i><span>알림</span></a>";
    content += "</div><!--top-right-->";
    content += "</div>";
    content += "</div>";
    content += "</div>";
    content += "</div>";
    $("#login").html(content);
</script>
