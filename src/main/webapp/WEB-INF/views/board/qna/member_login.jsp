<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/login.css">
</head>

<body>
<div class="container">

	<div class = "login-card">
		<div class="login-card_header">
			<div class="login-card_logo">
				<img src="./image/logo.jpg"/>
			
			</div>	
	
			<div class="login-card_title">
				Sign in into your account
			</div>
		</div>	
		
		<div class="login-card_content">
			<div class="login-card_social">
				<a class="login-card_button" href="http://www.facebook.com">
					<img src="./image/Facebook_icon.jpg" class="login-card_facebook_logo">
				</a>
				
				<a class="login-card_button" href="http://www.twitter.com">
					<img src="./image/Twitter_icon.jpg" class="login-card_twitter_logo">
				</a>
				
				<a class="login-card_button" href="http://www.google.com">
					<img src="./image/Google_icon.jpg" class="login-card_google_logo">
				</a>
				
				
			</div>
			
			<div class="login-card_divider">	
				<div class="login-card_divider-text">or</div>		
			</div>

				<form class="dashboard-form" id="new_user" action="/app/sign-in"accept-charset="UTF-8" method="post">
					<div class="form-row">
						<label class="dashboard-form_group">
							<div class="dashboard-form_label">ID</div>
							
							<input autofocus="autofocus" class="dashboard-form_input"
							type="userId" value="" name="userId" id="userId">
						</label>
					</div>
					
					<div class="form-row">
						<label class="dashboard-form_group">
							<div class="dashboard-form_label">Password</div>
							
							<div class="login-card_password">
								<input autocomplete="off" class="dashboard-form_input"
									type="password" name="userPassword" id="userPassword">
									
								<div class="login-card_tooltip">
									<div class="login-card_tooltip-content">
										<div class="login-card_tooltip-triangle"></div>
										If you forgot your password you can look it up in your email inbox!
										
									</div>
								</div>
							</div>
						</label>
					</div>
					<div class="form-row">
						<input type="submit" name="commit" value="Sign in" class="button full-width"
							data-disable-with="Sign in">
					</div>
				</form>

			</div>
		
		<div class="login-card_footer">
			Not registered? 
			<a href="#">Sign up</a>
		</div>
		
	</div>
	
	<div class="container_fotter">
			<a href="#" id="forget">Forgot your password?</a>
		</div>
</div>
</body>
</html>