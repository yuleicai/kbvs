<!DOCTYPE html>
<html>
	<%@ page language="java" contentType="text/html; charset=UTF-8"%>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>公告模块管理</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/notice.js"></script>
	</head>
	
	<body>
		<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<h5 class="dangqwz">
				当前位置：系统管理 > <a href="/admin/notice/module/list">公告管理 </a>> <span class="redspan">公告模块管理</span>
			</h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">公告模块管理</h4>
				<hr class="clearFloat" />
				
				<div class="form-group">
					<label class="col-sm-1 control-label padding-topp ">部门公告子模块: </label>
					<div class="col-sm-3">
						<input class="form-control" type="hidden" id="sonId" value="0"/>
						<input class="form-control" type="text" maxlength="100" class="form-control" placeholder="部门子模块名称(不超过100字符)" id="name" />
					</div>
					<button id="saveBtn" type="button" onclick="jQuery.notice.saveNoticeSonModuleName();" class="btn btn-default btn-width">保存</button>
				</div>
				
				<br>
				<div class="fixed-table-pagination">
					<table data-toggle="table">
						<thead>
							<tr>
								<th data-halign="center">序号</th>
								<th data-halign="center">公告模块</th>
								<th data-halign="center">子模块</th>
								<th data-halign="center">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${noticeModuleList }" varStatus="s">
								<c:if test="${fn:length(list.noticeSonModuleList) eq 0 }">
									<tr align="center">
										<td class ="col-sm-1 text-center">${s.count }</td>
										<td class ="col-sm-4 text-center">${list.name }</td>
										<td class ="col-sm-5"></td>
										<td class ="col-sm-2 text-center"></td>
									</tr>
								</c:if>
								
								<c:if test="${fn:length(list.noticeSonModuleList) ne 0 }">
									<c:forEach var="sonList" items="${list.noticeSonModuleList }" varStatus="t">
										<tr align="center">
											<c:if test="${t.count eq 1 }">
												<td class="hebingC col-sm-1 text-center" rowspan="${fn:length(list.noticeSonModuleList) }">${s.count }</td>
												<td class="hebingC col-sm-4 text-center" rowspan="${fn:length(list.noticeSonModuleList) }">${list.name }</td>
											</c:if>
											<td class ="col-sm-5" id="sonName_${sonList.id}">${sonList.name }</td>
											<td class="caozuo col-sm-2 text-center">
												<a class="btn btn-primary btn-xs btn-color" onclick="jQuery.notice.delNoticeSonModuleData(${sonList.id});">删除</a>
												<a class="btn btn-primary btn-xs btn-color" onclick="jQuery.notice.updateNoticeSonModuleData(${sonList.id});">修改</a>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<br>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
</html>