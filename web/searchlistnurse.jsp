<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
.newfont{
 			font-family: "Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
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
               <a class="logo navbar-left" href="nursehome.jsp"><img alt="" src="img/LOGO.png" width="320" height="50"></a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                    	<a class="button-nav" href="nursehome.jsp" style="font-size:20px;">HOME</a>
                    </li>
                    <li>
                    	<a class="button-nav" href="doctorsreg.jsp" style="font-size:20px;">ADD DOCTOR</a>
                    </li>
                    <li>
                        <a class="button-nav" href="nuProfile" style="font-size:20px;">ACCOUNT</a>
                    </li>
                    <li>
                        <a class="button-nav" href="logout" style="font-size:20px;">LOGOUT</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

	<div class="container-fluid content2 titles">
		<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
		<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6">
			<h1>SEARCH PATIENT</h1>
		</div>
		<div class="col-md-5 col-xs-5 col-sm-5 col-lg-5 content2">
			<h3>
				Hello,
				<s:property value="#session['type']" />
				<s:property value="#session['name']" />
			</h3>
		</div>
	</div>
	<br>
	<div class="trans2">
		<br>
	</div>
	<div class="content trans"
		style="width: 100%; height: 100%; margin: 0 auto;">
		<br> <br>
		<div class="container queue content trans">

			<%
					int i = 0;
				%>

			<s:iterator value="p" var="p">


				<%
						i++;
					%>
				<div class="row" style="background-color: white; color: #24bde7;">
				<hr style="border: 1px solid #24bde7;">
					<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
					<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6">
						<br>
						<div class="row">
							<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
							<div class="col-md-3 col-xs-3 col-sm-3 col-lg-3"
								style="text-align: left;">USERNAME:</div>
							<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"
								style="text-align: center;">
								<s:property value="#p.username" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
							<div class="col-md-3 col-xs-3 col-sm-3 col-lg-3"
								style="text-align: left;">FULL NAME:</div>
							<div class="col-md-8 col-xs-8 col-sm-8 col-lg-8"
								style="text-align: left;">
								<s:property value="#p.lname" />
								,
								<s:property value="#p.fname" />
							</div>
						</div>
						<div class="row">
							<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
							<div class="col-md-3 col-xs-3 col-sm-3 col-lg-3"
								style="text-align: left;">GENDER:</div>
							<div class="col-md-8 col-xs-8 col-sm-8 col-lg-8"
								style="text-align: left;">
								<s:property value="#p.sex" />
							</div>
						</div>
						<div class="row">
						<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
							<div class="col-md-3 col-xs-3 col-sm-3 col-lg-3">
							<s:form action="setPatientNurse">
							<s:hidden key="patient" value="%{#p.username}" />
							<s:submit value="ADD MEDICAL HISTORY" cssClass="button"
								style="width: 290px; height: 40px;" />
						</s:form></div>
							
							
						</div>
						<div class="row">
						<br>
							
						</div>
						

					</div>
					<br>
					<s:form cssClass="col-md-3 col-xs-3 col-sm-3 col-lg-3" action="weeklydatenurse">
						<s:div cssClass="row">
							<s:div cssClass="col-md-3 col-xs-3 col-sm-3 col-lg-3" style="text-align: left;">DATE:</s:div>
							<s:div cssClass="col-md-3 col-xs-3 col-sm-3 col-lg-3">
								<input type="date" id="wd.dateNow" name="wd.dateNow" required
							style="color: #24bde7; width: 200px; height: 20px" />
							</s:div>
						</s:div>
						<s:div cssClass="row">
							<s:div cssClass="col-md-3 col-xs-3 col-sm-3 col-lg-3">DOCTOR:</s:div>
							<s:div cssClass="col-md-3 col-xs-3 col-sm-3 col-lg-3">
								<s:select key="wd.docNum" name="wd.docNum" list="dlist"
							 	listKey="username"
								listValue="%{fname+' '+lname+' ('+specialization+')'}"
								style="color: #24bde7; width: 200px; height: 20px" theme="simple"/>
							</s:div>
							
						</s:div>
						<s:div cssClass="row">
							<s:div cssClass="col-md-1 col-xs-1 col-sm-1 col-lg-1">
								<s:hidden name="patientNum" value="%{#p.username}"
								key="patientNum" />
								<s:submit value="RESERVE" cssClass="button"
							style="width: 290px; height: 40px;" />
							</s:div>
						</s:div>
						<s:div cssClass="row">
							<br>
						</s:div>
					</s:form>
				</div>


				<%
						if (i == 0) {
					%>
 	No patients in the database
 
 	<%
						}
					%>
			</s:iterator>
		</div>

		<br> <a href="nursehome.jsp">GO BACK</a> <br> <br>
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