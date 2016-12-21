<!DOCTYPE html>
<html>
	<%@ page language="java" contentType="text/html; charset=UTF-8"%>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>角色权限页面</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/power.js"></script>
	</head>
	
	<body>
		<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理 > 权限管理 > <a href="/admin/power/role/list">角色管理</a> > <span class="redspan">角色分配权限</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">角色分配权限</h4>
				<hr class="clearFloat" />
				<form id="roleFunctionFrom" class="form-horizontal" role="form" action="/admin/power/role/saveFunction">
					<input type="hidden" name="id" value="${adminRole.id }"/>
					<div class="form-group">
						<label class="col-sm-2 control-label">角色名称: </label>
						<div class="col-sm-4">
							<p class="form-control-static">${adminRole.name }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">权限列表 : </label>
						<div class="col-sm-8">
							<div class="checkbox">
 								 <c:forEach var="list" items="${functionList }">
 								 	<div id="function_div_${list.id }" class="checkbox">
	 									<a class="suofang" onclick="jQuery.power.adminRoleFunctionDiv(this, ${list.id}, 0);">-</a>
										<label title="${list.description }"><input type="checkbox" id="function_id_${list.id }" name="functionIdList" <c:if test="${list.checked }">checked="checked"</c:if> value="${list.id }" onclick="jQuery.power.adminRoleFunctionCheckbox(this, ${list.id}, 0, 0);"/>${list.title }</label>
		 								<c:forEach var="list2" items="${list.list }">
			 								<div id="function_div_${list.id }_${list2.id }" class="checkbox suojin"->
			 									<a class="suofang" onclick="jQuery.power.adminRoleFunctionDiv(this, ${list.id}, ${list2.id });">-</a>
												<label title="${list2.description }"><input type="checkbox" id="function_id_${list.id }_${list2.id }" name="functionIdList" <c:if test="${list2.checked }">checked="checked"</c:if> value="${list2.id }" onclick="jQuery.power.adminRoleFunctionCheckbox(this, ${list.id}, ${list2.id }, 0);"/>${list2.title }</label>
												<c:forEach var="list3" items="${list2.list }">
													<div id="function_div2_${list.id }_${list2.id }_${list3.id }" class="checkbox suojin">
														<label title="${list3.description }"><input type="checkbox" id="function_id_${list.id }_${list2.id }_${list3.id }" name="functionIdList" <c:if test="${list3.checked }">checked="checked"</c:if> value="${list3.id }" onclick="jQuery.power.adminRoleFunctionCheckbox(this, ${list.id}, ${list2.id }, ${list3.id });"/>${list3.title }</label>
													</div>
												</c:forEach>
											</div>
		 								</c:forEach>
									</div>
 								 </c:forEach>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-6">
							<button type="button" class="btn btn-default btn-width" onclick="jQuery.power.saveAdminRoleFunctionData(this);">保 存</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
</html>