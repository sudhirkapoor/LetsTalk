
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<c:set var="imgs" value="/resources/images" />
<c:set var="btstrpcss" value="/resources/bootstrap/css" />
<c:set var="btstrpjs" value="/resources/bootstrap/js" />
<title>HOME PAGE</title>
<!-- <meta name="viewport content=" width=device-width, initial-scale=1.0"> -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="<c:url value="${btstrpjs}/bootstrap.min.js"/>"></script>
<!-- <script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>

<link rel="stylesheet"
	href="<c:url value="${btstrpcss}/bootstrap.min.css"/>">

<%-- <script src="<c:url value="${btstrpjs}/angular.min.js"/>"></script>
 --%>
<script src="<c:url value="${btstrpjs}/bootstrap.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="${btstrpcss}/bootstrap-theme.min.css"/>">


<script>
	function formSubmit() {
		document.getElementById("logout").submit();
	}
</script>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.3/angular.min.js"></script>

<style>
body {
	margin-top: 75px;
}

.img-responsive {
	display: block;
	height: auto;
	max-width: 100%;
}

.navbar-default {
	background-color: #CC0000;
}

.dropdown-submenu {
	position: relative;
}
/* 
body {
	background-color: #ffc299;
} */

.form_bg {
	background-color: pink;
	color: #666;
	padding: 20px;
	border-radius: 10px;
	position: absolute;
	border: 1px solid #fff;
	margin: auto;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	width: 320px;
	height: 280px;
}

.align-center {
	text-align: center;
}

label {
	margin-left: 20px;
}

#datepicker {
	width: 180px;
	margin: 0 20px 20px 20px;
}

#datepicker>span:hover {
	cursor: pointer;
}

.navbar-text>a {
	color: inherit;
	text-decoration: none;
}

.header {
	color: #36A0FF;
	font-size: 27px;
	padding: 10px;
}

.bigicon {
	font-size: 35px;
	color: #36A0FF;
}
</style>

</head>
<body>




	<header class="navbar navbar-inverse navbar-fixed-top bs-docs-nav"
		role="banner">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" type="button" data-toggle="collapse"
					data-target=".bs-navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="${session.getContextPath()}/latzchaat/index" class="navbar-brand">Letzchaat</a>
			</div>
			
			<nav class="collapse navbar-collapse bs-navbar-collapse"
				role="navigation">



				<ul class="nav navbar-nav">
				<c:if test="${pageContext.request.userPrincipal.name!=null}">
					<li class="active"><a
						href="${session.getContextPath()}/latzchaat/UserHome">Home</a></li>
						</c:if>
					<%-- <li><a href="${session.getContextPath()}/latzchaat/Contact">Contact</a></li>
					<li><a href="${session.getContextPath()}/latzchaat/About">About US</a></li> --%>
				</ul>
<c:url value="/perform_logout" var="logout" />
			<form action="${logout}" method="post" id="logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csfr.token}" />

			</form>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${pageContext.request.userPrincipal.name!=null}">
						<li class="scroll" style="color: white"><a href="#">${pageContext.request.userPrincipal.name}</a></li>
						<li class="scroll"><a href="javascript:formSubmit()">Logout</a></li>
						<security:authentication var="user"	property="principal.authorities" />
						<security:authorize var="LoggedIn" access="isAuthenticated()">
							<security:authorize access="hasRole('ROLE_ADMIN')">
               ADMIN
                </security:authorize>
							<security:authorize access="hasRole('ROLE_USER')">
                USER
                </security:authorize>
						</security:authorize>
					</c:if>
				</ul>
			</nav>
		</div>
	</header>

</body>

</html>
