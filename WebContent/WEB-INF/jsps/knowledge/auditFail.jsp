<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsps/common/include.jsp"%>
<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
<head>
<title>知识审核</title>
<%@ include file="/jsps/common/pageJs.jsp"%>
<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/xheditor/xheditor-1.2.2.min.js"></script>
<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/xheditor/xheditor_lang/zh-cn.js"></script>
<script type="text/javascript"
	src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/knowledge.js"></script>
</head>

<body>
	<c:import url="/jsps/common/title.jsp" />
	<div class="container">
		<h5 class="dangqwz">
			当前位置：系统管理 > 知识管理 > <span class="redspan">知识审核</span>
		</h5>
		<div class="syswhite yigebiao">
			<h4 class="biaoti">知识审核</h4>
			<hr class="clearFloat" />
			<form class="form-horizontal" role="form" id = "auditForm">
				<div class="form-group">
					<input type = "hidden" name = "id" id = "id" value = "${knowledgeId }">
					<input type = "hidden" name = "flag" id = "flag" value = 2>
					<label class="col-sm-2 control-label">请输入审核不通过原因: </label>
					<div class="form-group">
						<div class="col-sm-10">
							<textarea id = "failReason" name = "description"  rows="5" cols="120"  maxlength="100" onkeyup="jQuery.knowledge.getKeyup();">
							</textarea>
							<h6>你可以输入<span>50</span>个字，现在剩余<span id="word">50</span>个</h6>
						</div>
					</div>
					<div class="col-sm-offset-3 col-sm-2 ">
						<button type="button"
							class="btn btn-default btn-width float-rightt" onclick = "jQuery.knowledge.auditFail('auditForm','${type}')">提交</button>
					</div>
				</div>
				<br />
				
			</form>
		</div>
	</div>
	<c:import url="/jsps/common/bottom.jsp" />
</body>

</html>