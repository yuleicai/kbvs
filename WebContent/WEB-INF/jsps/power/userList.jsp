<!DOCTYPE html>
<html> 
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
	<head>
		<title>管理员用户列表</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/power.js"></script>
	</head>
	
	<body >
		<c:set var="type_2" value="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_TYPE_2 %>"/>
		<c:set var="type_2_desc" value="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_TYPE_2_DESC %>"/>
		<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理 > 权限管理 > <span class="redspan">管理员管理</span></h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">管理员管理</h4>
				<button class="btn btn-default  float-rightt" onclick="jQuery.location('/admin/power/addAdminPage');">添加管理员</button>
				<hr class="clearFloat" />
				<table data-toggle="table">
					<thead>
						<tr>
							<th data-halign="center" width="10%">序号</th>
							<th data-halign="center" width="20%">管理员名称</th>
							<th data-halign="center" width="50%">拥有角色</th>
							<th data-halign="center" width="10%">添加者</th>
							<th data-halign="center" width="10%">添加时间</th>
							<th data-halign="center" width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${userList }" varStatus="s">
							<tr>
								<td>${s.count }</td>
								<td>${list.userName }(${list.userEmail })</td>
								<td>
									<c:if test="${list.type ==  type_2}"></c:if>
									<c:choose>
										<c:when test="${list.type == type_2 }">${type_2_desc }</c:when>
										<c:otherwise>
											<c:forEach var="item" items="${list.roleList }">
												${item.name }&nbsp;&nbsp;
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${list.createUserName }(${list.createUserEmail })</td>
								<td><fmt:formatDate value="${list.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="caozuo">
									<a class="btn btn-primary btn-xs btn-color" onclick="jQuery.power.delAdminData(${list.userId });">删除</a>
									<a class="btn btn-primary btn-xs btn-color" href="/admin/power/editAdminPage?userId=${list.userId }" target="_blank">编辑</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<ghs:pager url="/admin/power/list" current="${pageIndex }" total="${totalCount }" pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_10 %>"/>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
</html>