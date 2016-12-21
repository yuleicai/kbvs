
<!DOCTYPE html>
<html> 
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>修改公告</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/notice.js"></script>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/xheditor/xheditor-1.2.2.min.js"></script>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/xheditor/xheditor_lang/zh-cn.js"></script>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/My97DatePicker/WdatePicker.js"></script>
		<link  type="text/css" rel="stylesheet"href="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/My97DatePicker/skin/WdatePicker.css"/>
	</head>
	
	<body>
		<%@ include file="/jsps/common/title.jsp"%>
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理 > <a href="/admin/notice/module/list">公告管理 </a> > <span class="redspan">修改公告</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">修改公告</h4>
				<hr class="clearFloat"/>
				<form class="form-horizontal" role="form" id="updateForm" action="/admin/notice/saveEditnNotice" method="post">
					<input type="hidden" name="id" value="${noticeEdit.id }">
					<div class="form-group">
						<label class="col-sm-2 control-label">公告标题 : </label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="title" name="title" value="${noticeEdit.title}"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">公告模块 : </label>
						<div class="col-sm-2" <c:if test="${noticeEdit.moduleId == 1}">style="display: none;"</c:if>>
							<select class="form-control" id="noticeId" name="moduleId">	
								<c:forEach items="${noticeModuleList}" var="noticeModuleList">
									<option value="${noticeModuleList.id }" 
									    <c:if test="${noticeModuleList.id==noticeEdit.moduleId}">selected="selected"</c:if>>${noticeModuleList.name}
									</option>
								</c:forEach>
							</select>
						</div>									 
						<div id="moduleSonList" class="col-sm-2" <c:if test="${noticeEdit.moduleId != 1}">style="display: none;"</c:if>>
							<select class="form-control" id="noticeSonId" name="sonModuleId">
								<c:forEach items="${noticeSonModuleList}" var="noticeSonModuleList">
									<option value="${noticeSonModuleList.id}"
										<c:if test="${noticeEdit.sonModuleId==noticeSonModuleList.id}">selected="selected"</c:if>>${noticeSonModuleList.name}	
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">是否置顶 : </label>
						<div class="col-sm-2">
							<label class="danxuan">
							  <input type="radio" id="inlineRadio1" name = "isTop" value="1" <c:if test="${noticeEdit.isTop=='1'}">checked="checked"</c:if>/> 是
							</label>
						</div>
						<div class="col-sm-2">
							<label class="danxuan">
							  <input type="radio" id="inlineRadio1" name = "isTop" value="2" <c:if test="${noticeEdit.isTop=='2'}">checked="checked"</c:if>/> 否
							</label>
						</div>
					</div>
				 
					<div class="form-group">
						<label class="col-sm-2 control-label">生效时间 : </label>
						<div class="col-sm-4">
							<input type="text" class="Wdate" id="startTime" name="startTime" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="<fmt:formatDate value="${noticeEdit.startTime }" pattern="yyyy-MM-dd HH:mm:ss" />"/>
						</div>
					</div>
					 
					<div class="form-group">
						<label class="col-sm-2 control-label">公告详情 : </label>
						<div class="col-sm-8">
							<textarea class="xheditor-simple" rows="20" cols="120" id="description" name="description" type="description">${noticeEdit.description}</textarea>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-6">
							<button type="button" class="btn btn-default btn-width" onclick="jQuery.notice.checkAddSubmit(this,'updateForm')">保存</button>
							<button type="button" class="btn btn-default btn-width" onclick="javascript:history.go(-1)">返 回</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<%@ include file="/jsps/common/bottom.jsp"%>
	</body>
</html>