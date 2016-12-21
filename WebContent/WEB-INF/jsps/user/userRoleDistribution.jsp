<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%> <%@
include file="/jsps/common/include.jsp"%>
<head>
<title>用户分配角色</title> <%@ include file="/jsps/common/pageJs.jsp"%> 
<script type="text/javascript"
	src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/role.js"></script>
</head>

<body>
	<c:import url="/jsps/common/title.jsp" />
	<c:set var="type_2" value="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_TYPE_2 %>"/>
	<div class="container">
		<h5 class="dangqwz">
			当前位置：系统管理 > <a href="/admin/user/list">用户列表 </a>  > <span class="redspan">用户角色分配</span>
		</h5>
		<div class="syswhite yigebiao">
			<h4 class="biaoti">用户分配角色</h4>
			<hr class="clearFloat" />
			<form class="form-horizontal" role="form">
				<!-- 用户的id -->
				<input type = "hidden" id = "usernowid" name = "usernowid" value="${userDto.id}"/>
				<div class="form-group">
					<label class="col-sm-2 control-label">用户邮箱 : </label>
					<div class="col-sm-10">
						<p class="form-control-static">${userDto.email}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">用户名 : </label>
					<div class="col-sm-10">
						<p class="form-control-static">${userDto.name}</p>
					</div>
				</div>
				<%-- <div class="form-group">
					<label class="col-sm-2 control-label">第一次登陆时间 :</label>
					<div class="col-sm-10">
						<p class="form-control-static"><fmt:formatDate value='${userDto.createTime}' pattern='yyyy-MM-dd HH:mm:ss' /></p>
					</div>
				</div> --%>
				<div class="form-group">
					<label class="col-sm-2 control-label">最近登陆时间 :</label>
					<div class="col-sm-10">
						<c:if test="${userDto.lastLoginTime ne userDto.createTime}">
							<p class="form-control-static"><fmt:formatDate value='${userDto.lastLoginTime}' pattern='yyyy-MM-dd HH:mm:ss' /></p>
					  	</c:if>	
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">是否超级用户 :</label>
					<div class="col-sm-10">
						<br>
						<c:if test="${userBean.isAllRole==1}">否</c:if>
						<c:if test="${userBean.isAllRole==2}">是</c:if>
					</div>
				</div>
				
			<%-- 	<div class="form-group">
					<label class="col-sm-2 control-label">现有角色 :</label>
					<c:forEach items="${userRoleDtoList}" var="userRoleDtoList"> 
						<p class="col-sm-offset-2 col-sm-10">${userRoleDtoList.roleName}</p>
					</c:forEach>
				</div>  --%>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">所属部门 :</label>
					<div class="col-sm-10">
						<p class="form-control-static">${userDto.departmentName}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">现有角色 :</label>
						<div class="col-sm-10 checkbox">
							<label>
							   <input type="checkbox" <c:if test="${userDto.isAllRole==2}">checked="checked"</c:if> value="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_TYPE_2 %>" name="allRole" id="allRole" onclick="jQuery.role.adminRoleChecked(this);"/>&nbsp;超级用户
							</label>
						</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					<tr>
		    			<c:forEach items="${roleBean}" var="roleBean"> 
		    				<input type="checkbox" name="roleId" <c:if test="${roleBean.checked && userDto.isAllRole!=2 }">checked="checked"</c:if> <c:if test="${userDto.isAllRole==2 }">disabled="disabled"</c:if>value="${roleBean.id}"/> 
		    				${roleBean.name}
		    			</c:forEach>
	    				<input type = "hidden" id = "checked" name = "checked"/>
	    			</tr>
					</div>
					</div>					
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-6">
						<button type="button" class="btn btn-default btn-width" onclick = "jQuery.role.changeChecked();jQuery.role.saveRole();">确
							定</button>
					</div>
				</div>

			</form>
		</div>
	</div>
</body>
<c:import url="/jsps/common/bottom.jsp" />
</html>