<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsps/common/include.jsp"%>
<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
<head>
<title>自定义分组</title>
<%@ include file="/jsps/common/pageJs.jsp"%>
<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/groups.js"></script>
</head>

<body>
	<c:import url="/jsps/common/title.jsp" />
	<div class="container">
		<h5 class="dangqwz">
			当前位置：系统管理 > 用户管理 > <span class="redspan">自定义分组</span>
		</h5>
		<div class="syswhite yigebiao">
			<h4 class="biaoti">自定义分组</h4>
			<button class="btn btn-default  float-rightt"
			onclick="javascript:window.location.href='/admin/group/toadd'"
			>添加分组</button>
			<hr class="clearFloat" />
			<table data-toggle="table">
				<thead>
					<tr>
						<th data-halign="center">序号</th>
						<th data-halign="center">自定义分组名称</th>
						<th data-halign="center">创建者</th>
						<th data-halign="center">创建时间</th>
						<th data-halign="center">操作</th>
					</tr>
				</thead>
				<tbody align="center">
				<c:forEach var="groupDto" items="${groupDto}" varStatus="s">
					<tr>
						<td>${s.count}</td>
						<td>${groupDto.name }</td>
						<td>${groupDto.createName }(${groupDto.createEmail })</td>
						<td><fmt:formatDate value='${groupDto.createTime}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
						<td class="caozuo">
							<a class="btn btn-primary btn-xs btn-color" href="/admin/group/detail?groupId=${groupDto.id}">分组详情</a> 
							<a class="btn btn-primary btn-xs btn-color" onclick="jQuery.groups.deleteGroup(${groupDto.id})">删除分组</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<ghs:pager url="/admin/group/list" current="${pageIndex }" total="${count }" pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_20 %>"/>
		</div>
	</div>
	<c:import url="/jsps/common/bottom.jsp" />
</body>

<script type="text/javascript">
		$(function() {

			$('[data-submenu]').submenupicker();
			jQuery.fn.bootstrapTable.defaults.pageNumber = 3;
		});
 
	</script>
</html>