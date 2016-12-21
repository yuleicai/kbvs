<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsps/common/include.jsp"%>
<head>
<%@ include file="/jsps/common/pageJs.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/css/login.css" />
<title>登录</title>
</head>
<script>
$(function(){
$(document).keydown(function(event){
if(event.keyCode==13){
$("#mouse").click();
}
});
})
</script>
<body>
	<div id="login">
		<div class="zuoyou">
			<div class="zuotu">

				<p class="hangone">知识库管理系统</p>
				<p class="hangtwo">Sign up</p>
				<p>Join us to explore it</p>
				<p>together.</p>
			</div>
			<div class="youwen">
				<form role="form" action="/userlogin" method="post">
					<div class="form-group jianju">
						<label class="huise">用户名</label> <input class="onlybottom"
							type="text" name="userName" id="userName" value=""
							placeholder="请填写用户名" />
					</div>

					<div class="form-group jianju">
						<label class="huise">密码</label> <input class="onlybottom"
							type="password" name="password" id="password" value=""
							placeholder="请填写密码" />
					</div>

					<!-- <label class="pwdLabel"><input type="checkbox" > 记住密码</label> -->

					<p>
						<button id="mouse" type="button" class="btn btn-primary btncolora" onclick="jQuery.user.login(this);">
							登录</button>
						<button type="reset" class="btn btn-default btncolorb">
							重置</button>
					</p>

				</form>

			</div>
		</div>
	</div>
</body>
</html>