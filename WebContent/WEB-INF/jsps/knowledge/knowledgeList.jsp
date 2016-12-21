<!DOCTYPE html>
<html>
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
	<head>
		<title>知识管理</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/knowledge.js"></script>
	</head>

	<body>
		<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理 > 知识管理 > <span class="redspan">知识列表</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">知识列表</h4>
				<hr class="clearFloat" />
				<form class="form-horizontal" role="form" action="/admin/knowledge/list" method = "get">
					<div class="form-group">
						<label class="col-sm-1 control-label">标题: </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" placeholder="标题" name="title" value="${title }"/>
						</div>
						<label class="col-sm-offset-3 col-sm-1 control-label">编码: </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" placeholder="编码" name="code"  value="${code }"/>
						</div>
						<!--<label class="col-sm-1 control-label">文件类别: </label>
-->
					</div>
					<div class="form-group">
						<label class="col-sm-1 control-label">知识分类: </label>
						<div id="categoryId">
							<input type="hidden" id="hidId" value="${fn:length(categoryList)-1}"/>
							<c:forEach items="${categoryList}" var="category" varStatus="status">
								<div class="col-sm-2" id="div_${status.index}">
								<select class="form-control" id="${status.index}" name="categoryName" onchange="jQuery.knowledge.changeCategory(${status.index})">   
					    			<option value="-1" <c:if test="${categoryIds[status.index]==0 }">selected="selected"</c:if>>全部</option>
										<c:forEach items="${category}" var="categoryBean"> 
											<option value="${categoryBean.id}" 
												<c:if test="${categoryIds[status.index]==categoryBean.id }">selected="selected"</c:if>>${categoryBean.name}</option>
										</c:forEach>
								</select>&nbsp;&nbsp;&nbsp;&nbsp;
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-1 control-label">文件类型: </label>
						<div class="col-sm-4">
							<label class="danxuan">
							  <input type="radio" id="fileType0" name="fileType" checked value=0 />全部
							  <input type="radio" id="fileType1"name="fileType" value=1 <c:if test="${fileType==1}">checked</c:if>/> 文件
							  <input type="radio" id="fileType2" name="fileType" value=2 <c:if test="${fileType==2}">checked</c:if>/>记录
							  <input type="radio" id="fileType3" name="fileType" value=3 <c:if test="${fileType==3}">checked</c:if>/>资料
							</label>

						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-1 control-label">知识标签: </label>
						<div class="col-sm-8">
							    <c:forEach items="${labelList}" var="label">
							    	 <c:set var="flag" value="false"></c:set>
									 <c:forEach items="${labelId}" var="obj">
										 <c:if test="${obj==label.id}">
										 	<c:set var="flag" value="true"></c:set>   
										  </c:if>
									  </c:forEach>
				    				<input type="checkbox" name="labelId" value="${label.id}"  <c:if test="${flag==true}">checked</c:if>/>${label.name} &nbsp;&nbsp;
				    			</c:forEach>
				    			<input type = "hidden" id = "checked" name = "checked"/>
						</div>
						 
						<div class="col-sm-2 ">
							<button type="submit" class="btn btn-default btn-width float-rightt" onclick = "jQuery.knowledge.getCheckLabel()" >立即搜索</button>
						</div>
					</div>
					
					 <table data-toggle="table">
					<thead  align="center">
						<tr>
							<th data-halign="center">序号</th>
							<th data-halign="center">文件名称</th>
							<th data-halign="center">知识分类</th>
							<th data-halign="center">文件类别</th>
							<th data-halign="center">浏览量</th>
							<th data-halign="center">发布时间</th>
							<th data-halign="center">操作</th>
						</tr>
					</thead>
					<tbody  align="center">
						<c:forEach var="knowledge" items="${knowledgeList}" varStatus="s">
				              <tr>
								 <td>${s.count}</td>
								 <td>${knowledge.title}</td>
								 <td>
								 	<c:forEach var="categoryList" items="${knowledge.categoryList}">
								       ${categoryList.name }<br>
								 	</c:forEach>
								 </td>
								 <td>
								 	<c:if test="${knowledge.fileType==1}"> 文件</c:if>
								 	<c:if test="${knowledge.fileType==2}"> 记录</c:if>
								 	<c:if test="${knowledge.fileType==3}"> 资料</c:if>
								 </td>
								 <td>${knowledge.viewCount}</td>
								 <td><fmt:formatDate value='${knowledge.createTime}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
				                 <td class="caozuo">
				                	<a href="/admin/knowledge/details?id=${knowledge.id}" class="btn btn-primary btn-xs btn-color">查看详情</a>
									<button type="button" class="btn btn-primary btn-xs btn-color" onclick="jQuery.knowledge.deleteDetails(${knowledge.id},${knowledge.status })">删除</button>
				                 </td>
				              </tr>
				          </c:forEach>
					</tbody>
				</table>
				</form>
				<c:set var="categoryIdStr" value="" />
				<c:forEach var="list" items="${categoryIds }">
					<c:set var="categoryIdStr" value="${categoryIdStr }&categoryName=${list }" />
				</c:forEach>
				<ghs:pager url="/admin/knowledge/list?title=${title }&code=${code }&fileType=${fileType }&checked=${labelIds }${categoryIdStr }" current="${pageIndex }" total="${totalCount }" pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_10 %>" />
			   <br>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>

</html>