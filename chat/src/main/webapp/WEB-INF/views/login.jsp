<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">

				<div class="account-wall">
					<h1 class="text-center login-title ">Sign in to Latzchaat.com</h1>
				
					<form class="form-signin" action="login" method='POST'>
						<input type="text" class="form-control" name="email"
							placeholder="Email" required autofocus> <input
							type="password" class="form-control" name="password"
							placeholder="Password" required>
						<button class="btn btn-lg btn-primary btn-block" type="submit">
							Sign in</button>
						<label class="checkbox pull-left"> <input type="checkbox"
							value="remember-me"> Remember me
						</label> <a href="#" class="pull-right need-help">Need help? </a><span
							class="clearfix"></span>
					</form>
				</div>
				<div class="col-sm-8 col-md-8 col-md-offset-3">
					<span class="glyphicon glyphicon-user"></span> <a
						href="${session.getContextPath()}/latzchaat/Register">Create
						an account </a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>