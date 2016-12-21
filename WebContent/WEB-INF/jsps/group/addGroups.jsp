<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsps/common/include.jsp"%>
<head>
<%@ include file="/jsps/common/pageJs.jsp"%>
<title>添加自定义分组</title>
<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/groups.js"></script>
</head>

<body>
	<c:import url="/jsps/common/title.jsp" />
	<div class="container">
		<h5 class="dangqwz">
			当前位置：系统管理 > 权限管理 > <span class="redspan">添加自定义分组</span>
		</h5>
		<div class="syswhite yigebiao">
			<h4 class="biaoti">添加自定义分组</h4>

			<hr class="clearFloat" />
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-sm-2 control-label">自定义分组名称 : </label>
					<div class="col-sm-4">
						<input id = "groupName" name="groupName" type="text" maxlength= "32" placeholder="最多输入32个汉字" class="form-control">
						<div id="tip1"></div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">自定义分组描述 : </label>
					<div class="col-sm-4">
						<input id="groupDes" name="groupDes" type="text" maxlength= "255" placeholder="最多输入255个汉字" class="form-control">
					</div>
				</div>
				<div class="form-group">
						<label class="col-sm-2 control-label">分组人员 : </label>
						<div class="col-sm-2">
							<input type = "hidden" id = "checked" name = "checked" value=""/>
							<button type="button" class="btn btn-default btn-width" data-toggle="modal" data-target="#myModal">选择员工</button>
						</div>
				</div>
				<div class="form-group" id = "finalCheckUser">
					
				</div>
				
				<%-- <div class="form-group">
					<label class="col-sm-2 control-label">所属部门: </label>
					<div class="col-sm-2">
						<input type = "hidden" id="selectCount" value = 1 >
						<select class="form-control" id="depId_1" name="depId" onchange="jQuery.groups.changeDepart(1)">
							<option value="0">—请选择——</option>
							<c:forEach items="${deptList}" var="entity"> 
								<option value="${entity.id}">${entity.name}</option>
							</c:forEach>
						</select>
					</div>
					<input type="button"
							class="btn btn-default btn-width"
							onclick="jQuery.groups.addDept('${deptList}')"
							value="添加部门">
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">自定义分组成员 :</label>
					<input type = "hidden" id = "checked" name = "checked" value=""/>
				</div> 
				<div class="form-group" >
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10 " id="userId_1">
							</div>
						</div>
				</div>--%>
				<div class="form-group" id = "addDepartment"></div>			
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-6">
						<button type="button" class="btn btn-default btn-width" onclick = "jQuery.groups.changeChecked();jQuery.groups.saveGroup();">保
							存</button>
					</div>
				</div>
			</form>
		</div>
	</div>

<!-- 弹出层 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">选择学习人员</h4>
					</div>
					<div class="modal-body">
						<ul id="myTab" class="nav nav-tabs">
							<li class="dropdown">
								<a href="#" id="dep" class="dropdown-toggle" data-toggle="dropdown">部门 <b class="caret"></b></a>
								<ul class="dropdown-menu " role="menu" style="overflow-y:scroll; height: 200px;" aria-labelledby="dep">
									<c:forEach items="${deptList}" var="entity"> 
										<li>
											 <a href=""  onclick = "jQuery.groups.changeDepart(${entity.id})"  tabindex="-1" data-toggle="tab">
											${entity.name}</a> 
										</li>
									</c:forEach>
								</ul>
							</li>
						</ul>
						
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" style="overflow-y: scroll; height: 350px; padding: 20px;">																												
								<div id ="depUsers">
								
								</div>
								<div id="checkedDeptUser">
								
								</div>	
							</div>
							
							<%-- <c:forEach var="list" items="${staffStrs }">
								<c:set value="${ fn:split(list.staffIdStr, '_') }" var="staffId" />
								<c:if test="${ fn:length(staffId) == 2 && staffId[0] != 1}">
									<div class="tab-pane fade" style="overflow-y: scroll; height: 350px; padding: 20px;" id="department" >
										<p>
											<div class="checkbox">
												<label>
													<input type="checkbox" id="selectAll_${list.staffIdStr }" value="${list.staffIdStr }" onclick="jQuery.learn.selectAll('selectAll_${list.staffIdStr }')" />全选/全不选
													<input type="hidden" value="${list.staffName }">
												</label><br><br>
												
											</div>
										</p>
									</div>
								</c:if>
							</c:forEach> --%>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="jQuery.groups.saveUser()">保存</button>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
<c:import url="/jsps/common/bottom.jsp" />

</html>