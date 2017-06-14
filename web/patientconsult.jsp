<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="login" uri="/struts-tags"  %>
    <%@taglib prefix="s" uri="/struts-tags"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
               <a class="logo navbar-left" href="patientProfile"><img alt="" src="img/LOGO.png" width="320" height="50"></a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                    	<a class="button-nav" href="patientProfile" style="font-size:20px;">HOME</a>
                    </li>
                    <li>
                    	<a class="button-nav" href="patientProf" style="font-size:20px;">ACCOUNT</a>
                    </li>
                    <li>
                       <a class="button-nav" href="patientDList" style="font-size:20px;">DOCTORS</a>
                    </li>
                    <li>
                        <a class="button-nav" href="index.jsp" style="font-size:20px;">LOGOUT</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
<div class="container-fluid content2 titles" >
	<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">
	</div>
	<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6" >
		<h1>CONSULTATIONS</h1>
	</div>
	<div class="col-md-5 col-xs-5 col-sm-5 col-lg-5 content2">
			<h3> 
				Hello, <s:property value="#session['type']"/> <s:property value="#session['name']"/>
			</h3>
		</div>
</div><br>
<div class="trans2"><br></div>
<div class="content trans" style="width: 100%; height: 100%;">
	<br>
	<div class="container queue content trans">
		<%int i=0; %>
  		<s:iterator value="list" var="l">
  		<%i++; %>
		<div class="row sep container-fluid" style="background-color: white">
			<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1" ></div>
			<div class="col-md-2 col-xs-2 col-sm-2 col-lg-2">
				<h3 style="text-align: left;">
					DOCTOR: 
				</h3>
				
			</div>
			<div class="col-md-4 col-xs-4 col-sm-4 col-lg-4">
				<h3 style="text-align: left;"><s:property value="#l.physician" />, <s:property value="#l.ts" />
				</h3>
			</div>
			<div class="col-md-2 col-xs-2 col-sm-2 col-lg-2" >
				<br>
			</div>
			<div class="col-md-3 col-xs-3 col-sm-3 col-lg-3" >
			<s:form action="seeConsultPatient" cssClass="row" theme="simple">
				<s:hidden key="s" name="s" value="%{#l.DId}"/>
				<s:submit value="See Record" cssClass="button" theme="simple" style="width: 250px; height:60; font-size:30px;"/>
			</s:form>
			</div>
		</div>
  	 
		</s:iterator>
		<%if(i==0){ %>
 			You have no Consultation
 		<%} %>
	</div>
	<div>
				<h3>
	 				<a href="patientProfile">BACK</a>
				</h3>
			</div>
	
</div>
<div class="trans2"><br></div>
</body>

 <script src="vendor/jquery/jquery.min.js"></script>

    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb" crossorigin="anonymous"></script>

    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <script src="js/agency.min.js"></script>
</html>





