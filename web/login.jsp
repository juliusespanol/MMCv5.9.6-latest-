
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="login" uri="/struts-tags"%>
<%@taglib prefix="ver" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC>
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
.errorMessage {
  color: red;
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
	<div class="container-fluid content2 titles">
		<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
		<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6">
			<h1>LOGIN</h1>
		</div>
	</div>
	<br>
	<div class="trans2">
		<br>
	</div>
	<div class="content trans" style="width: 100%;">
		<br>
		<div class="container queue content trans2"
			style="width: 80%; margin: 0 auto;">
			<br>
			<br>
			<login:form action="loginsubmit" method="post" theme="css_xhtml">
				<table style="border: none; margin: 0 auto;">
					<tr>
						<td><login:textfield id="labels" label="USERNAME / EMAIL "
								key="username"
								style="width: 250px; height: 40px; font-size: 18px;" /></td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td><login:password id="labels" label="PASSWORD "
								key="password"
								style="width: 250px; height: 40px; font-size: 18px;" /></td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
					<tr>
						<td><login:submit cssClass="button-search" value="Login"
								style="width: 250px; height: 35px; font-size: 25px;" /></td>
					</tr>

				</table>

			</login:form>
			<h5>
				<a style="cursor: pointer;" onclick="openNav()">Forgot Password</a>
			</h5>
			<h4>
				<a href="patientreg.jsp">CLICK HERE TO REGISTER</a>
			</h4>
		</div>
		<br>
	</div>
	<div class="trans2">
		<br>
	</div>
	<div id="myNav" class="overlay">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div class="overlay-content">
			<div class="container queue content trans22">
				<br> <br>
				<h1>FORGOT PASSWORD</h1>
				<hr style="border: 1px solid #24bde7">
				<login:form action="forgot.action" method="post" theme="css_xhtml">
					<table style="margin: 0 auto;">
					<tbody>
						<tr>
							<td>
							<login:textfield id="labels" label="Enter username/email"
								key="email" style="width: 270px; height: 40px; font-size: 24px;" />
							</td>
						</tr>
						<tr>
							<td>
							<br>
							<login:submit cssClass="button-search" value="Verify"
								style="width: 270px; height: 35px; font-size: 25px;" />
							</td>
						</tr>
						</tbody>
					</table>
				</login:form>
				<br>
			</div>
			<br>
		</div>
	</div>

	<script>
		function openNav() {
			document.getElementById("myNav").style.height = "100%";
		}

		function closeNav() {
			document.getElementById("myNav").style.height = "0%";
		}
	</script>

</body>
</html>
