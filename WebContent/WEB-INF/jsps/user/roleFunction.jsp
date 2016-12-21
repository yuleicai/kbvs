<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@
include file="/jsps/common/include.jsp"%>
<head>

<title>角色分配权限</title>

<%@ include file="/jsps/common/pageJs.jsp"%>
<script type="text/javascript"
	src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/role.js"></script>
<script type="text/javascript"
	src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/functions.js"></script>
</head>

<body>
	<c:import url="/jsps/common/title.jsp" />
	<div class="container">
		<h5 class="dangqwz">
			当前位置：系统管理 ><a href="/admin/role/list">角色列表</a>  > <span class="redspan">角色分配权限</span>
		</h5>
		<div class="syswhite yigebiao">
			<h4 class="biaoti">角色分配权限</h4>

			<hr class="clearFloat" />
			<form class="form-horizontal" role="form">
				<input type="hidden" id="roleId" name="roleId" value="${roleBean.id}" />
				<div class="form-group">
					<label class="col-sm-2 control-label">角色名称: </label>
					<div class="col-sm-10">
						<p class="form-control-static">${roleBean.name}</p>
					</div>
				</div>
		<%-- 		<div class="form-group">
					<label class="col-sm-2 control-label">现有权限 :</label>
					<c:forEach items="${functionList}" var="functionList"> 
						<p class="col-sm-offset-2 col-sm-10">${functionList.functionName}</p>
					</c:forEach>
				</div>  --%>
				<div class="form-group">
					<label class="col-sm-2 control-label">权限列表 : </label>
					<div class="col-sm-8">
							<div class="col-sm-8">
								<div class="checkbox">
									<c:import url="/jsps/functionTree.jsp" />
									<input type="hidden" id="checked" name="checked" />
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-6">
						<button type="button" class="btn btn-default btn-width"
							onclick="jQuery.functions.changeChecked();jQuery.functions.editFunction();">保
							存</button>
					</div>
				</div>
			</form>

		</div>

	</div>

</body>
<c:import url="/jsps/common/bottom.jsp" />

</html>