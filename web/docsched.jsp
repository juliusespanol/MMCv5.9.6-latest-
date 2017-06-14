<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	font-size: 15px;
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
               <a class="logo navbar-left" href="docqueue.jsp"><img alt="" src="img/LOGO.png" width="320" height="50"></a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                    	<a class="button-nav" href="docqueue.jsp" style="font-size:20px;">HOME</a>
                    </li>
                    <li>
                    	<a class="button-nav" href="docProfile" style="font-size:20px;">ACCOUNT</a>
                    </li>
                    <li>
                        <a class="button-nav" href="docsched.jsp" style="font-size:20px;">SCHEDULE</a>
                    </li>
                    <li>
                        <a class="button-nav" href="viewPList" style="font-size:20px;">PATIENTS</a>
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
			<h1>MY SCHEDULE</h1>
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
	<div class="container content trans" style="width: 100%; height: 100%;">
		<br>
		<div class="container-fluid queue content trans2"
			style="background-color: white;">
			<div class="row" style="background-color: white; text-align: center;">
				<br>
				<div class="col-md-1 col-xs-1 col-sm-1 col-lg-1"></div>
					<h3>WEEKLY SCHEDULE</h3>
				 	<hr style="border: 1px solid #24bde7;">

						
					<s:form cssClass="row" action="addweek" method="post">
						<s:div cssClass="col-md-4 col-xs-4 col-sm-4 col-lg-4"> 
						
						<s:select id="labels" label="Year" key="year" style="width: 275px; height: 30px;" 
											headerValue=" "
											list="{'2017','2018','2019','2020'}"/>
						<s:select  id="labels" label="Month" key="month" style="width: 275px; height: 30px;" 
											headerValue=""
											list="#{'01':'Jan', '02':'Feb', '03':'Mar',
							'04':'Apr','05':'May','06':'Jun','07':'Jul',
							'08':'Aug','09':'Sep','10':'Oct','11':'Nov',
							'12':'Dec'}"/>
				
	
											
						<!--<s:checkbox label="SUN" key="week" value="1"/>
						<s:checkbox label="MON" key="week" value="2"/>
						<s:checkbox label="TUE" key="week" value="3"/>
						<s:checkbox label="WED" key="week" value="4"/>
						<s:checkbox label="THU" key="week" value="5"/>
						<s:checkbox label="FRI" key="week" value="6"/>
						<s:checkbox label="SAT" key="week" value="7"/>-->
						<s:checkboxlist id="labels" label="Week" key="week" list="#{'7':'sun', '1':'mon', '2':'tue',
							'3':'wed','4':'thu','5':'fri','6':'sat'}" />
			
						<s:select id="labels" label="Time start" key="time" style="width: 275px; height: 30px;" 
											headerValue=" "
											list="#{'0':'9:00 AM', '1':'9:30 AM', '2':'10:00 AM', '3':'10:30 AM',
							'4':'11:00 AM','5':'11:30 AM','6':'12:00 NN','7':'12:30 PM',
							'8':'1:00 PM','9':'1:30 PM','10':'2:00 PM','11':'2:30 PM',
							'12':'3:00 PM','13':'3:30 PM','14':'4:00 PM','15':'4:30 PM',
							'16':'5:00 PM','17':'5:30 PM'}"/>
						<s:select id="labels" label="Time end" key="end" style="width: 275px; height: 30px;" 
											headerValue=" "
											list="#{'1':'9:30 AM', '2':'10:00 AM', '3':'10:30 AM',
							'4':'11:00 AM','5':'11:30 AM','6':'12:00 NN','7':'12:30 PM',
							'8':'1:00 PM','9':'1:30 PM','10':'2:00 PM','11':'2:30 PM',
							'12':'3:00 PM','13':'3:30 PM','14':'4:00 PM','15':'4:30 PM',
							'16':'5:00 PM','17':'5:30 PM','18':'6:00 PM'}"/>
						<s:submit value="UPDATE SCHEDULE" cssClass="button-search" style="width: 280px; height: 30px;" />
						</s:div>
					</s:form> 
			</div>
			<center>
				<div class="col-md-12 col-xs-12 col-sm-12 col-lg-12">
					<h3>VIEW SCHEDULE</h3>
					<hr style="border: 1px solid #24bde7;">
					<s:form action="weeklydatedoc.action" method="post">
						<table style="margin: 0 auto;">
							<tbody>
								<tr>
									<td colspan="2"><input type="date" id="wd.dateNow"
										name="wd.dateNow" required style="width: 250px; height: 30px;" />
									</td>
								</tr>
								<tr>
									<td><s:hidden key="wd.docNum"
											value="%{#session['docuser'].username}" /> <br> <s:submit
											value="See Schedule" cssClass="button-search"
											style="width: 250px; height: 30px;" /></td>
								</tr>
							</tbody>
						</table>
					</s:form>
				</div>
				<br>
			</center>
			<br>
		</div>
		<br>
	</div>
	<br>
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