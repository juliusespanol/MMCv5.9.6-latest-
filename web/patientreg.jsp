<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="reg" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/agency.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

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

.errorMessage {
	color: red;
}
</style>
</head>
<body>

	<nav id="mainNav"
		class="navbar navbar-default navbar-custom navbar-fixed-top navtrans">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> Menu <i
					class="fa fa-bars"></i>
			</button>
			<a class="logo navbar-left" href="index.jsp"><img alt=""
				src="img/LOGO.png" width="320" height="50"></a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a class="button-nav" href="index.jsp"
					style="font-size: 20px;">HOME</a></li>
				<li><a class="button-nav" href="viewDList"
					style="font-size: 20px;">DOCTORS</a></li>
				<li><a class="button-nav" href="login.jsp"
					style="font-size: 20px;">LOGIN</a></li>
				<li><a class="button-nav" href="contactus.jsp"
					style="font-size: 20px;">CONTACT US</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="container-fluid content2 titles">
		<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
		<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6">
			<h1>PATIENT'S REGISTRATION</h1>
		</div>
	</div>
	<br>
	<div class="trans2">
		<br>
	</div>
	<div class="content trans" style="width: 100%">
		<br>
		<div class="container queue content trans2"
			style="width: 80%; margin: 0 auto;">
			<div class="row" style="margin: 0 auto;">
				<h2>ENTER PATIENT'S CREDENTIALS</h2>
				<hr style="border: 1px solid #24bde7;">
				<reg:form action="register" method="post">
					<table style="margin: 0 auto; border: none; color: #24bde7;">
						<tbody>
							<tr>
								<td><reg:textfield id="labels" label="EMAIL/USER"
										key="username" style="width: 250px; color: black;" /> <reg:password
										id="labels" label="PASSWORD" key="password"
										style="width: 250px; color: black;"
										placeholder="Minimum of 6 characters" />
								<td style="font-size: 18px;"><b>FIRST NAME:</b></td>
								<td><input type="text" id="labels" key="fname"
									style="width: 250px; color: black;" required /></td>
							<tr>
								<td style="font-size: 18px;"><b>LAST NAME:</b></td>
								<td><input type="text" id="labels" key="lname"
									style="width: 250px; color: black;" required /></td>
							</tr>

							<td style="font-size: 18px;"><b>BIRTHDATE:</b></td>
							<td><input type="date" id="labels" key="birthdate"
								style="width: 250px; color: black;" required /></td>
							<tr />

							<td style="font-size: 18px;"><b>ADDRESS:</b></td>
							<td><input type="text" id="labels" key="address"
								style="width: 250px; color: black;" required /></td>
							<reg:select id="labels" label="SEX" key="sex" headervalue=" "
								list="{'MALE', 'FEMALE'}"
								style="width: 250px; height: 30px; color: black;" />
							</td>
							</tr>



							<tr>

							</tr>
							<tr>
								<td colspan="2"><reg:submit value="REGISTER"
										cssClass="button-search"
										style="margin: 0 auto; width: 250px; font-size: 18px;" /></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td colspan="2"><reg:reset value="CLEAR"
										cssClass="button-search"
										style="margin: 0 auto; width: 250px; font-size: 18px;" /></td>
							</tr>
						</tbody>
					</table>
					<br>
				</reg:form>
			</div>
		</div>
		<br>
	</div>
	<div class="trans2">
		<br>
	</div>
	<script src="vendor/jquery/jquery.min.js"></script>

	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"
		integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb"
		crossorigin="anonymous"></script>

	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<script src="js/agency.min.js"></script>
</body>
</html>