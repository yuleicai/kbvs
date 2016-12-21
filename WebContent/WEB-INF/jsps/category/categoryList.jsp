
<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsps/common/include.jsp"%>
<c:set var="class_type_1" value="<%=com.ghs.kbvs.constants.KbvsConstant.CLASS_TYPE_1 %>"/>
<c:set var="class_type_3" value="<%=com.ghs.kbvs.constants.KbvsConstant.CLASS_TYPE_3 %>"/>
<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
<head>
<title>知识分类</title>
<%@ include file="/jsps/common/pageJs.jsp"%>
<script type="text/javascript"
	src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/category.js"></script>
</head>

<body>
	<c:import url="/jsps/common/title.jsp" />
	<div class="container">
		<h5 class="dangqwz">
			当前位置：系统管理 > 知识管理 > <a href="/admin/category/list"><span class="redspan">知识分类</span></a>  > <a href = "/admin/category/list?parentId=${grandParentId}"  >查看上级分类</a>
		</h5>
		<div class="syswhite yigebiao">
			<h4 class="biaoti">知识分类列表</h4>
			<hr class="clearFloat" />
			<form class="form-horizontal" role="form" id="categoryForm">
				<div class="form-group">
					<label class="col-sm-1 control-label">分类名称: </label>
					<div class="col-sm-3">
						<input type="hidden" name="parentId" id="parentId"
							value="${parentId }"> <input type="text" name="name" maxlength= "32" 
							id="name" class="form-control" placeholder="分类名称  最多输入32个字" />
					</div>
					<label class="col-sm-1 control-label">分类排序: </label>
					<div class="col-sm-2">
						<input type="text" name="sort" id="sort" class="form-control"
							placeholder="分类排序" />
					</div>
					<label class="col-sm-1 control-label">分类类别: </label>
					<div class="col-sm-2">
						<select class="form-control" name="type" id="type">
							<option value="0">全部</option>
							<option value="1">目录</option>
							<option value="3">功能</option>
						</select>
					</div>
					<div class="col-sm-2">
						<button type="button"
							class="btn btn-default btn-width float-rightt"
							onclick="jQuery.category.save(this,'categoryForm')">保存</button>
					</div>
				</div>
				<br />
				<table data-toggle="table">
					<thead align="center">
						<tr>
							<th data-halign="center">序号</th>
							<th data-halign="center">父分类</th>
							<th data-halign="center">分类名称</th>
							<th data-halign="center">排序</th>
							<th data-halign="center">类型</th>
							<th data-halign="center">添加时间</th>
							<th data-halign="center">操作</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="category" items="${category}" varStatus="s">
							<tr>
								<td>${s.count}</td>
								<td>${category.parentName}</td>
								<td>${category.name}</td>
								<td>${category.sort}</td>
								<td><c:if test="${category.type == class_type_1}"> 目录</c:if> <c:if
										test="${category.type == class_type_3}"> 功能</c:if>
								<td><fmt:formatDate value='${category.createTime}'
										pattern='yyyy-MM-dd HH:mm:ss' /></td>
								<td class="caozuo">
										<c:if test="${category.type==1}">
											<a href="/admin/category/listSub?parentId=${category.id}"
												class="btn btn-primary btn-xs btn-color ">查看下级分类</a>
										</c:if>
									<a href="/admin/category/toEdit?id=${category.id}&name=${category.name}&sort=${category.sort}&type=${category.type}"
									class="btn btn-primary btn-xs btn-color ">修改</a>
									<button type="button" class="btn btn-primary btn-xs btn-color"
										onclick="jQuery.category.deleteCategoy(${category.id})">删除</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<ghs:pager url="/admin/category/list" current="${pageIndex }"
					total="${totalCount }"
					pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_10 %>" />
			</form>
		</div>
	</div>
	<c:import url="/jsps/common/bottom.jsp" />
</body>

</html>