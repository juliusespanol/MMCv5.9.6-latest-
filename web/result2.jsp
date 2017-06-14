<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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
td,th {
	border: 1px solid #BDC3C7;
	height: 40px;
	margin: 0 auto;
	text-align: center;
	width: 12%;
}

td {
	height: 5%;
}
</style>

<script type="text/javascript" src="js/date_time.js"></script>

<script>
	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on the button, open the modal 
	btn.onclick = function() {
		modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
</script>
<title>Maginhawa Medical Clinic</title>
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
			<h1>CALENDAR</h1>
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
	<div class="content trans">
		<br>
		<div class="row dnsContainer content"
			style="background-color: WHITE; width: 101%;">
			<br>
			<h1>SCHEDULED DATES</h1>
			<hr style="border: 1px solid #8bcfd0;">
			<span id="date_time"></span>
			<script type="text/javascript">
				window.onload = date_time('date_time');
			</script>
			<script>
				function schedule(form) {
					var person = prompt("Enter your note", "Schedule");

					if (person != null) {
						document.getElementById("Note").innerHTML = person;
						alert(form);
						document.getElementById(form).submit();
					}
				}
			</script>
			<s:form action="weeklydate" method="post">
				<p>
					Choose Another Date:
					<s:hidden key="wd.docNum" value="%{wd.docNum}" />
					<input type="date" id="wd.dateNow" name="wd.dateNow" />
					<button type="submit" class="button-search">Submit Date</button>
				</p>
				<p>
					You picked date:
					<s:property value="wd.dateNow" />
				</p>
				<p>
					Doctor:
					<s:property value="wd.docNum" />

				</p>
			</s:form>
			<table style="width: 90%; border: 1px solid #8bcdf0; margin: 0 auto;">
				<thead>

					<tr>

						<th>TIME/DAY</th>
						<th>SUNDAY:<br> <s:property value="wd.sun" /></th>
						<th>MONDAY:<br> <s:property value="wd.mon" /></th>
						<th>TUESDAY:<br> <s:property value="wd.tue" /></th>
						<th>WEDNESDAY:<br> <s:property value="wd.wed" /></th>
						<th>THURSDAY:<br> <s:property value="wd.thu" /></th>
						<th>FRIDAY:<br> <s:property value="wd.fri" /></th>
						<th>SATURDAY:<br> <s:property value="wd.sat" /></th>

					</tr>
				</thead>
				<tbody>
					<%
						Calendar startTime = Calendar.getInstance();
						startTime.setTime(new SimpleDateFormat("HH:mm").parse("09:00"));
					%>

					<s:iterator value="schedContent" var="timeSlot">
						<tr>
							<td><%=new SimpleDateFormat("HH:mm").format(startTime
						.getTime())%>
								<%
									startTime.add(Calendar.MINUTE, 30);
								%></td>
							<s:iterator value="timeSlot" var="sched">

								<td><s:div>
										<s:if test="%{Status=='available'}">
											<s:form id="" method="post">
												<s:hidden key="docSched" value="%{docSched}" />

												<s:property value="Status" />
												<s:hidden key="wd.dateNow" value="%{wd.dateNow}" />
												<s:hidden key="wd.docNum" value="%{wd.docNum}" />

												<s:submit cssClass="button-search" value="reserve" action="reserve"
													style="height: 30px;width: 190px;" />

											</s:form>
										</s:if>
										<s:elseif test="%{Status=='reserved'}">
											<s:form id="" action="reserve" method="post">
												<s:hidden key="docSched" value="%{docSched}" />
												<s:hidden key="wd.dateNow" value="%{wd.dateNow}" />
												<s:hidden key="wd.docNum" value="%{wd.docNum}" />

												<s:if test="%{patientNum==#session['patientuser'].username}">
										Your Reservation
										<s:submit cssClass="button-search" value="cancel" action="cancel"
														style="height: 30px;width: 190px;" />

												</s:if>
												<s:else>
													<s:property value="Status" />
												</s:else>
											</s:form>
										</s:elseif>
										
									</s:div></td>

							</s:iterator>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<br>
			<a class="button-nav" href="patientDList" style="font-size: 16px;">Back
				to Doctor List</a>
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