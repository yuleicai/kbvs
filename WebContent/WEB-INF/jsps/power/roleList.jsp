<!DOCTYPE html>
<html>
	<%@ page language="java" contentType="text/html; charset=UTF-8"%>
	<%@ include file="/jsps/common/include.jsp"%>
	<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
	<head>
		<title>管理员用户列表</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/power.js"></script>
	</head>
	
	<body>
		<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<h5 class="dangqwz">
				当前位置：系统管理 > 权限管理 > <span class="redspan">角色管理</span>
			</h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">管理员角色管理</h4>
				<hr class="clearFloat" />
				<div class="form-group">
					<label class="col-sm-2 control-label">角色名称 : </label>
					<div class="col-sm-4">
						<input type="hidden" id="roleId" value="0"/>
						<input type="text" class="form-control" id="roleName" maxlength="20" placeholder="请输入角色名称(最多20个字符)"/>
					</div>
				</div>
				<div class="col-sm-offset-4 col-sm-1">
					<button id="saveBtn" type="button" onclick="jQuery.power.saveRoleName();" class="btn btn-default btn-width">保存</button>
				</div>
			</div>
	
			<div class="syswhite yigebiao">
				<table data-toggle="table">
					<thead>
						<tr>
							<th data-halign="center">序号</th>
							<th data-halign="center">角色名称</th>
							<th data-halign="center">创建者</th>
							<th data-halign="center">创建时间</th>
							<th data-halign="center">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${roleList }" varStatus="s">
							<tr align="center">
								<td>${s.count }</td>
								<td id="roleName_${list.id }">${list.name }</td>
								<td>${list.createUserName }(${list.createUserEmail })</td>
								<td><fmt:formatDate value="${list.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="caozuo">
									<a class="btn btn-primary btn-xs btn-color" onclick="jQuery.power.delRoleData(${list.id});">删除</a>
									<a class="btn btn-primary btn-xs btn-color" onclick="jQuery.power.updateRoleNameData(${list.id});">修改</a>
									<a class="btn btn-primary btn-xs btn-color" href="/admin/power/role/function?roleId=${list.id }" target="_blank">分配</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<ghs:pager url="/admin/power/role/list" current="${pageIndex }" total="${totalCount }" pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_10 %>"/>
			</div>
			<p class="jianyi">* 建议新员工登录，更改部门的默认权限，避免管理员一个个给员工添加角色</p>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
</html>