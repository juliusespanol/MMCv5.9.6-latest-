<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="ver" uri="/struts-tags"  %>    
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
	font-size: 25px;
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
			<h1>NURSE PROFILE</h1>
		</div>
		<div class="col-md-5 col-xs-5 col-sm-5 col-lg-5 content2">
			<h3> 
				Hello, <ver:property value="#session['type']"/> <ver:property value="#session['name']"/>
			</h3>
		</div>
	</div><br>
<div class="trans2"><br></div>
<div class="content trans" style="width: 100%; height: 100%;">
	<br>
	<div class="container queue content trans2">
<div class="row container-fluid queue content" style="background-color: WHITE; text-align: center;">
		
		<br>
		<div class="col-md-3 col-xs-3 col-sm-3 col-lg-3"></div>
		<div class="col-md-5 col-xs-5 col-sm-5 col-lg-5" style="text-align: right; font-size: 30px;">
			<ver:form action="changepassword" method="post">
			<ver:password id="labels" label="Current Password" key="oldpass" />
		
			<ver:password id="labels" label="New Password" key="pass1" />
			<ver:password id="labels" label="Enter Password again" key="pass2" />
			
			<ver:submit cssClass="button-search" value="Create new password"
						style="width: 250px; height: 40px; font-size: 20px;" />
				<ver:reset cssClass="button-search" 
						style="width: 250px; height: 40px; font-size: 20px;" />
			</ver:form>
				
		</div>
		<div class="col-md-12 col-xs-12 col-sm-12 col-lg-12"
					 style=" color: WHITE; ">
					<a style="font-size:20px;cursor:pointer; text-decoration: none; " href="patientProf">BACK</a>
			</div>
	</div>
	</div>
	<br>
</div>
<script>
function openNav() {
    document.getElementById("myNav").style.height = "100%";
}

function closeNav() {
    document.getElementById("myNav").style.height = "0%";
}
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


