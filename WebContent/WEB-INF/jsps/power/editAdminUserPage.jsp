<!DOCTYPE html>
<html> 
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>编辑管理员</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/power.js"></script>
	</head>
	
	<body >
		<c:set var="type_2" value="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_TYPE_2 %>"/>
		<c:set var="roleIdStr" value=""/>
		<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理 > <a href="/admin/power/list">权限管理</a> > <span class="redspan">编辑管理员</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">编辑管理员</h4>
				<hr class="clearFloat" />
				<form id="updateAdminForm" class="form-horizontal" role="form">
					<input type="hidden" id="userId" name="userId" value="${admin.userId }"/>
					<div class="form-group">
						<label class="col-sm-2 control-label">管理员用户 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${admin.userName }(${admin.userEmail })</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">分配角色 :</label>
						<div class="col-sm-10 checkbox">
							<label>
							   <input type="checkbox" <c:if test="${admin.type == type_2 }">checked="checked"</c:if> value="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_TYPE_2 %>" name="type" onclick="jQuery.power.adminRoleChecked(this);"/>&nbsp;超级管理员
							</label>
						</div>
					</div>
					<c:forEach var="list" items="${admin.roleList }">
						<c:set var="roleIdStr" value="${roleIdStr },${list.id }"/>
					</c:forEach>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<c:forEach var="list" items="${roleList }" varStatus="s">
								<c:set var="checkedId" value=",${list.id }"/>
								<label class="checkbox-inline" title="${list.name }">
									<input type="checkbox" name="roleIdList" <c:if test="${fn:contains(roleIdStr, checkedId) }">checked="checked"</c:if> <c:if test="${admin.type == type_2 }">disabled="disabled"</c:if> value="${list.id }"/>&nbsp;${list.name }
								</label>
								<c:if test="${s.count % 4 == 0 }">
									</div>
									<div class="col-sm-offset-2 col-sm-10">
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-6">
							<button type="button" class="btn btn-default btn-width" onclick="jQuery.power.updateAdminData(this);">保 存</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
</html>