<!DOCTYPE html>
<html>
	<%@ page language="java" contentType="text/html; charset=UTF-8"%>
	<%@ include file="/jsps/common/include.jsp"%>
	<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
	<head>
		<title>学习任务列表</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/learn.js"></script>
	</head>
	
	<body>
		<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<h5 class="dangqwz">
				当前位置：系统管理 > <a href="/admin/learn/taskList">学习管理 </a> > <span class="redspan">学习任务列表</span>
			</h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">学习任务列表</h4>
				<hr class="clearFloat" />
				
				<form id="listForm" action="${ctx}/admin/learn/taskList" method="get" class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-1 control-label">学习任务标题: </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" placeholder="学习任务标题" name="title" value="${title }"/>
						</div>
						<label class="col-sm-1 control-label">学习任务状态: </label>
						<div class="col-sm-2">
							<select class="form-control" id="stateId" name="stateId">
								<option value="-1" <c:if test="${stateId==-1 }">selected="selected"</c:if>>全部</option>
								<option value="1" 
									<c:if test="${stateId==1 }">selected="selected"</c:if>>未开始
								</option>
								<option value="2" 
									<c:if test="${stateId==2 }">selected="selected"</c:if>>进行中
								</option>
								<option value="3" 
									<c:if test="${stateId==3 }">selected="selected"</c:if>>已结束
								</option>
							</select>
						</div>
						
						<div class="col-sm-5 ">
							<button type="submit" class="btn btn-default btn-width ">立即搜索</button> 
							<button id="publishBtn" type="button" onclick="javascript:window.location.href='/admin/learn/publishTask'" class="btn btn-default btn-width float-rightt">发布学习任务</button>
						</div>
					
					</div>
				</form>
				
				<br>
				<div class="fixed-table-pagination">
					     
					<table data-toggle="table">
						<thead>
							<tr>
								<th data-halign="center">序号</th>
								<th data-halign="center">学习任务标题</th>
								<th data-halign="center">状态</th>
								<th data-halign="center">发布者</th>
								<th data-halign="center">结束时间</th>
								<th data-halign="center">操作</th>
							</tr>
						</thead>
						<tbody >
							<%  
							    java.util.Date currentTime = new java.util.Date();//得到当前系统时间  
							    pageContext.setAttribute("currentTime",currentTime);//放到当前页面作用域
						    %> 
							<c:forEach var="list" items="${learnTaskList }" varStatus="s">
								<tr align="center">
									<td class ="col-sm-1 text-center ">${s.count }</td>
									<td class="col-sm-2">${list.title }</td>
									<td class="col-sm-1 text-center">
										<c:if test="${currentTime < list.startTime}">
											未开始
										</c:if>
										<c:if test="${list.startTime < currentTime && currentTime< list.endTime}">
											进行中
										</c:if>
										<c:if test="${currentTime > list.endTime}">
											已结束
										</c:if>
									</td>
									<td class="col-sm-3">${list.createUserName }</td>
									<td class="col-sm-3 text-center"><fmt:formatDate type="time" value="${list.endTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td class="caozuo col-sm-2 text-center">
										<a class="btn btn-primary btn-xs btn-color" href="${ctx}/admin/learn/taskDetails?taskId=${list.id}" target="_blank">查看详情</a>
										<a class="btn btn-primary btn-xs btn-color" href="${ctx}/admin/learn/taskState?taskId=${list.id}" target="_blank">查看学习情况</a>
									</td>
								</tr>
								
							</c:forEach>
						</tbody>
					</table>
					
					<ghs:pager url="/admin/learn/taskList?title=${title }&stateId=${stateId}"  
		         		current="${pageIndex }" total="${totalCount }" pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_10 %>"/>
					
				</div>
				<br>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
</html>