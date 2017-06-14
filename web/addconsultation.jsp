<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="addConsult" uri="/struts-tags"  %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<addConsult:property value="%{#session.patient}" />

<addConsult:form action="addConsultation" method="post">
	<addConsult:textarea label="diagnosis" key="diagnosis" />
	<addConsult:textarea label="prescription" key="prescription" />
	<addConsult:textarea label="notes" key="notes" />
	<addConsult:submit value="Consult" />		
</addConsult:form>
</body>
</html>