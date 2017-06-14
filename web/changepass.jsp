<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="ver" uri="/struts-tags"  %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Pass | MMC</title>
</head>
<body>
	<ver:form action="changepassword" method="post">
			<ver:textfield label="Current Password: " key="oldpass" />
		
			<ver:textfield label="New Password: " key="pass1" />
			<ver:textfield label="Enter Password again: " key="pass2" />
			
			<ver:submit value="Create new password" />
			<ver:reset/>
	</ver:form>
</body>
</html>