<!DOCTYPE html>
<html>

	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>出错了</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
	</head>
	<body>
		<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<div class="syswhite">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 form-group ">
					<p class=" form-control-static cuowu2">
						 ERROR
					</p>
					<div class="form-control-static cuowuN">ERROR!<p class="cuowuNN">程序员BOSS喊你回来加班 ！</p></div>
				</div>
					 <img src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/images/zsk-404-kl.png"  class="img-responsive"/>
					 <div class="form-group">
						<div class="col-sm-offset-6  col-sm-4 col-xs-12 rowInline">
							<a href="/" class="btn btn-default btn-width">返回首页</a>
							<button type="button" class="col-sm-offset-1 btn btn-default btn-width" onclick="javascript:history.go(-1)">上一页</button>
						</div>
					</div>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
	<script type="text/javascript">
		$(function() {
			$('[data-submenu]').submenupicker();
		});
	</script>
</html>