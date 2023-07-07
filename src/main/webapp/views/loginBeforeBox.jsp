<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="login"></div>
<script>
    var content = "<div class='top-content'>";
    content += "<div class='container'>";
    content += "<div class='row'>";
    content += "<div class='col-md-12'>";
    content += "<div class='right-element'>";
    content += '<a href="./login.go">로그인 / 회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;';
    content += "</div><!--top-right-->";
    content += "</div>";
    content += "</div>";
    content += "</div>";
    content += "</div>";

    $(document).ready(function() {
      $("#login").html(content);
    });
</script>