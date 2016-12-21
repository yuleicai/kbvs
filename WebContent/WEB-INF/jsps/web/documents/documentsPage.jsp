<!DOCTYPE html>
<html> 
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>文档详情</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/documents.js"></script>
	</head>

	<body>
		<%@ include file="/jsps/common/title.jsp"%>
		<div class="container">
			<h5 class="dangqwz">当前位置：文档中心> <span class="redspan">文档详情</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">文档详情</h4>
				<hr class="clearFloat"/>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label">文档名称 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.name }</p>
						</div>
						<label class="col-sm-2 control-label">文档编码 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.code }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">所属公司 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.company.name }</p>
						</div>
						<label class="col-sm-2 control-label">所属部门 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.dept.name  }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">文档级别 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.docLevel.name  }</p>
						</div>
						<label class="col-sm-2 control-label">文档范围 :</label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.docScope.name  }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">文档类别 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.docType.name }</p>
						</div>
						<label class="col-sm-2 control-label">所属过程 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.subProcessP.name  }&nbsp; 》 &nbsp;${documents.subProcessC.name  }</p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">版本号 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.version }</p>
						</div>
						<label class="col-sm-2 control-label">阅读量 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.viewCount }</p>
						</div>
					</div>
					<div class="form-group">
						 <label class="col-sm-2 control-label">文档附件 : </label>
						<div class = " col-sm-offset-2">
						<c:forEach var="list" items="${documents.attachmentList }" varStatus="s">
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
							<label class="col-sm-1 control-label"><a href="/file/download?businessId=${documents.id }&attachmentId=${list.id }" target="_blank">下载</a></label>
							<label class="col-sm-2 control-label"><a href="/file/browse?businessId=${documents.id }&attachmentId=${list.id }" target="_blank">在线浏览</a></label>
						</c:forEach>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">发布者 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.createUser.name  }(${documents.createUser.email})</p>
						</div>
						<label class="col-sm-2 control-label">发布时间 : </label>
						<div class="col-sm-4">
						  	<p class="form-control-static">
						  	<fmt:formatDate type="time" value="${documents.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></p>
						</div>
					</div>
				
				</form>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
</html>