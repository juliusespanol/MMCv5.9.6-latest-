<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
	<div class="container-fluid content2 titles">

		<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
		<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6">
			<script type="text/javascript">
				window.onload = date_time('date_time');
			</script>
			<h1>DOCTORS AND STAFF</h1>
		</div>
		<div class="col-md-5 col-xs-5 col-sm-5 col-lg-5 content2">
			<h3> 
				Hello, <s:property value="#session['type']"/> <s:property value="#session['name']"/>
			</h3>
		</div>
	</div>
	<br>
	<div class="trans2">
		<br>
	</div>
	<div class="container-fluid content trans"
		style="width: 100%; height: 100%;">
		<br>

		<div class="container doclist content trans2">
				
				
				<br>
				<s:div cssClass="row">
					<s:form action="weeklydate.action" method="post">
							<s:div cssClass="col-md-1 col-xs-1 col-sm-1 col-lg-1" ></s:div>
							<s:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2">
								 <span class="label" style="color: #24bde7; font-size: 15px; align: right;">SELECT DATE:</span>
								 <input type="date" id="wd.dateNow" name="wd.dateNow" style="color: GREY;" required />
							</s:div>
							<s:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2">
								<span class="label" style="color: #24bde7; font-size: 15px; align: right;">SELECT DOCTOR:</span>
								<s:select key="wd.docNum" name="wd.docNum" list="dlist" 
								 listKey="username" theme="simple"
								listValue="%{fname+' '+lname+' ('+specialization+')'}" 
								style="color: GREY; font-size: 15px; align: right; height: 26px;" />
							</s:div>
							<s:div cssClass="col-md-1 col-xs-1 col-sm-1 col-lg-1" theme="simple">
								<s:submit value="SEE DOCTOR " cssClass="button-search" style="width: 157px; height: 50px; font-size: 20px;"/>
							</s:div>
						
					</s:form>
					</s:div>
					
			<!--  ITERATE START -->
			<%
				int i = 0;
			%>
			<s:iterator value="dlist" var="d">
				<%
					i++;
				%>
				<div class="row">
					<br> <br>
					<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
					<div class="col-md-3 col-xs-3 col-sm-3 col-lg-3"
						style="background-color: BLUE;">
						<h2>DR's IMAGE HERE</h2>
						<br> <br> <br> <br> <br> <br> <br>
					</div>
					<div class="col-md-2 col-xs-2 col-sm-2 col-lg-2"
						style="text-align: left;">
						<h4>
							<font style="color: GREY;">NAME: </font>
						</h4>
						<h4>
							<font style="color: GREY;">USERNAME: </font>
						</h4>
						<h4>
							<font style="color: GREY;">GENDER: </font>
						</h4>
						<h4>
							<font style="color: GREY;">ADDRESS: </font>
						</h4>
						<h4>
							<font style="color: GREY;">BIRTHDATE: </font>
						</h4>
						<h4>
							<font style="color: GREY;">SPECIALIZATION: </font>
						</h4>

						<br> <br>
					</div>
					<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"
						style="text-align: left">
						<h4 style="text-transform: uppercase;">
							<s:property value="#d.fname" />
							<s:property value="#d.lname" />
						</h4>
						<h4>
							<s:property value="#d.username" />
						</h4>
						<h4>
							<s:property value="#d.sex" />
						</h4>
						<h4>
							<s:property value="#d.address" />
						</h4>
						<h4>
							<s:property value="#d.birthdate" />
						</h4>
						<h4>
							<s:property value="#d.specialization" />
						</h4>

					</div>
				</div>

				<br>
				<br>
				<%
					if (i == 0) {
				%>
 			No doctors in the database
 
 		<%
					}
				%>
			</s:iterator>
		</div>
		<br>
	</div>
	<div class="trans2">
		<br>
	</div>
	<script src="vendor/jquery/jquery.min.js"></script>

    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb" crossorigin="anonymous"></script>

    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <script src="js/agency.min.js"></script>
</body>
</html>