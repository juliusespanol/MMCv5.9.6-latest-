<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<span id="date_time"></span>
    <script type="text/javascript">window.onload = date_time('date_time');</script>
	<s:form action="weeklydate.action" method="post">
	
		<input type="date" id="wd.dateNow" name="wd.dateNow"/>
		
		<s:submit value="Submit Date" />	
		
		
	</s:form>
</body>
</html>