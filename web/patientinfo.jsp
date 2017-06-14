<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="mform" uri="/struts-tags"%>
<%@taglib prefix="addConsult" uri="/struts-tags"%>

<!DOCTYPE html>
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
				<a class="logo navbar-left" href="docqueue.jsp"><img alt=""
					src="img/LOGO.png" width="320" height="50"></a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="button-nav" href="docqueue.jsp"
						style="font-size: 20px;">HOME</a></li>
					<li><a class="button-nav" href="docProfile"
						style="font-size: 20px;">ACCOUNT</a></li>
					<li><a class="button-nav" href="docsched.jsp"
						style="font-size: 20px;">SCHEDULE</a></li>
					<li><a class="button-nav" href="viewPList"
						style="font-size: 20px;">PATIENTS</a></li>
					<li><a class="button-nav" href="logout"
						style="font-size: 20px;">LOGOUT</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid content2 titles">
		<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
		<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6">
			<h1>PATIENT'S INFORMATION</h1>
		</div>
		<div class="col-md-5 col-xs-5 col-sm-5 col-lg-5">
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


	<div id="myNav" class="overlay">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div class="overlay-content">
			<div class="container-fluid doclist trans2">
				<h1>ADD MEDICAL HISTORY</h1>
			</div>
			<div class="container-fluid doclist trans2">
				<mform:form cssClass="row container-fluid doclist content"
					action="addMedHist" theme="simple"
					style="background-color: WHITE; text-align: left;">
					<br>
					<mform:div cssClass="col-md-6 col-xs-6 col-sm-6 col-lg-6">
						<mform:div cssClass="row" theme="simple">
							<br>
							<mform:div cssClass="row" theme="simple">
								<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2"></mform:div>
								<mform:div cssClass="col-md-4 col-xs-4 col-sm-4 col-lg-4">
									<span class="label"
										style="color: #24bde7; font-size: 15px; align: right;">BP:
										mmHg</span>
									<mform:textfield key="bp"
										style="width: 250px; height: 40px; font-size: 30px;" />
								</mform:div>
								<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2">
									<span class="label"
										style="color: #24bde7; font-size: 15px; align: right;">HT:
										cm</span>
									<mform:textfield type="number" key="ht"
										style="width: 250px; height: 40px; font-size: 30px;" />
								</mform:div>
							</mform:div>
							<br>
							<mform:div cssClass="row" theme="simple">
								<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2"></mform:div>
								<mform:div cssClass="col-md-4 col-xs-4 col-sm-4 col-lg-4">
									<span class="label"
										style="color: #24bde7; font-size: 15px; align: right;">HR:
										bpm (beats per minute)</span>
									<mform:textfield type="number" key="hr"
										style="width: 250px; height: 40px; font-size: 30px;" />
								</mform:div>
								<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2">
									<span class="label"
										style="color: #24bde7; font-size: 15px; align: right;">WT:
										kgs</span>
									<mform:textfield type="number" key="wt"
										style="width: 250px; height: 40px; font-size: 30px;" />
								</mform:div>
							</mform:div>
							<br>
							<mform:div cssClass="row" theme="simple">
								<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2"></mform:div>
								<mform:div cssClass="col-md-4 col-xs-4 col-sm-4 col-lg-4">
									<span class="label"
										style="color: #24bde7; font-size: 15px; align: right;">RR:
										bpm(breaths per minute)</span>
									<mform:textfield type="number" key="rr"
										style="width: 250px; height: 40px; font-size: 30px;" />
								</mform:div>
								<mform:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2">
									<span class="label"
										style="color: #24bde7; font-size: 15px; align: right;">BMI:
										kg/m<sup>2</sup>
									</span>
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
					<mform:div cssClass="col-md-4 col-xs-4 col-sm-4 col-lg-4"
						theme="simple">

					</mform:div>
					<mform:div cssClass="row" theme="simple">
						<mform:div cssClass="col-md-12 col-xs-12 col-sm-12 col-lg-12"
							theme="simple" style="text-align: center;">
							<mform:submit cssClass="button" value="ADD"
								style="width: 250px; height: 40px; font-size: 25px;" onclick="return confirm_delete()"/>
						</mform:div>
					</mform:div>
				</mform:form>
			</div>
			<div class="container-fluid doclist trans2">
				<br>
			</div>
		</div>

	</div>
	<div id="myNav2" class="overlay">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav2()">&times;</a>
		<div class="overlay-content">
			<div class="container-fluid doclist trans2">
				<h1>ADD CONSULTATION</h1>
			</div>
			<div class="container-fluid doclist trans2">
				<br>
				<div class="container-fluid doclist"
					style="background-color: WHITE;">
					<br>
					<addConsult:form action="addConsultation" method="post"
						theme="simple">
						<addConsult:div cssClass="row">
							<addConsult:div cssClass="col-md-1 col-xs-1 col-sm-1 col-lg-1"></addConsult:div>
							<addConsult:div cssClass="col-md-5 col-xs-5 col-sm-5 col-lg-5">
								<addConsult:div cssClass="row">
									<addConsult:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2"></addConsult:div>
									<addConsult:div cssClass="col-md-5 col-xs-5 col-sm-5 col-lg-5"
										style="text-align: right; font-size: 30px;">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">DIAGNOSIS:</span>
										<addConsult:textarea key="diagnosis"
											style="width: 500px; height: 100px; font-size: 14px;" />
									</addConsult:div>
								</addConsult:div>
								<addConsult:div cssClass="row">
									<addConsult:div cssClass="col-md-2 col-xs-2 col-sm-2 col-lg-2"></addConsult:div>
									<addConsult:div cssClass="col-md-5 col-xs-5 col-sm-5 col-lg-5"
										style="text-align: right; font-size: 30px;">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">PRESCRIPTION:</span>
										<addConsult:textarea key="prescription"
											style="width: 500px; height: 100px; font-size: 14px;" />
									</addConsult:div>
								</addConsult:div>
							</addConsult:div>
							<addConsult:div cssClass="col-md-5 col-xs-5 col-sm-5 col-lg-5">
								<addConsult:div cssClass="row">
									<addConsult:div cssClass="col-md-5 col-xs-5 col-sm-5 col-lg-5"
										style="text-align: right; font-size: 30px;">
										<span class="label"
											style="color: #24bde7; font-size: 15px; align: right;">NOTES:</span>
										<addConsult:textarea key="notes"
											style="width: 500px; height: 100px; font-size: 14px;" />
									</addConsult:div>
								</addConsult:div>
								<addConsult:div cssClass="row">
									<addConsult:div cssClass="col-md-5 col-xs-5 col-sm-5 col-lg-5">
										<br>
										<br>
									</addConsult:div>
									<addConsult:div cssClass="col-md-1 col-xs-1 col-sm-1 col-lg-1"></addConsult:div>
								</addConsult:div>
							</addConsult:div>
						</addConsult:div>
						<center>
							<table>
								<tr>
									<td><addConsult:submit cssClass="button"
											value="ADD CONSULTATION"
											style="width: 500px; height: 80px; font-size: 35px;" onclick="return confirm_delete()"/></td>
								</tr>
							</table>
						</center>
					</addConsult:form>
				</div>
			</div>
			<div class="container-fluid doclist trans2">
				<br>
				<br>
			</div>
		</div>
	</div>

	<div class="content trans" style="width: 100%; height: 100%;">
		<br>
		<div class="container queue content trans">

			<div class="row" style="background-color: WHITE; text-align: left;">
				<br>
				<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1">
					<br>
				</div>
				<div class="col-md-5 col-xs-5 col-sm-5 col-lg-5">
					<span class="label"
						style="color: GREY; font-size: 30px; align: right;"> <s:property
							value="ub.lname" />, <s:property value="ub.fname" /></span>
				</div>
				<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6">
					<br>
				</div>
			</div>
			<div class="row" style="background-color: WHITE; text-align: left;">
				<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
				<div class="col-md-5 col-xs-5 col-sm-5 col-lg-5">
					<h1>BASIC INFO</h1>
					<hr style="border: 1px solid #24bde7;">
					<div class="row">
						<div class="col-md-4 col-xs-4 col-sm-4 col-lg-4"
							style="text-align: right;">
							USERNAME:<br> NAME:<br> GENDER:<br> DATE OF BIRTH:<br>
						</div>
						<div class="col-md-8 col-xs-8 col-sm-8 col-lg-8">
							<s:property value="ub.username" />
							<br>
							<s:property value="ub.lname" />
							,
							<s:property value="ub.fname" />
							<br>
							<s:property value="ub.sex" />
							<br>
							<s:property value="ub.birthdate" />
						</div>
					</div>
					<br> <br> <br> <br>
					<div class="row container-fluid">
						<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"
							style="background-color: #24bde7; color: WHITE;">
							<span style="font-size: 18px; cursor: pointer"
								onclick="openNav2()">Add Consultation</span>
						</div>
						<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"></div>
					</div>
					<br>
					<div class="row container-fluid">
						<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"
							style="background-color: #24bde7; color: WHITE;">
							<a href="viewConsultation.action"
								style="background-color: #24bde7; color: WHITE; font-size: 18px; text-decoration: none;">
								View Consultation</a> <br>
						</div>
						<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"></div>
						<br>
					</div>
					<br>
				</div>
				<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6">
					<h1>MEDICAL HISTORY</h1>
					<hr style="border: 1px solid #24bde7;">
					<div class="row container-fluid">
						<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"
							style="background-color: #24bde7; color: WHITE;">
							<span style="font-size: 20px; cursor: pointer"
								onclick="openNav()">Add Medical History</span>
						</div>
						<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"></div>
					</div>
					<!-- ITERATOR START -->
					<%
						int i = 0;
					%>
					<s:iterator value="list" var="hist">
						<%
							i++;
						%>
						<div class="row" style="border-left: 2px solid #24bde7;">
							<br>
							<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
							<div class="col-md-3 col-xs-3 col-sm-3 col-lg-3"
								style="text-align: right;">

								DATE & TIME:<br> ADDED BY:<br> CONDITION:<br>
								HOSPITAL:<br> ALLERGIES:<br> DOCTOR:<br> Previous
								Hospital:<br> Previous Op:<br> BP:<br> HT:<br>
								HR:<br> WT:<br> RR:<br> BMI:<br>


							</div>
							<div class="col-md-7 col-xs-7 col-sm-7 col-lg-7">
								<s:property value="#hist.dtime" />
								<br>
								<s:property value="#hist.physician" />
								<br>
								<s:property value="#hist.condi" />
								<br>
								<s:property value="#hist.hospital" />
								<br>
								<s:property value="#hist.allergies" />
								<br>
								<s:property value="#hist.doc" />
								<br>
								<s:property value="#hist.prevhosp" />
								<br>
								<s:property value="#hist.prevop" />
								<br>
								<s:property value="#hist.bp" />
								mmHg <br>
								<s:property value="#hist.ht" />
								cm <br>
								<s:property value="#hist.hr" />
								bpm(beats per minute) <br>
								<s:property value="#hist.wt" />
								kgs <br>
								<s:property value="#hist.rr" />
								bpm(breaths per minute) <br>
								<s:property value="#hist.bmi" />
								kg/m<sup>2</sup> <br> <br>
							</div>
							<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
						</div>
						<br>
					</s:iterator>
					<%
						if (i == 0) {
					%>
					You have not added any medical history for this patient
					<%
						} else {
					%>
					<a href="medhistory">See Previous Medical Histories</a>
					<%
						}
					%>
					<!-- ITERATOR END -->
				</div>
			</div>
		</div>
		<br>
	</div>
	<div class="trans2">
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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"
		integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb"
		crossorigin="anonymous"></script>

	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<script src="js/agency.min.js"></script>
</body>
</html>