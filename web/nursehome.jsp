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
			<h1>PATIENT SEARCH</h1>
		</div>
		<div class="col-md-5 col-xs-5 col-sm-5 col-lg-5 newfont">
			<h3 class="newfont"> 
				Hello, <s:property value="#session['type']"/> <s:property value="#session['name']"/>
			</h3>
		</div>
	</div>
	<br>
	<div class="trans2">
		<br>
	</div>
	<div class="content trans"
		style="width: 100%; height: 100%; margin: 0 auto;">
		<br>
		<div class="container queue content trans" style="margin: 0 auto;">
			<div class="row" style="background-color: WHITE; text-align: left;">
				<br>
				<center>
					<h2>ENTER PATIENT CREDENTIALS</h2>
				</center>
				<hr style="border: 1px solid 24bde7">
				<s:form action="searchpatient">
					<table style="margin: 0px auto;">
						<tbody>
							<tr>
								<td><s:textfield id="labels" label="USERNAME"
										key="pb.username"
										style="width: 250px; height: 30px; font-size: 18px;" /></td>
							</tr>
							<tr>
								<td><s:textfield id="labels" label="FIRST NAME" key="pb.fname"
										style="width: 250px; height: 30px; font-size: 18px;" /></td>
							</tr>
							<tr>
								<td><s:textfield id="labels" label="LAST NAME" key="pb.lname"
										style="width: 250px; height: 30px; font-size: 18px;" /></td>
							</tr>
							<tr>
								<td><s:textfield id="labels" label="BIRTHDATE"
										style="width: 250px; height: 30px; font-size: 18px;"
										key="pb.birthdate" /></td>
							</tr>
							<tr>
								<td><s:textfield id="labels" label="GENDER" key="pb.sex"
										style="width: 250px; height: 30px; font-size: 18px;" /></td>
							</tr>
							<tr>
								<td><s:submit id="labels" value="SEARCH"
										cssClass="button-search"
										style="width: 250px; font-size: 18px;" /></td>
							</tr>
						</tbody>
					</table>
				</s:form>
				<div class="row" style="margin: 0 auto">
					<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"></div>
					<div class="col-md-4 col-xs-4 col-sm-4 col-lg-4">
						<span style="margin: 0 auto">or <a href="guestreg.jsp">ADD
								NEW PATIENT</a></span>
					</div>
					<div class="col-md-4 col-xs-4 col-sm-4 col-lg-4"></div>
				</div>
				<br>
			</div>
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