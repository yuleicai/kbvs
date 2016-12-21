<!DOCTYPE html>
<html>
	<%@ page language="java" contentType="text/html; charset=UTF-8"%>
	<%@ include file="/jsps/common/include.jsp"%>
	<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
	<head>
		<title>系统公告列表</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/notice.js"></script>
	</head>
	
	<body>
		<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<h5 class="dangqwz">
				当前位置：首页 > 公告列表 > <span class="redspan">系统公告列表</span>
			</h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti" align="center">系统公告列表</h4>
				<hr class="clearFloat" /><br>
				<table data-toggle="table">
					<thead>
						<tr>
							<th data-halign="center">序号</th>
							<th data-halign="center">公告类型</th>
							<th data-halign="center">标题</th>
							<th data-halign="center">发布时间</th>
							<th data-halign="center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${noticeList}" varStatus="s">
							<tr align="center">
								<td>${list.id}</td>
								<td>${list.name}</td>
								<td>${list.title}</td>
								<td><fmt:formatDate value="${list.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="caozuo">
									<a class="btn btn-primary btn-xs btn-color" onclick="jQuery.notice.showNoticeDetail(${list.id});">详情</a>
									<a class="btn btn-primary btn-xs btn-color" onclick="jQuery.notice.showNoticeEdit(${list.id});">修改</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<ghs:pager url="/admin/power/role/list" current="${pageIndex }" total="${totalCount }" pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_10 %>"/>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
</html>