<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.regex.Pattern"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>본격! 게시판 - 게시글 리스트</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
	 
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
</head>
<body>
	<form action="insert.do" method="post" onsubmit="return formCheck();">
		<div class="col-lg-2">
			제목 : <input type="text" class="form-control" placeholder="Text input" name="title" /><br/>
			
			작성자 : <input type="text" class="form-control" placeholder="Text input" name="writer" /><br/>
			날짜 : <input type="text" class="form-control" placeholder="Text input" name="regdate" /><br>
			
			content : <textarea class="form-control" rows="3" name="content"></textarea><br>
			<input type="submit" />
		</div>
		
	</form>
	<script>
		function formCheck() {
			 
		    var title = document.forms[0].title.value;        // 사용하기 쉽도록 변수를 선언하여 담아주고,
		    var writer = document.forms[0].writer.value;
		    var regdate = document.forms[0].regdate.value;
		    var content = document.forms[0].content.value;
		 
		    if (title == null || title == ""){		// null인지 비교한 뒤
		        alert('제목을 입력하세요');				// 경고창을 띄우고
		        document.forms[0].title.focus();	// 해당태그에 포커스를 준뒤
		        return false;						// false를 리턴합니다.
		    }
		 
		    if (writer == null ||  writer  == ""){          
		        alert('작성자를 입력하세요'); 
		        document.forms[0].writer.focus();                      
		        return false;               
		    }else if(writer.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null){
		        alert('이메일 형식으로 입력하세요'); 
		        document.forms[0].writer.focus();                      
		        return false; 
		    }
		 
		    if (regdate == null || regdate == "" ){                            
		 
		        alert('날짜를 입력하세요');   
		        document.forms[0].regdate.focus();                      
		        return false;            
		 
		    }else if(regdate.match(/^\d\d\d\d\d\d+$/ig)   == null){
		        alert('숫자 형식(6자리)으로 입력하세요'); 
		        document.forms[0].regdate.focus();                      
		        return false; 
		    }
		 
		} // function end
	</script>
</body>
</html>