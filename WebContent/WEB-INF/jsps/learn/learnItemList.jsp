<!DOCTYPE html>
<html>
	<%@ page language="java" contentType="text/html; charset=UTF-8"%>
	<%@ include file="/jsps/common/include.jsp"%>
	<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
	<head>
		<title>学习情况列表</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/learn.js"></script>
	</head>
	
	<body>
		<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<h5 class="dangqwz">
				当前位置：系统管理 > <a href="/admin/learn/taskList">学习管理 </a> > <span class="redspan">学习情况列表</span>
			</h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">学习情况列表</h4>
				<hr class="clearFloat" />
				
				<form id="listForm" action="${ctx}/admin/learn/taskState" method="get" class="form-horizontal" role="form">
					<div class="form-group">
						<input type="hidden" name="taskId" value="${taskId }">					
						<label class="col-sm-1 control-label">员工: </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" placeholder="员工名称或邮箱" name="name" value="${name }"/>
						</div>
						<label class="col-sm-1 control-label">学习状态: </label>
						<div class="col-sm-2">
							<select class="form-control" id="status" name="status">
								<option value="-1" <c:if test="${status==-1 }">selected="selected"</c:if>>全部</option>
								<option value="1" 
									<c:if test="${status==1 }">selected="selected"</c:if>>未开始
								</option>
								<option value="2" 
									<c:if test="${status==2 }">selected="selected"</c:if>>进行中
								</option>
								<option value="3" 
									<c:if test="${status==3 }">selected="selected"</c:if>>已完成
								</option>
							</select>
						</div>
						
						<div class="col-sm-5 ">
							<button type="submit" class="btn btn-default btn-width ">查询</button> 
						</div>
					
					</div>
				</form>
				
				<br>
				<div class="fixed-table-pagination">
					     
					<table data-toggle="table">
						<thead>
							<tr>
								<th data-halign="center">序号</th>
								<th data-halign="center">学习者</th>
								<th data-halign="center">学习状态</th>
								<th data-halign="center">开始时间</th>
								<th data-halign="center">完成时间</th>
								<th data-halign="center">学习时间(分钟)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${learnItemList }" varStatus="s">
								<tr align="center">
									<td class ="col-sm-1 text-center">${s.count }</td>
									<td class ="col-sm-3">${list.learnUserName }</td>
									<td class ="col-sm-1 text-center">
										<c:if test="${list.status eq 1 }">
											未开始
										</c:if>
										<c:if test="${list.status eq 2 }">
											进行中
										</c:if>
										<c:if test="${list.status eq 3 }">
											已完成
										</c:if>
									</td>
									<td class ="col-sm-3 text-center">
										<c:if test="${list.status eq 1 }">
											--
										</c:if>
										<c:if test="${list.status eq 2 || list.status eq 3 }">
											<fmt:formatDate type="time" value="${list.startTime }" pattern="yyyy-MM-dd HH:mm:ss" />
										</c:if>
									</td>
									<td class ="col-sm-3 text-center">
										<c:if test="${list.status eq 1 || list.status eq 2}">
											--
										</c:if>
										<c:if test="${list.status eq 3 }">
											<fmt:formatDate type="time" value="${list.overTime }" pattern="yyyy-MM-dd HH:mm:ss" />
										</c:if>
									</td>
									<td class ="col-sm-1 text-center">
										<c:if test="${list.status ne 3 }">
											--
										</c:if>
										<c:if test="${list.status eq 3 }">
											${list.timeDiff }
										</c:if>
									</td>
								</tr>
								
							</c:forEach>
						</tbody>
					</table>
					
					<ghs:pager url="/admin/learn/taskState?name=${name }&status=${status }&taskId=${taskId }"  
		         		current="${pageIndex }" total="${totalCount }" pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_10 %>"/>
					
				</div>
				<br>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
</html>