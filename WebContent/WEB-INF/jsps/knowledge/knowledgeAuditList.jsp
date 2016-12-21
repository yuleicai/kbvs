<!DOCTYPE html>
<html>
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
	<head>
		<title>知识审核</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/knowledge.js"></script>
	</head>

	<body>
		<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理 > 知识管理 > <span class="redspan">公司知识审核</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">知识审核</h4>
				<hr class="clearFloat" />
				<form class="form-horizontal" role="form" action="/admin/knowledge/auditList" method="get">
					<div class="form-group">
						<label class="col-sm-1 control-label">标题：</label>
						<div class="col-sm-2">
							<input type="text" id="title" name ="title" value="${title }" class="form-control" placeholder="标题" />
						</div>
						<label class="col-sm-1 control-label">申请者：</label>
						<div class="col-sm-2">
							<input type="text" id = "createUser" name = "createUser" value = "${createUser }" class="form-control" placeholder="申请者" />
						</div>
						<label class="col-sm-1 control-label">审核状态：</label>
						<div class="col-sm-2">
							<select class="form-control" name = "status" id="status">
								<option value = 0 <c:if test="${status == 0 }">selected="selected"</c:if>>全部</option>
								<option value = 1 <c:if test="${status == 1 }">selected="selected"</c:if>>已提交</option>
								<option value = 2 <c:if test="${status == 2 }">selected="selected"</c:if>>审核未通过</option>
								<option value = 3 <c:if test="${status == 3 }">selected="selected"</c:if>>审核通过</option>
							</select>
						</div>
						<div class="col-sm-2 ">
							<button type="submit" class="btn btn-default btn-width float-rightt">立即搜索</button>
						</div>
					</div>
					 <br /> 
					 <table data-toggle="table">
					<thead align="center">
						<tr>
							<th data-halign="center">序号</th>
							<th data-halign="center">知识分类</th>
							<th data-halign="center">知识标题</th>
							<th data-halign="center">类别</th>
							<th data-halign="center">状态</th>
							<th data-halign="center">申请者</th>
							<th data-halign="center">申请时间</th>
							<th data-halign="center">操作</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="knowledge" items="${knowledgeDtoList}" varStatus="s">
							<tr>
								<td>${s.count }</td>
								<td><c:forEach var="categoryList" items="${knowledge.categoryList}">
								       ${categoryList.name }<br>
								 	</c:forEach>
								</td>
								<td>${knowledge.title}</td>
								<td><c:if test="${knowledge.fileType==1}"> 文件</c:if>
								 	<c:if test="${knowledge.fileType==2}"> 记录</c:if>
								 	<c:if test="${knowledge.fileType==3}"> 资料</c:if>
								</td>
								<td><c:if test="${knowledge.status==1}"> 已提交</c:if>
								 	<c:if test="${knowledge.status==2}"> 审核未通过</c:if>
								 	<c:if test="${knowledge.status==3}"> 审核通过</c:if>
								</td> 
								<td>${knowledge.email}</td>
								<td><fmt:formatDate value='${knowledge.createTime}'
										pattern='yyyy-MM-dd HH:mm:ss' /></td>
								<td><a href="/admin/knowledge/audit/details/company?id=${knowledge.id}" class="btn btn-primary btn-xs btn-color">查看详情</a></td>  
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</form>
				<ghs:pager url="/admin/knowledge/auditList?title=${title }&createUser=${createUser }&status=${status }" current="${pageIndex }" total="${totalCount }" pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_10 %>" />
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>

</html>