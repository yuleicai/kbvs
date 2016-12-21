<!DOCTYPE html>
<html>
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>知识详情</title>

		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/knowledge.js"></script>
	</head>

	<body>
		<<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理 > 知识管理 > <c:if test="${typeFlag ne 'company' }"><a href="/admin/knowledge/auditDepartmentList">审核</a></c:if><c:if test="${typeFlag eq 'company' }"> <a href="/admin/knowledge/auditList"> 审核 </a></c:if>> <span class="redspan">知识详情</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">知识详情</h4>
				<hr class="clearFloat"/>
				<form class="form-horizontal" role="form" id = "form1">
					<div class="form-group">
						<label class="col-sm-2 control-label">知识分类 : </label>
						<div class="col-sm-4">
						    <input type = "hidden" id= "id" name = "id" value = "${knowledgeBean.id}">
						    <input type = "hidden" id= "status" name = "status" value = "${knowledgeBean.status}">
						    <input type = "hidden" id= "type" name = "type" value = "${knowledgeBean.type}">
						    <c:forEach items = "${categoryIdsList}" var = "categoryIdsList">
								<input type = "hidden" name="categoryIds" value="${categoryIdsList}">
							</c:forEach>
							<c:forEach items = "${knowledgeBean.categoryList}" var = "categoryBean">
								<input type = "hidden" id="categoryName" value="${categoryBean.id }">
								<p>
									${categoryBean.name } <br/>
								</p>
							</c:forEach>
							
						</div>
						<label class="col-sm-2 control-label">文件编码 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${knowledgeBean.code}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">知识标题 : </label>
						<div class="col-sm-4">
						 	<input type="hidden" name = "title" value="${knowledgeBean.title}"> 
							<p class="form-control-static">${knowledgeBean.title}</p>
						</div>
						<label class="col-sm-2 control-label">知识标签 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">
								<c:forEach items = "${knowledgeBean.labelList}" var = "labelBean">
									<input type = "hidden" name = "labels" value="${labelBean.id }">
									${labelBean.name } &nbsp;&nbsp;
								</c:forEach>
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">知识类别 : </label>
						<div class="col-sm-4">
							<input type = "hidden" name = "fileType" value = "${knowledgeBean.fileType}">
							<p class="form-control-static">
								<c:if test="${knowledgeBean.fileType==1}"> 文件</c:if>
								<c:if test="${knowledgeBean.fileType==2}"> 记录</c:if>
								<c:if test="${knowledgeBean.fileType==3}"> 资料</c:if>
							</p>
						</div>
						<label class="col-sm-2 control-label">访问数量 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${knowledgeBean.viewCount}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">发布者 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${knowledgeBean.email} </p>
						</div>
						<label class="col-sm-2 control-label">发布时间 : </label>
						<div class="col-sm-4">
							<p class="form-control-static"><fmt:formatDate value='${knowledgeBean.createTime}' pattern='yyyy-MM-dd HH:mm:ss' /></p>
						</div>
					</div>
					 
					<div class="form-group">
						<label class="col-sm-2 control-label">描述 : </label>
						<div class="col-sm-8">
							<textarea name = "description" readonly="readonly" style="display: none;"  class="form-control" rows="10">${knowledgeBean.description}
							</textarea>
							<div class="fuwenben " >
 								${knowledgeBean.description}
 							</div>
						</div>
						
<!-- 						<div class="col-sm-8"> -->
<%-- 							<input type = "hidden" name = "description" value = "${knowledgeBean.description}"> --%>
<%-- 							<textarea readonly="readonly"  class="form-control" rows="10">${knowledgeBean.description} --%>
<!-- 							</textarea> -->
<!-- 						</div> -->
						 
					</div>

					<div class="form-group">
						 <label class="col-sm-2 control-label">知识附件 : </label>
						<div class = " col-sm-offset-2">
						<c:forEach var="list" items="${knowledgeBean.attachmentList }" varStatus="s">
							<c:if test="${s.count ne 1 }">
							<div class = "form-group col-sm-offset-2">
							</div>
							</c:if>
							<div class="col-sm-5">
								<p class="form-control-static">${list.name }</p>
							</div>
							<div class="col-sm-2">
								<p class="form-control-static">${list.downloadCount }</p>
							</div>
							<label class="col-sm-1 control-label"><a
								href="/admin/file/download?businessId=${knowledgeBean.id}&attachmentId=${list.id }">下载
							</a></label>
							<label class="col-sm-1 control-label"><a
								href="/admin/file/browse?businessId=${knowledgeBean.id}&attachmentId=${list.id }"
								target="_blank">在线浏览</a></label>
						</c:forEach>
						</div>
					</div>
					
					<hr />
					<h2> 审核记录</h2>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-8">
					<table data-toggle="table">
						<thead align="center">
							<tr>
								<th data-halign="center">状态</th>
								<th data-halign="center">操作人</th>
								<th data-halign="center">操作时间</th>
								<th data-halign="center">描述</th>
							</tr>
						</thead>
						<tbody align="center">
						   <c:forEach items = "${auditBean }" var ="auditBean">
						   	  <tr>
						   	  	<td>
							   	  	<c:if test="${auditBean.status==1}"> 已提交</c:if>
								 	<c:if test="${auditBean.status==2}"> 审核未通过</c:if>
								 	<c:if test="${auditBean.status==3}"> 审核通过</c:if>
						   	  	</td>
								<td>${auditBean.email}</td>
								<td><fmt:formatDate value='${auditBean.auditTime}' pattern='yyyy-MM-dd HH:mm:ss' /></td>
								<td>${auditBean.description}</td>
						   	  </tr>
						   </c:forEach>
						</tbody>
				</table>
				</div>
				</div>
					
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8">
						<button type="button" class="col-sm-offset-1 btn btn-default btn-width" onclick="jQuery.knowledge.audit(this,1,'${typeFlag}')">审核通过</button>
						<button type="button" class="col-sm-offset-1 btn btn-default btn-width" onclick="jQuery.knowledge.toAuditFail('${typeFlag}')">审核不通过</button>
					</div>
				</div>

				</form>
			</div>
		</div>
	</body>
<c:import url="/jsps/common/bottom.jsp" />
</html>