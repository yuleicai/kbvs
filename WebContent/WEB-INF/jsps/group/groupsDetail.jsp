<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsps/common/include.jsp"%>
<head>
<%@ include file="/jsps/common/pageJs.jsp"%>
<title>自定义分组详情</title>
<script type="text/javascript"
	src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/groups.js"></script>
</head>

<body>
	<c:import url="/jsps/common/title.jsp" />
	<div class="container">
		<h5 class="dangqwz">
			当前位置：系统管理 > <a href="/admin/group/list">自定义分组列表</a> > <span
				class="redspan">自定义分组详情</span>
		</h5>
		<div class="syswhite yigebiao">
			<h4 class="biaoti">自定义分组详情</h4>

			<hr class="clearFloat" />

			<form class="form-horizontal" role="form">
				<input type="hidden" id="groupId" name="group"
					value="${groupBean.id}" />
				<div class="form-group">
					<label class="col-sm-2 control-label">自定义分组名称 : </label>
					<div class="col-sm-10">
						<p class="form-control-static">${groupBean.name}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">自定义分组描述 :</label>
					<div class="col-sm-10">
						<p class="form-control-static">${groupBean.description }</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">分组人员 : </label>
					<div class="col-sm-2">
						<input type="hidden" id="checked" name="checked" value="" />
						<button type="button" class="btn btn-default btn-width"
							data-toggle="modal" data-target="#myModal">选择员工</button>
					</div>
				</div>
				<div class="form-group" id="finalCheckUser">
				
				<c:if test="${groupDtoList ne null }">
					<input type="hidden" id="groupUsers" name="groupUsers">
					<label class="col-sm-2 control-label"></label>
							<c:forEach var="list" items="${groupDtoList }">
								<label>
							    	<input type="checkbox" id = "finalUser_${list.id }" name = "finalUser" checked="checked" value="${list.userId }" />
							    	${list.userName }
							  	</label>
							
							</c:forEach>
				</c:if>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">创建者 : </label>
					<div class="col-sm-10">
						<p class="form-control-static">${groupBean.createName }(${groupBean.createEmail})</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">创建时间 :</label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<fmt:formatDate value='${groupBean.createTime}'
								pattern='yyyy-MM-dd HH:mm:ss' />
						</p>
					</div>
				</div>


				<div class="form-group" id="addDepartment"></div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-6">
						<button type="button" class="btn btn-default btn-width"
							onclick="jQuery.groups.changeChecked();jQuery.groups.editGroup()">保存</button>
					</div>
				</div>

			</form>

		</div>
	</div>


	<!-- 弹出层 -->
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
						<li class="dropdown"><a href="#" id="dep"
							class="dropdown-toggle" data-toggle="dropdown">部门 <b
								class="caret"></b></a>
							<ul class="dropdown-menu " role="menu"
								style="overflow-y: scroll; height: 200px;" aria-labelledby="dep">
								<c:forEach items="${deptList}" var="entity">
									<li><a href=""
										onclick="jQuery.groups.changeDepart(${entity.id})"
										tabindex="-1" data-toggle="tab"> ${entity.name}</a></li>
								</c:forEach>
							</ul></li>
					</ul>

					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active"
							style="overflow-y: scroll; height: 350px; padding: 20px;">
							<div id="depUsers"></div>
							<div id="checkedDeptUser"></div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							onclick="jQuery.groups.saveUser()">保存</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<c:import url="/jsps/common/bottom.jsp" />
</body>

</html>