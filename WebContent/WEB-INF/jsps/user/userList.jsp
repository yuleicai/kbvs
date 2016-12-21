<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsps/common/include.jsp"%>
<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
<head>
<title>部门用户列表</title>
<%@ include file="/jsps/common/pageJs.jsp"%>
<%-- <script type="text/javascript"
	src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/power.js"></script> --%>
</head>


<body>
	<c:import url="/jsps/common/title.jsp" />
	<div class="container">
		<h5 class="dangqwz">
			当前位置：系统管理 > 用户管理><a href="/admin/department/list">组织架构></a> <span class="redspan">部门用户列表</span>
		</h5>
		<div class="syswhite yigebiao">
			<h4 class="biaoti">用户列表</h4>
			<hr class="clearFloat" />
			<form id="listForm" action="/admin/user/deplist" method="get"
				class="form-horizontal" role="form">
				<input type = "hidden" id="departmentId" name = "departmentId" value = "${departmentId }">
				<div class="form-group">
					<label class="col-sm-1 control-label">用户邮箱: </label>
					<div class="col-sm-3">
						<input type="text" class="form-control" placeholder="用户邮箱"
							name="email" value="${email }" />
					</div>
					<label class="col-sm-2 control-label">用户姓名: </label>
					<div class="col-sm-3">
						<input type="text" class="form-control" placeholder="用户姓名"
							name="name" value="${name }" />
					</div>
					<label class="col-sm-1"></label>
					<div class="col-sm-3">
						<button type="submit"
							class="btn btn-default btn-width float-rightt">立即搜索</button>
					</div>
				</div>
			</form>
			<table data-toggle="table">
				<thead>
					<tr>
						<th data-halign="center">序号</th>
						<th data-halign="center">用户</th>
						<th data-halign="center">用户邮箱</th>
						<th data-halign="center">所属部门</th>
						<th data-halign="center">是否管理员</th>
						<th data-halign="center">是否超级用户</th>
						<th data-halign="center">最近登陆时间</th>
						<th data-halign="center">操作</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach var="users" items="${users}">
						<tr>
							<td>${users.id}</td>
							<td>${users.name}</td>
							<td>${users.email}</td>
							<td>${users.departmentName}</td>										
							<td>
							<c:if test="${users.isManager==1}">否</c:if>
							<c:if test="${users.isManager==2}">是</c:if>
							</td>
							<td>
							<c:if test="${users.isAllRole==1}">否</c:if>
							<c:if test="${users.isAllRole==2}">是</c:if>
							</td>
							<td>
							<c:if test="${users.lastLoginTime ne users.createTime}">
							<fmt:formatDate value='${users.lastLoginTime}' pattern='yyyy-MM-dd HH:mm:ss' />
							</c:if>
							</td>
							<td class="caozuo">
							<a
								class="btn btn-primary btn-xs btn-color"
								href="/admin/role/tolist?userId=${users.id}">编辑用户角色</a>
							
							<!--  <a class="btn btn-primary btn-xs btn-color">删除</a> <a
								class="btn btn-primary btn-xs btn-color ">修改</a> <a
								class="btn btn-primary btn-xs btn-color">分配</a>	 -->	
								</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>							
			<ghs:pager url="/admin/user/deplist?departmentId=${departmentId}&email=${email}&name=${name}" current="${pageIndex }" total="${totalCount }" pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_20 %>"/>
		</div>
	</div>
	<c:import url="/jsps/common/bottom.jsp" />
</body>
</html>