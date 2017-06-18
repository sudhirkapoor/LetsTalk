<%@include file="Header.jsp"%>
<div class="container" style="margin-top: 30px">

	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<div class="col-md-8 col-md-offset-2">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<strong>Sign in </strong>
				</h3>
				<div
					style="float: right; font-size: 80%; position: relative; top: -10px">
					<a href="#">Forgot password?</a>
				</div>
			</div>

			<div class="panel-body">
				<form:form role="form" modelAttribute="userDetail"
					action="/chat/RegisterUser">


					<span style="color: #ff0000">${emailMsg}</span>
					<div class="row">
						<div class="col-xs-12 col-sm-4 col-md-4">
						<%-- <div class="form-group">
							<form:input type="id" path="id" name="id"
								id="username" class="form-control " placeholder="Email Address"
								tabindex="4" required="Please enter email" />
						</div> --%>
							<div class="form-group">
								<form:input type="text" path="name" name="name" id="name"
									class="form-control" placeholder=" Name" tabindex="1"
									required="Please enter first name" />
							</div>
						</div>



						<div class="form-group">
							<form:input type="email" path="username" name="username"
								id="username" class="form-control " placeholder="Email Address"
								tabindex="4" required="Please enter email" />
						</div>
						<div class="row">
							<div class="col-xs-12 col-sm-6 col-md-6">
								<div class="form-group">
									<form:input type="password" path="password" name="password"
										id="password" class="form-control " placeholder="Password"
										tabindex="5" required="Please enter password" />
								</div>
							</div>

							<div class="row">
								<div></div>




								<button type="submit" class="btn btn-success">Register
									Me</button>

								<hr style="margin-top: 10px; margin-bottom: 10px;">

								<div class="form-group">

									<!-- <div style="font-size: 85%">
							Don't have an account! <a href="#"
								onClick="$('#loginbox').hide(); $('#signupbox').show()">
								Sign Up Here </a>
						</div>
 -->
								</div>
				</form:form>
			</div>
		</div>
	</div>

</div>
<div class="container"></div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<%@include file="Footer.jsp"%>
</div>