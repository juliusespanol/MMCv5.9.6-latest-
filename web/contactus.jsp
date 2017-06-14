<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<h1>CONTACT US</h1>
	</div>
</div><br>
<div class="trans2"><br></div>
<div class="content trans" style="width: 100%; height: 100%;">
	<br>
	<div class="container doclist content trans2">
	<h2>79 C, Maginhawa St., Techers Village Quezon City<br>
        	(02)545 34 43</h2>
    <div class="row">
		<div class="col-md-2 col-xs-2 col-sm-2 col-lg-2"></div>
		<div class="col-md-8 col-xs-8 col-sm-8 col-lg-8">
    		<script>
			function myMap() {
    			var mapOptions = {
        			center: new google.maps.LatLng(14.646970, 121.057907),
        			zoom: 18,
        			mapTypeId: google.maps.MapTypeId.ROADMAP
    			}
    	        var point = {lat: 14.646970, lng: 121.057907};
				var map = new google.maps.Map(document.getElementById("map"), mapOptions);
    	        var marker = new google.maps.Marker({
    	            position: point,
    	            map: map
    	          });
			}
			</script>
			<div id="map" style="width: 100%; height: 400px;">
				<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBQFTGYjT2LynpMDSxTkMrIbeYrwpQ9SPk&callback=myMap">
				</script>
			</div>
		</div>
		<div class="col-md-2 col-xs-2 col-sm-2 col-lg-2"></div>
    </div>
    <br><br>
	</div>
	<br>
</div>
<div class="trans2"><br></div>
</body>
</html>