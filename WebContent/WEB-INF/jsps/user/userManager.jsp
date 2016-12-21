<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsps/common/include.jsp"%>
<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
<head>
<title>用户管理</title>
<%@ include file="/jsps/common/pageJs.jsp"%>
<script type="text/javascript"
	src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/role.js"></script>
</head>
<body>
	<c:import url="/jsps/common/title.jsp" />
	<div class="container">
		<h5 class="dangqwz">
			当前位置：用户管理> <span class="redspan">用户列表</span>
		</h5>
		<div class="syswhite yigebiao">
			<h4 class="biaoti">用户列表</h4>
			<hr class="clearFloat" />
			<form id="listForm" action="/admin/user/list" method="get"
				class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-sm-1 control-label">用户邮箱: </label>
					<div class="col-sm-2">
						<input type="text" class="form-control" placeholder="用户邮箱"
							name="email" value="${email }" />
					</div>
					<label class="col-sm-1 control-label">用户姓名: </label>
					<div class="col-sm-2">
						<input type="text" class="form-control" placeholder="用户姓名"
							name="name" value="${name }" />
					</div>
					 
					<label class="col-sm-1 control-label">所属部门: </label>
					<div class="col-sm-2">
						<input type="text" class="form-control" placeholder="所属部门"
							name="department" value="${department}" />
					</div> 
				 
					<div class=" col-sm-1  tuizuott ">
						<button type="submit"
							class="btn btn-default btn-width float-rightt">立即搜索</button>
					</div>
					
					<div class="col-sm-2  tuizuott ">
						<input type="button" data-toggle="modal" data-target="#myModal"
							value="批量分配角色"
							class="btn btn-default btn-width float-rightt margin-bottom" />
					</div>
				</div>
			</form>

			<table data-toggle="table">
				<thead>
					<tr>
						<th><input type="checkbox" id="inlineCheckbox"
							value="option1"></th>
						<th data-halign="center">序号</th>
						<th data-halign="center">姓名</th>
						<th data-halign="center">邮箱</th>
						<th data-halign="center">所属部门</th>
						<th data-halign="center">是否是管理员</th>
						<th data-halign="center">是否超级用户</th>
						<th data-halign="center">最近登陆时间</th>
						<th data-halign="center">操作</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach var="userDto" items="${userDto}">
						<tr>
							<td><input type="checkbox" id="checkedId" name="checkedId"
								value="${userDto.id}"></td>
							<td>${userDto.id}</td>
							<td>${userDto.name}</td>
							<td>${userDto.email}</td>
							<td>${userDto.departmentName}</td>
							<td><c:if test="${userDto.isManager==1}">否</c:if> <c:if
									test="${userDto.isManager==2}">是</c:if></td>
							<td><c:if test="${userDto.isAllRole==1}">否</c:if> <c:if
									test="${userDto.isAllRole==2}">是</c:if></td>
							<td>
							<c:if test="${userDto.lastLoginTime ne userDto.createTime}">
								<fmt:formatDate value='${userDto.lastLoginTime}'
								pattern='yyyy-MM-dd HH:mm:ss' />
							</c:if>	
							</td>	
							<td class="caozuo"><a
								class="btn btn-primary btn-xs btn-color"
								href="/admin/role/tolist?userId=${userDto.id}">编辑用户角色</a>
						</tr>
					</c:forEach>
			</table>
			<ghs:pager url="/admin/user/list?email=${email}&name=${name}&department=${department}"
				current="${pageIndex }" total="${totalCount }"
				pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_50 %>" />
		</div>
	</div>
	<c:import url="/jsps/common/bottom.jsp" />

<!--弹出层 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">选择学习人员</h4>
				</div>
				<div class="modal-body">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#home" data-toggle="tab"> 角色</a>
						</li>
					</ul>

					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active"
							style="overflow-y: scroll; height: 350px; padding: 20px;"
							id="home">
							<div class="col-sm-10 checkbox">
								<label> <input type="checkbox"
									value="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_TYPE_2 %>"
									name="allRole" id="allRole"
									onclick="jQuery.role.adminRoleChecked(this);" />&nbsp;超级用户
								</label>
							</div>
							<div class="col-sm-10">
								<tr>
									<c:forEach items="${roleBean}" var="roleBean">
										<input type="checkbox" id="roleId" name="roleId" value="${roleBean.id}" /> ${roleBean.name}
	    							</c:forEach>
								</tr>
							</div>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<h4 style="color: red;">请先批量选择用户，然后分配角色即可</h4>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal" onclick="jQuery.role.saveUserRole()">保存</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
		$(function() {
			$('[data-submenu]').submenupicker();
			$("#inlineCheckbox").on('click',function(){
				var isChecked = $(this).prop("checked");
   				$("input[id='checkedId']").prop("checked", isChecked);
			})
		});
</script>
</html>