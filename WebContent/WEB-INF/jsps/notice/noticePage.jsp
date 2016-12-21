<!DOCTYPE html>
<html> 
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>公告详情</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/notice.js"></script>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/xheditor/xheditor-1.2.2.min.js"></script>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/xheditor/xheditor_lang/zh-cn.js"></script>
	</head>
	
	<body>
	<%@ include file="/jsps/common/title.jsp"%>
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理 > <a href="/admin/notice/module/list">公告管理 </a> > <span class="redspan">公告详情</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">公告详情</h4>
				<hr class="clearFloat"/>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label">发布者  : </label>
						<div class="col-sm-4">
							<p class="form-control-static" id="id">${noticeDetail.userName}(${noticeDetail.email})</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">公告标题 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${noticeDetail.title }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">公告模块 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${noticeDetail.moduleName }<c:if test="${noticeDetail.moduleName=='部门公告'}"> 》${noticeDetail.sonModuleName}</c:if></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">是否置顶 : </label>
						<div class="col-sm-4">
							<p class="form-control-static" id="isTop">
							<c:if test="${noticeDetail.isTop == '1'}">
								是 
   							</c:if>
   							<c:if test="${noticeDetail.isTop == '2'}">
								否
   							</c:if>
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">是否启用 : </label>
						<div class="col-sm-4">
							<p class="form-control-static" id="isEnable">
							<c:if test="${noticeDetail.isEnable == '1'}">
								是 
   							</c:if>
   							<c:if test="${noticeDetail.isEnable == '2'}">
								否
   							</c:if>
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">生效时间 : </label>
						<div class="col-sm-4">
							<p class="form-control-static"><fmt:formatDate type="time" value="${noticeDetail.startTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">发布时间 : </label>
						<div class="col-sm-4">
							<p class="form-control-static"><fmt:formatDate type="time" value="${noticeDetail.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">公告详情 : </label>
						<div class="col-sm-8">
<%-- 							<section  class="sectionDetail">${noticeDetail.description} --%>
<!-- 							</section> -->
							<div class="fuwenben " >
 								${noticeDetail.description}
 							</div>
						</div>
					</div>
					<div class="form-group">
						<c:if test="${noticeDetail.param != '1'}">
							<div class="col-sm-offset-4 col-sm-6" >
								<button type="button" class="btn btn-default btn-width" onclick="jQuery.notice.check(${noticeDetail.id});">修改</button>
								<button type="button" class="col-sm-offset-1 btn btn-danger btn-width" onclick="jQuery.notice.deleteNotice(${noticeDetail.id})">删除</button>
								<%-- <a class="col-sm-offset-1 btn btn-danger btn-width" href="${ctx}/admin/notice/delete?id=${noticeDetail.id}" onClick="return confirm('确定要删除该公告么?');">删除</a> --%>
							</div>
						</c:if>
					</div> 
				</form>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
</html>