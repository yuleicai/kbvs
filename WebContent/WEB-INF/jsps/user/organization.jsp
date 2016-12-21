<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsps/common/include.jsp"%>
<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
<head>
<%@ include file="/jsps/common/pageJs.jsp"%>
<title>公司组织架构</title>
<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/organization.js"></script>	 
</head>

<body>
	<c:import url="/jsps/common/title.jsp" />
	<div class="container">
		<h5 class="dangqwz">
			当前位置：系统管理 > 用户管理> <span class="redspan">公司组织架构</span>
		</h5>
		<div class="syswhite yigebiao">
			<h4 class="biaoti">公司组织架构</h4>
			<button type="button" onclick="jQuery.organization.save(this);"
				class="btn btn-default float-rightt">与邮件服务器同步</button>
			<hr class="clearFloat" />
			<table data-toggle="table">
				<thead>
					<tr>
						<th data-halign="center">序号</th>
						<th data-halign="center">公司名称</th>
						<th data-halign="center">部门名称</th>
						<th data-halign="center">同步日期</th>
						<th data-halign="center">操作</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach var="organization" items="${organization}" varStatus="s">
						<tr>
							<td>${s.count}</td>
							<td>${organization.company}</td>
							<td>${organization.name}</td>
							<td><fmt:formatDate value='${organization.createTime}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
							<td><a class="btn btn-primary btn-xs btn-color"
								href="/admin/user/deplist?departmentId=${organization.id}">查看员工信息</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<ghs:pager url="/admin/department/list" current="${pageIndex }" total="${totalCount }" pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_20 %>"/>
		</div>
	</div>
	<c:import url="/jsps/common/bottom.jsp" />
</body>
</html>