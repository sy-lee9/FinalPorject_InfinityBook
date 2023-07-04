<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="login"></div>


<script>
    var content = "<div class='top-content'>";
    content += "<div class='container'>";
    content += "<div class='row'>";
    content += "<div class='col-md-12'>";
    content += "<div class='right-element'>";
    content += "<a href=\"#\" onclick=\"openPopupCentered('login.go', 'popup', 400, 300); return false;\">로그인 / 회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;";
    content += "</div><!--top-right-->";
    content += "</div>";
    content += "</div>";
    content += "</div>";
    content += "</div>";

    $(document).ready(function() {
      $("#login").html(content);
    });

    function openPopupCentered(url, name, width, height) {
      var left = (screen.width - width) / 2;
      var top = (screen.height - height) / 2;

      var popup = window.open(url, name, 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
      
      // 팝업이 닫힐 때 메인 페이지로 이동
      $(popup).on('beforeunload', function() {
    	  function closePopup1() {
    		    window.close();
    		    location.href = "./join.go";
    		}
    		function closePopup() {2
    		    window.close();
    			location.href = "./pw_Search.go";
    		}
      }); 
    }
</script>
