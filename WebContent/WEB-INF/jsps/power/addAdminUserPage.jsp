<!DOCTYPE html>
<html> 
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>添加管理员</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/power.js"></script>
	</head>
	
	<body >
		<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理 > 权限管理 > <a href="/admin/power/list">管理员管理</a> > <span class="redspan">添加管理员</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">添加管理员</h4>
				<hr class="clearFloat" />
				<form id="addAdminForm" class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label">选择员工 : </label>
						<div class="col-sm-3">
							<select class="form-control" onchange="jQuery.power.onchangeDepartment(this);">
								<option value="0">--请选择部门--</option>
								<c:forEach var="list" items="${departmentList }">
									<option value="${list.id }">${list.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-3">
							<select class="form-control" name="userId" id="userId">
								<option value="0">--请选择员工--</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">分配角色 :</label>
						<div class="col-sm-10 checkbox">
							<label>
							   <input type="checkbox" value="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_TYPE_2 %>" name="type" onclick="jQuery.power.adminRoleChecked(this);"/>&nbsp;超级管理员
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<c:forEach var="list" items="${roleList }" varStatus="s">
								<label class="checkbox-inline" title="${list.name }">
									<input type="checkbox" name="roleIdList" value="${list.id }"/>&nbsp;${list.name }
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
							<button type="button" class="btn btn-default btn-width" onclick="jQuery.power.addAdminData(this);">保 存</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
</html>