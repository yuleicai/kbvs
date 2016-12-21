<!DOCTYPE html>
<html> 
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>发布全员公告</title>
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
			<h5 class="dangqwz">当前位置：系统管理 ><a href="/admin/notice/module/list">公告管理 </a> > <span class="redspan">发布全员公告</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">发布全员公告</h4>
				<hr class="clearFloat"/>
				<form class="form-horizontal" role="form" id="saveForm" action="/admin/notice/save" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">公告标题 : </label>
						<div class="col-sm-4">
							<input type="text" maxlength="32" placeholder="公告名称(不超过32字符)" class="form-control" id="title" name="title"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">公告模块 : </label>
						<div class="col-sm-2">
							<select class="form-control" id="noticeId" name="moduleId">
								<option value="0">--请选择--</option>
								<c:forEach var="list" items="${noticeModuleList}">
									<option value="${list.id }">${list.name}</option>
								</c:forEach>
							</select>
						</div>
						<div id="moduleSonList" class="col-sm-2" style="display: none;">
							<select class="form-control" id="noticeSonId" name="sonModuleId">
								<option value="0">--请选择--</option>
								<c:forEach var="list" items="${noticeSonModuleList}">
									<option value="${list.id}">${list.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">是否置顶 : </label>
						<div class="col-sm-2">
							<label class="danxuan">
							  <input type="radio" id="inlineRadio1" name = "isTop" value="1" checked/> 是
							</label>
						</div>
						<div class="col-sm-2">
							<label class="danxuan">
							  <input type="radio" id="inlineRadio1" name = "isTop" value="2"/> 否
							</label>
						</div>
					</div>
				 
					<div class="form-group">
						<label class="col-sm-2 control-label">生效时间 : </label>
						<div class="col-sm-4">
							<input type="text" class="Wdate" id="startTime" name="startTime" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
						</div>
					</div>
					 
					<div class="form-group">
						<label class="col-sm-2 control-label">公告详情 : </label>
						<div class="col-sm-8">
							<textarea class="xheditor-simple" rows="20" cols="120" id="description" name="description" type="description"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-6">
							<button type="button"  class="btn btn-default btn-width" onclick="jQuery.notice.checkAddSubmit(this,'saveForm')">发布</button>
							<button type="button" class="btn btn-default btn-width" onclick="javascript:history.go(-1)">返 回</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<%@ include file="/jsps/common/bottom.jsp"%>
	</body>
</html>