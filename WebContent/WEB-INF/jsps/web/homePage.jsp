<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<title>首页</title>
	</head>

	<body>
	<%@ include file="/jsps/common/title.jsp"%>
		<div class="container">
			<h5 class="dangqwz">当前位置：首页 </h5>

			<div class="syswhite">
				<h4 class="biaoti">全员公告</h4>
				<hr class="clearFloat">
				
				<c:forEach items="${moduleList }" var="model" varStatus="s">
					<c:if test="${model.id ne 1 }">
						<c:if test="${s.count%2  eq 0 }">
							<div class="clearFloat"></div>
						</c:if>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 xiajianju">
							<table class="table table-bordered">
								<thead>
		
									<tr>
										<th colspan="3">
											<span class="float-left rowinline">${model.name }</span>
											<span class="float-righttt"><a href="/main/more?modelId=${model.id }&sonModelId=0">更多</a></span>
										</th>
									</tr>
		
								</thead>
								<tbody>
									<tr >
										<td class="col-sm-1 rowinline text-center">序号</td>
										<td>标题</td>
										<td class="col-sm-4 text-center">时间</td>
		
									</tr>
									<c:forEach items="${oneList }" var="mList" >
										<c:forEach items="${mList }" var="notice" varStatus="t">
										<c:if test="${notice.moduleId eq model.id && t.count<6}">
											
											<tr >
												<td class="text-center">
													${t.count }
												</td>
												<td title="${notice.title}" ><a  href="/main/detail?id=${notice.id }">
													${notice.title }
												</a></td>
												<td><fmt:formatDate type="time" value="${notice.startTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				
											</tr>
										</c:if>
										</c:forEach>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:if>
				</c:forEach>
			</div>

			<div class="syswhite">
				<h4 class="biaoti">部门公告</h4>
				<hr class="clearFloat">
				<c:forEach items="${sonModel }" var="son" varStatus="ss">
						<c:if test="${ss.count%2  ne 0 }">
							<div class="clearFloat"></div>
						</c:if>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 xiajianju">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th colspan="3">
											<span class="float-left rowinline">${son.name }</span>
											<span class="float-righttt"><a href="/main/more?modelId=1&sonModelId=${son.id }">更多</a></span>
										</th>
									</tr>
		
								</thead>
								<tbody>
									<tr >
										<td class="col-sm-1 rowinline">序号</td>
										<td>标题</td>
										<td class="col-sm-4 text-center">时间</td>
		
									</tr>
									<c:forEach items="${deptList }" var="mList" >
										<c:forEach items="${mList }" var="notice" varStatus="g">
											<c:if test="${notice.sonModuleId eq son.id && g.count<6}">
												<tr >
													<td class="text-center">${g.count }</td>
													<td><a  href="/main/detail?id=${notice.id }">
														${notice.title }
													</a></td>
													<td><fmt:formatDate type="time" value="${notice.startTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
												</tr>
											</c:if>
										</c:forEach>
									</c:forEach>
								</tbody>
							</table>
						</div>
				</c:forEach>
			</div>
		</div>
	<c:import url="/jsps/common/bottom.jsp" />
	</body>

</html>