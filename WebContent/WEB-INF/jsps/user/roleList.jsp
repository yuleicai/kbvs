<!DOCTYPE html>
<html>

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsps/common/include.jsp"%>
<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
<head>
<title>角色列表</title>
<%@ include file="/jsps/common/pageJs.jsp"%>
<script type="text/javascript"
	src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/role.js"></script>
</head>

<body>
	<c:import url="/jsps/common/title.jsp" />
	<div class="container">
		<h5 class="dangqwz">
			当前位置：系统管理 > 用户管理 > <span class="redspan">角色列表 </span>
		</h5>
		<div class="syswhite yigebiao">
			<h4 class="biaoti">角色列表</h4>

			<hr class="clearFloat" />
			<form class="form-horizontal" name="form" id="roleForm">
				<!-- 获取当前id -->
				<input type="hidden" name="create_user_id" value="${loginUser.id}" />
				<div class="form-group">
					<label class="col-sm-2 control-label">角色名称 : </label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="name" name="name" maxlength= "32" placeholder="最多输入32个汉字" >
					</div>
					
					<div class="col-sm-offset-4 col-sm-1">
						<button type="button" class="btn btn-default btn-width" onclick="jQuery.role.save('roleForm')">保存
						</button>	
					</div>
				</div>

				 
					
				 
			</form>

		</div>

		<div class="syswhite yigebiao">
			<h4 class="biaoti">角色列表</h4>
			<hr class="clearFloat" />
			<table data-toggle="table" >
				<thead>
					<tr>
						<th data-halign="center">序号</th>
						<th data-halign="center">角色名称</th>
						<th data-halign="center">添加者</th>
						<th data-halign="center">添加时间</th>
						<th data-halign="center">操作</th>
					</tr>
				</thead>
				<tbody align="center">
					<tr>
						<c:forEach var="roleDto" items="${roleDto}" varStatus="s">
							<tr>
								<td>${s.count}</td>
								<td>${roleDto.name}</td>
								<td>${roleDto.creatUser}(${roleDto.creatUserEmail})</td>
								<td><fmt:formatDate value='${roleDto.createTime}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
								<td>
						<%-- <a href="/admin/role/list?userId=${roleDto.id}">编辑用户角色</a> --%>
						<button type="button" class="btn btn-primary btn-xs btn-color"
							onclick="javascript:window.location.href='/admin/function/list?roleId=${roleDto.id}'">編輯角色</button>
						<button type="button" class="btn btn-primary btn-xs btn-color"  
							onclick="jQuery.role.deleteRole(${roleDto.id})">删 除角色</button>
							</tr>
						</c:forEach>
					</tr>

				</tbody>
			</table>
				<ghs:pager url="/admin/role/list" current="${pageIndex }" total="${totalCount }" pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_20 %>"/>

		</div>
		<p class="jianyi">* 建议新员工登录，更改部门的默认权限，避免管理员一个个给员工添加角色</p>
	</div>
	<c:import url="/jsps/common/bottom.jsp" />
</body>
</html>