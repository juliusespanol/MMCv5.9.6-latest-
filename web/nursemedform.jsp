<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="mform" uri="/struts-tags"%>
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

.newfont {
	font-family: "Montserrat", "Helvetica Neue", Helvetica, Arial,
		sans-serif;
}

label[for="labels"] {
	color: #24bde7;
	font-size: 20px;
	align: right;
}
</style>
</head>
<body>

	<script>
		function confirm_delete() {
			return confirm('Are you sure the following inputs are correct?');
		}
	</script>

	<nav id="mainNav"
		class="navbar navbar-default navbar-custom navbar-fixed-top navtrans">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> Menu <i
					class="fa fa-bars"></i>
			</button>
			<a class="logo navbar-left" href="nursehome.jsp"><img alt=""
				src="img/LOGO.png" width="320" height="50"></a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a class="button-nav" href="nursehome.jsp"
					style="font-size: 20px;">HOME</a></li>
				<li><a class="button-nav" href="doctorsreg.jsp"
					style="font-size: 20px;">ADD DOCTOR</a></li>
				<li><a class="button-nav" href="nuProfile"
					style="font-size: 20px;">ACCOUNT</a></li>
				<li><a class="button-nav" href="logout"
					style="font-size: 20px;">LOGOUT</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container-fluid content2 titles">
		<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
		<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6">
			<h1>MEDICAL HISTORY</h1>
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
		<br>
		<div class="container-fluid queue trans2">
			<div class="row container-fluid">
				<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"
					style="background-color: #24bde7; color: WHITE;">
					<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"></div>
				</div>

				<s:iterator value="list" var="hist">

					<div class="row sep" style="background-color: white">
						<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>

						<div class="col-md-5 col-xs-5 col-sm-5 col-lg-5">
							Date and Time added:
							<s:property value="#hist.dtime" />
							<br> Added by:
							<s:property value="#hist.physician" />
						</div>
						<div class="col-md-4 col-xs-4 col-sm-4 col-lg-4">
							<form action="onemedhistnurse">
								<s:hidden key="i" value="%{#hist.histID}" />
								<s:submit value="View" cssClass="button"
									style="width: 250px; height: 40px; font-size: 20px;" />
							</form>
						</div>
					</div>

				</s:iterator>
			</div>
		</div>

		<div class="row container-fluid queue trans2">
			<br>
			<div class="col-md-3 col-xs-3 col-sm-3 col-lg-3"></div>
			<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"
				style="background-color: #24bde7; color: WHITE;">
				<span
					style="font-size: 18px; cursor: pointer; width: 200px; height: 40px;"
					onclick="openNav2()">MEDICAL FORM</span>
			</div>
		</div>
		<div class="row container-fluid queue trans2">
			<br>
		</div>
		<br>
	</div>
	<div class="trans2">
		<br>
	</div>


	<div id="myNav2" class="overlay">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav2()">&times;</a>
		<div class="overlay-content">
			<div class="container-fluid doclist trans2">
				<h1>MEDICAL FORM</h1>
			</div>
			<div class="container-fluid doclist trans2">
				<br>
				<div class="container-fluid doclist"
					style="background-color: WHITE;">
					<br>
					<mform:form cssClass="row container-fluid doclist content"
						action="addMedHistNurse" theme="simple"
						style="background-color: WHITE; text-align: left;">
						<br>
						<mform:div cssClass="col-md-6 col-xs-6 col-sm-6 col-lg-6">
							<mform:div cssClass="row" theme="simple">
								<br>
								<mform:div cssClass="row" theme="simple">
									<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2"></mform:div>
									<mform:div cssClass="col-md-4 col-xs-4 col-sm-4 col-lg-4">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">BP: mmHg</span>
										<mform:textfield key="bp"
											style="width: 250px; height: 40px; font-size: 30px;" />
									</mform:div>
									<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">HT: cm</span>
										<mform:textfield type="number" key="ht"
											style="width: 250px; height: 40px; font-size: 30px;" />
									</mform:div>
								</mform:div>
								<br>
								<mform:div cssClass="row" theme="simple">
									<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2"></mform:div>
									<mform:div cssClass="col-md-4 col-xs-4 col-sm-4 col-lg-4">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">HR: bpm (beats per minute)</span>
										<mform:textfield type="number" key="hr"
											style="width: 250px; height: 40px; font-size: 30px;" />
									</mform:div>
									<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">WT: kgs</span>
										<mform:textfield type="number" key="wt"
											style="width: 250px; height: 40px; font-size: 30px;" />
									</mform:div>
								</mform:div>
								<br>
								<mform:div cssClass="row" theme="simple">
									<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2"></mform:div>
									<mform:div cssClass="col-md-4 col-xs-4 col-sm-4 col-lg-4">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">RR: bpm(breaths per minute)</span>
										<mform:textfield type="number" key="rr"
											style="width: 250px; height: 40px; font-size: 30px;" />
									</mform:div>
									<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">BMI: kg/m<sup>2</sup></span>
										<mform:textfield type="number" key="bmi"
											style="width: 250px; height: 40px; font-size: 30px;" />
									</mform:div>
								</mform:div>
							</mform:div>
						</mform:div>
						<mform:div cssClass="col-md-5 col-xs-5 col-sm-5 col-lg-5">
							<mform:div cssClass="row" theme="simple">
								<br>
								<mform:div cssClass="row" theme="simple">
									<mform:div cssClass="col-md-5 col-xs-5 col-sm-5 col-lg-5">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">DOCTOR:</span>
										<mform:textfield key="doc"
											style="width: 250px; height: 40px; font-size: 30px;" />
									</mform:div>
									<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">CONDITION:</span>
										<mform:textfield key="condi"
											style="width: 250px; height: 40px; font-size: 30px;" />
									</mform:div>
								</mform:div>
								<br>
								<mform:div cssClass="row" theme="simple">
									<mform:div cssClass="col-md-5 col-xs-5 col-sm-5 col-lg-5">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">HOSPITAL:</span>
										<mform:textfield key="hospital"
											style="width: 250px; height: 40px; font-size: 30px;" />
									</mform:div>
									<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">ALLERGIES:</span>
										<mform:textfield key="allergies"
											style="width: 250px; height: 40px; font-size: 30px;" />
									</mform:div>
								</mform:div>
								<br>
								<mform:div cssClass="row" theme="simple">
									<mform:div cssClass="col-md-5 col-xs-5 col-sm-5 col-lg-5">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">PREVIOUS
											OPERATIONS:</span>
										<mform:textfield key="prevop"
											style="width: 250px; height: 40px; font-size: 30px;" />
									</mform:div>
									<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">PREVIOUS
											HOSPITALIZATIONS:</span>
										<mform:textfield key="prevhosp"
											style="width: 250px; height: 40px; font-size: 30px;" />
									</mform:div>
								</mform:div>
								<br>
							</mform:div>
						</mform:div>
						<br>

						<mform:div cssClass="row" theme="simple">
							<mform:div cssClass="col-md-12 col-xs-12 col-sm-12 col-lg-12"
								theme="simple" style="text-align: center;">
								<mform:submit cssClass="button" value="ADD"
									style="width: 250px; height: 40px; font-size: 25px;"
									onclick="return confirm_delete()" />
							</mform:div>
						</mform:div>
					</mform:form>
				</div>
			</div>
			<div class="container-fluid doclist trans2">
				<br>
				<br>
			</div>
		</div>
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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"
		integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb"
		crossorigin="anonymous"></script>

	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<script src="js/agency.min.js"></script>
</body>
</html>


