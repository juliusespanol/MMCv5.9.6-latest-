<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="reg" uri="/struts-tags"%>
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
		<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6 content2">
			<h1>MY PROFILE</h1>
		</div>
		<div class="col-md-5 col-xs-5 col-sm-5 col-lg-5 content2">
			<h3> 
				Hello, <reg:property value="#session['type']"/> <reg:property value="#session['name']"/>
			</h3>
		</div>
	</div>
	<br>
	<div class="trans2">
		<br>
	</div>
	<div id="myNav" class="overlay">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div class="overlay-content">
			<div class="container-fluid doclist trans2">
				<h1>ADD MEDICAL HISTORY</h1>
			</div>
			<div class="container-fluid doclist trans2">
				<div class="row container-fluid doclist content"
					style="text-align: left;">

					<br>
					<div class="col-md-4 col-xs-4 col-sm-4 col-lg-4"
						style="text-align: right; font-size: 30px;">
						<br>
					</div>
					<div class="col-md-5 col-xs-5 col-sm-5 col-lg-5" theme="simple">
						<reg:form action="addMedHistP">
							<reg:textfield id="labels" label="CONDITION" key="condi"
								style="width: 250px; height: 40px; font-size: 30px;" />
							<reg:textfield id="labels" label="ALLERGIES" key="allergies"
								style="width: 250px; height: 40px; font-size: 30px;" />
							<reg:submit cssClass="button" value="Add"
								style="width: 250px; height: 35px; font-size: 25px;" />
						</reg:form>
						<br>
					</div>

				</div>
			</div>
			<div class="container-fluid doclist trans2">
				<br>
			</div>
		</div>

	</div>

	<div class="content trans">
	<br>
		<div class="container-fluid row queue content trans2"
			style="text-align: left;">
		<div class="row">
			<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6">
				<div class="row" >
					<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1" style="border-left: 2px solid #24bde7;"></div>
					<div class="col-md-11 col-xs-11 col-sm-11 col-lg-11" style="border-left: 2px solid #24bde7;">
						<h2>MEDICAL HISTORY</h2>
						<hr style="border: 1px solid #24bde7;">
						<!-- ITERATOR START -->
						<%
							int i = 0;
						%>
						<reg:iterator value="list" var="hist">
							<%
								i++;
							%>
							<div class="row">
								<h4 style="padding-left: 3em;"></h4>
								<div class="col-md-3 col-xs-3 col-sm-3 col-lg-3"
									style="text-align: right;">
									TIME:<br> CONDITION:<br>
									HOSPITAL:<br> ALLERGIES:<br> DOCTOR:<br>
								</div>
								<div class="col-md-7 col-xs-7 col-sm-7 col-lg-7">
									<reg:property value="#hist.dtime" />
									<br>
									<reg:property value="#hist.condi" />
									<br>
									<reg:property value="#hist.hospital" />
									<br>
									<reg:property value="#hist.allergies" />
									<br>
									<reg:property value="#hist.doc" />
									<br>
								</div>
								<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
							</div>
							<br>
						</reg:iterator>
						<%
							if (i == 0) {
						%>
						You have not added any medical history for this patient
						<%
							}
						%>
						<!-- ITERATOR END -->
						

					</div>
					</div>
			</div>
			<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6" style="border-left: 2px solid #24bde7;">
				<h2>PATIENT'S APPOINTMENTS</h2>
				<hr style="border: 1px solid #24bde7;">
				<!-- ITERATOR START -->
						<%
							int j = 0;
						%>
						<reg:iterator value="ap" var="ap">
							<%
								j++;
							%>
							<div class="row">
								
								
								<div class="col-md-11 col-xs-11 col-sm-11 col-lg-11">
								<reg:property value="#ap.date" />
								<br>
								<reg:property value="#ap.time" />
								<br>
								<reg:property value="#ap.docName" />
								<br>
								</div>
							</div>
							<br>
						</reg:iterator>
						<%
							if (j == 0) {
						%>
						You have no Appointments 
						<br>
						<a href="patientDList">Click here to
							have an appointment</a>
						<%
							}
						%>
						<!-- ITERATOR END -->
						<br>
						<div class="row">
							<div class="col-md-4 col-xs-4 col-sm-4 col-lg-4">
								<a href="consultHist">View Consultation History</a>
							</div>
						</div>
						
			</div>
		</div>
		</div>
		<br>
	</div>
	<div class="trans2">
		<br>
	</div>



	<script>
		function openNav2() {
			document.getElementById("myNav2").style.height = "100%";
		}

		function closeNav2() {
			document.getElementById("myNav2").style.height = "0%";
		}
	</script>
  <script src="vendor/jquery/jquery.min.js"></script>

    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb" crossorigin="anonymous"></script>

    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <script src="js/agency.min.js"></script>
</body>
</html>

