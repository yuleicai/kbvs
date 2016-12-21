<!DOCTYPE html>
<html> 
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>学习任务详情</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/learn.js"></script>
	</head>

	<body>
		<%@ include file="/jsps/common/title.jsp"%>
		<div class="container">
			<h5 class="dangqwz">
				当前位置：系统管理 > <a href="/admin/learn/taskList">学习管理 </a> > <span class="redspan">学习任务详情</span> 
			</h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">查看学习任务详情</h4>
				<hr class="clearFloat"/>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label">编码 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${learnTask.id }</p>
						</div>
						<label class="col-sm-2 control-label">标题 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${learnTask.title }</p>
						</div>
					</div>
					<%  
					    java.util.Date currentTime = new java.util.Date();//得到当前系统时间  
					    pageContext.setAttribute("currentTime",currentTime);//放到当前页面作用域
				    %> 
					<div class="form-group">
						<label class="col-sm-2 control-label">状态 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">
								<c:if test="${currentTime < learnTask.startTime}">
									未开始
								</c:if>
								<c:if test="${learnTask.startTime < currentTime && currentTime< learnTask.endTime}">
									进行中
								</c:if>
								<c:if test="${currentTime > learnTask.endTime}">
									已结束
								</c:if>
							</p>
						</div>
						<label class="col-sm-2 control-label">完成状况  : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${learnTask.completionRate }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">生效时间 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">
								<fmt:formatDate type="time" value="${learnTask.startTime }" pattern="yyyy-MM-dd HH:mm:ss" />
							</p>
						</div>
						<label class="col-sm-2 control-label">截至时间 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">
								<fmt:formatDate type="time" value="${learnTask.endTime }" pattern="yyyy-MM-dd HH:mm:ss" />
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">发布者 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${learnTask.createUserName }</p>
						</div>
						<label class="col-sm-2 control-label">发布时间 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">
								<fmt:formatDate type="time" value="${learnTask.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">最少学习时间 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${learnTask.minimalTime }(分钟)</p>
						</div>
					</div>
					
					<c:if test="${learnTask.description != ' ' }">
						<div class="form-group">
							<label class="col-sm-2 control-label">描述 : </label>
							<div class="col-sm-8">
								<div class="fuwenben " >
	 								${learnTask.description }
	 							</div>
							</div>
						</div>
					</c:if>
					
					<c:if test="${fn:length(learnTask.attachmentList) != 0 }">
						<div class="form-group">
							<label class="col-sm-2 control-label">附件 : </label>
							<div class = "col-sm-offset-2">
								<c:forEach var="list" items="${learnTask.attachmentList }" varStatus="s">
									<c:if test="${s.count ne 1 }">
										<div class = "form-group col-sm-offset-2"></div>
									</c:if>
									<div class="col-sm-5">
										<p class="form-control-static">${list.name }</p>
									</div>
									<div class="col-sm-2">
										<p class="form-control-static">${list.downloadCount }人已下载</p>
									</div>
									<label class="col-sm-1 control-label"><a href="/admin/file/download?businessId=${learnTask.id }&attachmentId=${list.id }" target="_blank">下载</a></label>
									<label class="col-sm-1 control-label"><a href="/admin/file/browse?businessId=${learnTask.id }&attachmentId=${list.id }" target="_blank">在线浏览</a></label>
								</c:forEach>
							</div>
						</div>
					</c:if>
					
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-6">
							<button type="button" class="btn btn-default btn-width" onclick="jQuery.learn.editLearnTask(${learnTask.id});">未生效前可修改</button>
							<button type="button" class="col-sm-offset-1 btn btn-danger btn-width" onclick="jQuery.learn.delLearnTask(${learnTask.id});">未生效前可删除</button>
						</div>
					</div>
				
				</form>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
</html>