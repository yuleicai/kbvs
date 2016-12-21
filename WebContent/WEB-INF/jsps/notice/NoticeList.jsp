<!DOCTYPE html>
<html>
		<%@ page language="java" contentType="text/html; charset=UTF-8" %>
		<%@ include file="/jsps/common/include.jsp"%>
		<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
	<head>
		<title>全员公告列表</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/notice.js"></script>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/My97DatePicker/WdatePicker.js"></script>
		<link  type="text/css" rel="stylesheet"href="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/My97DatePicker/skin/WdatePicker.css"/>
	</head>

	<body>
		<%@ include file="/jsps/common/title.jsp"%>
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理  ><a href="/admin/notice/module/list">公告管理 </a> ><span class="redspan">全员公告列表</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">全员公告列表</h4>
				<hr class="clearFloat" />
				<form id="listForm" role="form" action="/admin/notice/list" method="get" class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-1 control-label">公告标题 : </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="title" name="title" value="${noticeDto.title}"/>
						</div>
						<label class="col-sm-1 control-label">所属模块: </label>
						<div class="col-sm-2">
							<select class="form-control" id="moduleId" name="moduleId">
								<option value="0" <c:if test="${noticeDto.moduleId==0 }">selected="selected"</c:if>>全部</option>
								<c:forEach items="${noticeModuleList}" var="entity">
									<option value="${ entity.id}" 
										<c:if test="${noticeDto.moduleId==entity.id }">selected="selected"</c:if>>${ entity.name}
									</option>
								</c:forEach>
							</select>
						</div>
						<label class="col-sm-1 control-label">是否启用 : </label>
						<div class="col-sm-2">
							<select class="form-control"  id="isEnable" name="isEnable">
								<option value="0" <c:if test="${noticeDto.isEnable=='0' }">selected="selected"</c:if>>全部</option>
								<option value="1" <c:if test="${noticeDto.isEnable=='1' }">selected="selected"</c:if>>是</option>
								<option value="2" <c:if test="${noticeDto.isEnable=='2' }">selected="selected"</c:if>>否</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-1 control-label">是否置顶 : </label>
						<div class="col-sm-2">
							<select class="form-control"  id="isTop" name="isTop">
								<option value="0" <c:if test="${noticeDto.isTop=='0' }">selected="selected"</c:if>>全部</option>
								<option value="1" <c:if test="${noticeDto.isTop=='1' }">selected="selected"</c:if>>是</option>
								<option value="2" <c:if test="${noticeDto.isTop=='2' }">selected="selected"</c:if>>否</option>
							</select>
						</div>
						<label class="col-sm-2 col-xs-3 control-label">生效时间 : </label>
						<div class="col-sm-2 col-xs-3">
							<input type="text" class="Wdate" id="startTime" name="startTime" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="<fmt:formatDate value="${noticeDto.startTime }" pattern="yyyy-MM-dd HH:mm:ss" />"/>
						</div>
						
					</div>
					<div class="form-group">
						<div class="col-sm-10 ">
							<button type="button" class="btn btn-default btn-width float-rightt" 
								onclick="javascript:window.location.href='/admin/notice/publish'"
								>发布全员公告</button>&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-default btn-width float-rightt" 
								onclick="javascript:window.location.href='/admin/notice/departmentPublish'"
								>发布部门公告</button>
							<button type="submit" class="btn btn-default btn-width float-rightt">立即搜索</button>
						</div>
						
					</div>
					<table data-toggle="table">
			         	 <thead>
				           <tr>
							   	<th data-halign="center">序号</th>
								<th data-halign="center">公告模块</th>
								<th data-halign="center">标题</th>
								<th data-halign="center">是否启用</th>
								<th data-halign="center">是否置顶</th>
								<th data-halign="center">发布者</th>
								<th data-halign="center">生效时间</th>
								<th data-halign="center">操作</th>	
				           </tr>
				        </thead>
			         	<tbody>
				            <c:forEach var="list" items="${noticeList}" varStatus="s">
							     <tr>                         
									<%-- <td title="${list.id}">${list.id}</td> --%>
									<td   title="${s.count}" class ="col-sm-0.4 text-center ">${s.count }</td>
									<td title="${list.name}" class="col-sm-1 rowinline text-center">${list.name}</td>
									<td title="${list.title}">${list.title}</td>
									<td title="${list.isEnable}" class="col-sm-1 rowinline text-center">
										<c:if test="${list.isEnable == '1'}">是</c:if>
										<c:if test="${list.isEnable == '2'}">否</c:if>
									</td>
								    <td title="${list.isTop}" class="col-sm-1 rowinline text-center">
								    	<c:if test="${list.isTop == '1'}">是</c:if>
										<c:if test="${list.isTop == '2'}">否</c:if>
								    </td>
								    <td title="${list.userName}">${list.userName}(${list.email})</td>
								    <td name="startTime" title="<fmt:formatDate type="time" value="${list.startTime}" pattern="yyyy-MM-dd HH:mm:ss" />" class="col-sm-1 rowinline text-center"><fmt:formatDate type="time" value="${list.startTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								    <td class="col-sm-1.2 rowinline text-center">
								   	 	<a class="btn btn-primary btn-xs btn-color" href="${ctx}/admin/notice/detail?id=${list.id}">操作详情</a>
								   	 	<a class="btn btn-primary btn-xs btn-color" style="cursor:pointer" onclick="jQuery.notice.startOrStopNotice(${list.id},${list.isEnable},this);">
											<c:if test="${list.isEnable == '1'}">
												禁用
			   								</c:if>
			   								<c:if test="${list.isEnable == '2'}">
												启用
			   								</c:if>
										</a>
										<a class="btn btn-primary btn-xs btn-color" style="cursor:pointer" onclick="jQuery.notice.topOrCancelNotice(${list.id},${list.isTop},this);">
											<c:if test="${list.isTop == '1'}">
												取消置顶
			   								</c:if>
			   								<c:if test="${list.isTop == '2'}">
												开启置顶
			   								</c:if>
										</a>
								    </td>
							    </tr>                        
				           	</c:forEach>
			            </tbody>
		         	</table>
		         	<ghs:pager url="/admin/notice/list?title=${noticeDto.title}&moduleId=${noticeDto.moduleId}&isEnable=${noticeDto.isEnable}&isTop=${noticeDto.isTop}&startTime=${noticeDto.param}"	
					current="${pageIndex }" total="${totalCount }" pageSize="<%=com.ghs.kbvs.constants.KbvsConstant.ADMIN_PAGE_SIZE_10 %>"/>
		         </form>
				<br>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
</html>
	