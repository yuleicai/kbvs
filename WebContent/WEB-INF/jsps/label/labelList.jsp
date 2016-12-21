<!DOCTYPE html>
<html>
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
	<head>
		<title>标签管理</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/label.js"></script>
	</head>

	<body>
		<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理 > 知识管理 > <span class="redspan">标签管理</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">知识标签列表</h4>
				<hr class="clearFloat" />
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-1 control-label">标签名称: </label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" maxlength = "32" class="form-control" placeholder="最多输入32个字" />
						</div>

						<div class="col-sm-offset-6 col-sm-2 ">
							<button type="button" class="btn btn-default btn-width float-rightt" onclick="jQuery.label.save()">保 存</button>
						</div>
					</div>
					 <br /> 
					 <table data-toggle="table" >
					<thead  align="center">
						<tr>
							<th data-halign="center">序号</th>
							<th data-halign="center">标签名称</th>
							<th data-halign="center">添加者</th>
							<th data-halign="center">添加时间</th>
							<th data-halign="center">操作</th>
						</tr>
					</thead>
					<tbody  align="center">
			         	<c:forEach var="label" items="${label}" varStatus="s">
			              <tr>
							 <td>${s.count}</td>
							 <td>${label.name}</td>
							 <td>${label.email}</td>
							 <td><fmt:formatDate value='${label.createTime}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
			                 <td>
			                 <button type="button" class="btn btn-primary btn-xs btn-color"
										onclick="jQuery.label.deleteLabel(${label.id})">刪除</button>
			                 </td>
			              </tr>
			          	</c:forEach>
					</tbody>
				</table>
				</form>
				<ghs:pager url="/admin/label/list" current="${pageIndex }"
					total="${totalCount }"
					pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_10 %>" />
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>

</html>