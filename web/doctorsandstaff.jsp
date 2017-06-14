<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"  %>
<!DOCTYPE html>
<html>
<head>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">	
	<link href="css/agency.min.css" rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
<title>Maginhawa Medical Clinic</title>
<style>

@font-face {
	font-family: customFont;
	src: url(css/KeepCalm-Medium.ttf);
}


label[for="labels"] {
	color: #24bde7;
	font-size: 20px;
	align: right;
}
</style>
</head>
<body>
<nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top navtrans">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
               <a class="logo navbar-left" href="index.jsp"><img alt="" src="img/LOGO.png" width="320" height="50"></a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                    	<a class="button-nav" href="index.jsp" style="font-size:20px;">HOME</a>
                    </li>
                    <li>
                    	<a class="button-nav" href="viewDList" style="font-size:20px;">DOCTORS</a>
                    </li>
                    <li>
                        <a class="button-nav" href="login.jsp" style="font-size:20px;">LOGIN</a>
                    </li>
                    <li>
                        <a class="button-nav" href="contactus.jsp" style="font-size:20px;">CONTACT US</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
<div class="container-fluid content2 titles" >
	<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">
	</div>
	<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6" >
		<h1>DOCTORS AND STAFF</h1>
	</div>
</div><br>
<div class="trans2"><br></div>
<div class="container-fluid content trans" style="width: 100%; height: 100%;">
	<br>
	<!--  ITERATE START -->
		<% int i = 0; %>
		<s:iterator value="dlist" var="d">
		<% i++; %>
	<div class="container doclist content trans2">
		<div class="row">
			<br><br>
			<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
			<div class="col-md-3 col-xs-3 col-sm-3 col-lg-3"
				style="background-color: BLUE;">
				<h2>DR's IMAGE HERE</h2>
				<br>
				<br><br>
				<br><br>
				<br>
				<br>
			</div>
			<div class="col-md-2 col-xs-2 col-sm-2 col-lg-2"
				style="text-align: left;">
				<h4><font style="color: GREY;">NAME: </font>
					</h4>
				<h4><font style="color: GREY;">USERNAME: </font></h4>
				<h4><font style="color: GREY;">GENDER: </font></h4>
				<h4><font style="color: GREY;">ADDRESS: </font></h4>
				<h4><font style="color: GREY;">BIRTHDATE: </font></h4>
				<h4><font style="color: GREY;">SPECIALIZATION: </font></h4>
				<br>
				<br>
			</div>
			<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6" style="text-align: left">
			<h4 style="text-transform: uppercase;">
			<s:property value="#d.fname"/> <s:property value="#d.lname"/></h4>
			<h4><s:property value="#d.username"/></h4>
			<h4><s:property value="#d.sex"/></h4>
			<h4><s:property value="#d.address"/></h4>
			<h4><s:property value="#d.birthdate"/></h4>
			<h4><s:property value="#d.specialization"/></h4>
			</div>
		</div>
		
		<br><br>
	</div>
	<%if(i==0){ %>
 			No doctors in the database
 
 		<%} %>
 		</s:iterator>
 		
 		<br>
 		<!--  ITERATE START -->
		<% int j = 0; %>
		<s:iterator value="nlist" var="d">
		<% j++; %>
	<div class="container doclist content trans2">
		<div class="row">
			<br><br>
			<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
			<div class="col-md-3 col-xs-3 col-sm-3 col-lg-3"
				style="background-color: BLUE;">
				<h2>Nr's IMAGE HERE</h2>
				<br>
				<br><br>
				<br><br>
				<br>
				<br>
			</div>
			<div class="col-md-2 col-xs-2 col-sm-2 col-lg-2"
				style="text-align: left;">
				<h4><font style="color: GREY;">NAME: </font></h4>
				<h4><font style="color: GREY;">USERNAME: </font></h4>
				<h4><font style="color: GREY;">GENDER: </font></h4>
				<h4><font style="color: GREY;">ADDRESS: </font></h4>
				<h4><font style="color: GREY;">BIRTHDATE: </font></h4>
				<h4><font style="color: GREY;">SPECIALIZATION: </font></h4>
				<br>
				<br>
			</div>
			<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6" style="text-align: left">
			
			<p><h4><s:property value="#d.fname"/> <s:property value="#d.lname"/></h4><p/>
			<p><h4><s:property value="#d.username"/></h4><p/> 
			<p><h4><s:property value="#d.sex"/></h4><p/>
			<p><h4><s:property value="#d.address"/></h4><p/>
			<p><h4><s:property value="#d.birthdate"/></h4><p/>
			<p><h4><s:property value="#d.specialization"/></h4><p/>
			
			</div>
		</div>
		
		<br><br>
	</div>
	<%if(j==0){ %>
 			No Nurse
 
 		<%} %>
 		</s:iterator>
	<br>
</div>
<div class="trans2"><br></div>
</body>
</html>