<!DOCTYPE html>
<html>
	<head>
		<%@ page language="java" contentType="text/html; charset=UTF-8" %>
		<%@ include file="/jsps/common/include.jsp"%>
		<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
		<title>文档中心列表</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/documents.js"></script>
	</head>
	<body>
		<%@ include file="/jsps/common/title.jsp"%>
		<div class="container">
			<h5 class="dangqwz">当前位置：文档中心 > <span class="redspan">文档列表</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">文档列表</h4>
				<hr class="clearFloat" />
				<form id="listForm" action="${ctx}/web/documents/list" method="get" class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-1 control-label">文档名称: </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" placeholder="" name="name" value="${documents.name }"/>
						</div>
						<label class="col-sm-1 control-label">文档编码: </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" placeholder="" name="code" value="${documents.code }"/>
						</div>
						<label class="col-sm-1 control-label">文档类别: </label>
						<div class="col-sm-3 danxuan">
								<label>
									<input name="docTypeId" type="radio" value="0" 
					 					<c:if test="${documents.docTypeId==-1||documents.docTypeId==0 }">checked="checked"</c:if> />全部
					 			</label>
				  			 	<c:forEach items="${map.type}" var="entity">
				  			 		<label> 
										<input name="docTypeId" type="radio" value="${ entity.id}" 
											<c:if test="${documents.docTypeId==entity.id }">checked="checked"</c:if>/>${ entity.name} 
									</label>
								</c:forEach>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-1 control-label">所属公司: </label>
						<div class="col-sm-2">
							<select class="form-control" id="companyId" name="companyId" onchange="jQuery.documents.changeCompany('list')">
<!-- 								<option value="0">-- 请选择  --</option> -->
								<option value="-1" <c:if test="${documents.companyId==-1 }">selected="selected"</c:if>>全部</option>
								<c:forEach items="${map.company}" var="entity"> 
									<option value="${ entity.id}" 
										<c:if test="${documents.companyId==entity.id }">selected="selected"</c:if>>${ entity.name}
									</option>
								</c:forEach>
							</select>
						</div>
						<label class="col-sm-1 control-label">所属部门: </label>
						<div class="col-sm-2">
							<select class="form-control" id = "deptId" name="deptId">
<!-- 								<option value="0">-- 请选择  --</option> -->
								<option value="-1">全部</option>
								<c:if test="${documents.deptId !=0 }">
<%-- 									<option value="-1" <c:if test="${documents.deptId==-1 }">selected="selected"</c:if>>全部</option> --%>
								</c:if>
								<c:forEach items="${map.dept}" var="entity"> 
									<c:if test="${entity.parentItemId==documents.companyId }">
										<option value="${ entity.id}" 
											<c:if test="${documents.deptId==entity.id }">selected="selected"</c:if>>${ entity.name}
										</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<label class="col-sm-1 control-label">文档级别: </label>
						<div class="col-sm-2">
							<select class="form-control" name="docLevelId"  id="docLevelId">
								<option value="-1" <c:if test="${documents.docLevelId==-1 }">selected="selected"</c:if>>全部</option>
								<c:forEach items="${map.level}" var="entity"> 
									<option value="${ entity.id}"
										<c:if test="${documents.docLevelId==entity.id }">selected="selected"</c:if>>${ entity.name}
									</option>
								</c:forEach>
							</select>
						</div>
						<label class="col-sm-1 control-label">文档范围: </label>
						<div class="col-sm-2">
							<select class="form-control"  name="docScopeId">
								<option value="-1" <c:if test="${documents.companyId==-1 }">selected="selected"</c:if>>全部</option>
								<c:forEach items="${map.scope}" var="entity"> 
									<option value="${ entity.id}" 
										<c:if test="${documents.docScopeId==entity.id }">selected="selected"</c:if>>${ entity.name}
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-1 control-label">所属过程: </label>
						<div class="col-sm-2">
							<select class="form-control" name="subProcessPid" id="subProcessPid" onchange="jQuery.documents.changeSubProcess('list')">
<!-- 								<option value="0">-- 请选择  --</option> -->
								<option value="-1" <c:if test="${documents.subProcessPid==-1 }">selected="selected"</c:if>>全部</option>
								<c:forEach items="${map.subProcessPid}" var="entity"> 
									<option value="${ entity.id}" 
										<c:if test="${documents.subProcessPid==entity.id }">selected="selected"</c:if>>${ entity.name}
									</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-2">
							<select class="form-control" name="subProcessCid" id="subProcessCid" >
<!-- 								<option value="0">-- 请选择  --</option> -->
								<option value="-1">全部</option>
								<c:if test="${documents.subProcessCid !=0 }">
<%-- 									<option value="-1" <c:if test="${documents.subProcessCid==-1 }">selected="selected"</c:if>>全部</option> --%>
								</c:if>
									<c:forEach items="${map.subProcessCid}" var="entity"> 
										<c:if test="${entity.parentItemId==documents.subProcessPid }">
											<option value="${ entity.id}" 
												<c:if test="${documents.subProcessCid==entity.id }">selected="selected"</c:if>>${ entity.name}
											</option>
										</c:if>
									</c:forEach>
							</select>
						</div>
						<div class="col-sm-6 ">
							<button type="submit" class="btn btn-default btn-width float-rightt">立即搜索</button>
						</div>
					</div>
					<table data-toggle="table">
			         	 <thead>
				           <tr>
							   	<th class="col-sm-1 rowinline text-center">序号</th>
								<th class="rowinline text-center">文档名称</th>
								<th class="col-sm-1 rowinline text-center" >文档类别</th>
								<th class="col-sm-1 rowinline text-center" >阅读量</th>
								<th class="col-sm-2 rowinline text-center" >发布者</th>
								<th class="col-sm-2 rowinline text-center" >发布时间</th>
								<th class="col-sm-1 rowinline text-center" >操作</th>
				           </tr>
				        </thead>
			         	<tbody class=" rowinline text-center">
				            <c:forEach var="entity" items="${list}" varStatus="s">
							     <tr>                         
									<td   title="${s.count}">${s.count }</td>
									<td   title="${entity.name}">${entity.name}</td>
									<td   title="${entity.docType.name}">${entity.docType.name}</td>
									<td   title="${entity.viewCount}">${entity.viewCount}</td>
									<td   title="${entity.createUser.name}(${entity.createUser.email})">${entity.createUser.name}(${entity.createUser.email})</td>
								    <td  title="<fmt:formatDate type="time" value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />"><fmt:formatDate type="time" value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								    <td class="caozuo"><a class="btn btn-primary btn-xs btn-color" href="/web/documents/details?id=${entity.id}" target="_blank">查看详情</a></td> 
							    </tr>                        
				           	</c:forEach>
			            </tbody>
		         	</table>
		         	<ghs:pager url="/web/documents/list?name=${documents.name}&code=${documents.code}&docTypeId=${documents.docTypeId}&companyId=${documents.companyId}&deptId=${documents.deptId}&docLevelId=${documents.docLevelId}&docScopeId=${documents.docScopeId}&subProcessPid=${documents.subProcessPid}&subProcessCid=${documents.subProcessCid}"  
		         		current="${pageIndex }" total="${totalCount }" pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_10 %>"/>
		         </form>
		         
				<br>
         		
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
</html>