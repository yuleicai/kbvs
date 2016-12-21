<!DOCTYPE html>
<html> 
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>发布学习任务</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/upload.js"></script>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/learn.js"></script>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/xheditor/xheditor-1.2.2.min.js"></script>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/xheditor/xheditor_lang/zh-cn.js"></script>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/My97DatePicker/WdatePicker.js"></script>
		<link  type="text/css" rel="stylesheet"href="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/My97DatePicker/skin/WdatePicker.css"/>
	</head>
	<body>
		<c:set var="upload_file_type" value="<%=com.ghs.kbvs.upload.constants.UploadFileConstance.UPLOAD_FILE_TYPE_LEARN %>"/>
		<%@ include file="/jsps/common/title.jsp"%>
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理 > <a href="/admin/learn/taskList">学习管理 </a> > <span class="redspan">发布学习任务</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">发布学习任务</h4>
				<hr class="clearFloat" />
				
				<form class="form-horizontal" role="form" id="saveForm" action="${ctx}/admin/learn/saveTask" method="post" >
					<c:if test="${learnTask ne null }">
						<input type="hidden" name="id" value="${learnTask.id }">
					</c:if>
					<div class="form-group">
						<label class="col-sm-2 control-label">标题 : </label>
						<div class="col-sm-4">
							<input type="text" class="form-control" maxlength="50" placeholder="学习任务标题(不超过50字符)" name="title" id="title" value="${learnTask.title }"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">学习人员 : </label>
						<div class="col-sm-2">
							<button type="button" class="btn btn-default btn-width" data-toggle="modal" data-target="#myModal">选择部门/小组/员工
							</button>
						</div>
					</div>
					
					<c:if test="${learnTask eq null }">
						<div id="staffCheckBoxDiv" class="form-group" style="display: none;">
							<input type="hidden" id="staffStr" name="staffStr">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-6" >
								<div class="checkbox" id="staffCheckBox">
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${learnTask ne null }">
						<div id="staffCheckBoxDiv" class="form-group" >
							<input type="hidden" id="staffStr" name="staffStr">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-6" >
								<div class="checkbox" id="staffCheckBox">
									<c:forEach var="list" items="${staffStrsForShow }">
										<label>
									    	<input type="checkbox" checked="true" value="${list.staffIdStr }" />
									    	${list.staffName }
									  	</label>
										<span class="jianju2"></span>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:if>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">生效时间 : </label>
						<div class="col-sm-4">
							<input type="text" class="Wdate" id="startTime" name="startTime" readonly="readonly" 
							value="<fmt:formatDate type="time" value="${learnTask.startTime }" pattern="yyyy-MM-dd HH:mm:ss" />" 
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H:%m:%s',maxDate:'#F{$dp.$D(\'endTime\')||\'2050-10-01\'}'})"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">结束时间 : </label>
						<div class="col-sm-4">
							<input type="text" class="Wdate" id="endTime" name="endTime" readonly="readonly" 
							value="<fmt:formatDate type="time" value="${learnTask.endTime }" pattern="yyyy-MM-dd HH:mm:ss" />" 
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startTime\')}',maxDate:'2050-10-01'})"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">最少学习时间(分钟) : </label>
						<div class="col-sm-4">
							<input type="text" class="form-control" placeholder="最少学习时间(单位:分钟)" style="width: 200px;" 
							maxlength="10" name="minimalTime" id="minimalTime" value="${learnTask.minimalTime }" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">描述 : </label>
						<div class="col-sm-8">
							<textarea class="xheditor-simple" rows="20" cols="120" name="description" type="description">${learnTask.description }</textarea>
						</div>
					</div>
					
					<c:forEach var="list" items="${learnTask.attachmentList }" varStatus="i">
						<div id="input_fileItem_${list.id }" style="display: none;">
							<input type="hidden" name="attachmentList[${i.index }].id" value="${list.id }"/>
							<input type="hidden" name="attachmentList[${i.index }].path" value="${list.path }"/>
							<input type="hidden" name="attachmentList[${i.index }].name" value="${list.name }"/>
						</div>
					</c:forEach>
					<div class="form-group" id="showUploadFileDiv">
						<input type="hidden" id="uploadFileCount" value="${fn:length(learnTask.attachmentList) }"/>
						<label class="col-sm-2 control-label">文档附件 : </label>
						<c:if test="${learnTask ne null }">
							<c:forEach var="list" items="${learnTask.attachmentList }" varStatus="s">
								<c:if test="${s.count==1 }">
										<div class="col-sm-6"  id="fileItem_${list.id }">
											<p class="form-control-static">${list.name }</p>
										</div>
										<button class="btn btn-danger margin-bottom col-sm-offset-2 col-sm-1" onclick="jQuery.upload.delUploadFileDiv(this,'fileItem_${list.id }');return false;">删除</button>
								</c:if>
								<c:if test="${s.count!=1 }">
										<div class=" col-sm-offset-2 col-sm-6"  id="fileItem_${list.id }">
											<p class="form-control-static">${list.name }</p>
										</div>
										<button class="btn btn-danger margin-bottom col-sm-offset-2 col-sm-1" onclick="jQuery.upload.delUploadFileDiv(this,'fileItem_${list.id }');return false;">删除</button>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
				</form>
				
				<div class="form-group">
					
					<div class=" col-sm-offset-1 col-sm-11">
						<div class=" form-group">
							<form id="uploadForm"  method="post" enctype="multipart/form-data" target="ifm">
								<div class="col-sm-offset-1 col-sm-11"  style = "padding:0">
									<div class=" col-sm-7"  style = " padding:0">
										<div class="input-group ">
											<input type="text" id="filecontent" readonly="readonly" placeholder="" class="form-control " >
							  				 <span class="input-group-btn">
												<div style="display: none;">
													<input id="uploadFileId" type="file" class="form-control" name="fileName" onchange="jQuery.upload.fileClick(this);" />
												</div>
												<button class="btn btn-default btn-width" type="button" id="view"  onclick="jQuery.upload.inputClick();">浏览文件</button>
												<button class="btn btn-default btn-width" style="margin-left: 20px" type="button" id="nimei"  onclick="jQuery.upload.getUploadStatus('uploadForm', '${upload_file_type}', 'uploadStatusTag', 'uploadFileId', 'showUploadFileDiv');">上传文件</button>
				   				   			</span>
				   				   			
										</div>
									</div>
									<div class=" col-sm-4">
										<div class="float-rightt">
											<p class="form-control-static rowInline"  id="uploadStatusTag" >
												
											</p>
										</div>
									</div>
								</div>
						     </form>
						     
						</div>
					</div>
				</div>
				<div class="clearFloat margin-bottom"></div>					
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-6">
						<button type="button" class="btn btn-default btn-width" onclick="jQuery.learn.checkSubmit(this,'saveForm')">发 布</button>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
		<iframe id="ifm" name="ifm" style="display: none" ></iframe>
		
		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">选择学习人员</h4>
					</div>
					<div class="modal-body">
						<ul id="myTab" class="nav nav-tabs">
							<li class="active">
								<a href="#home" data-toggle="tab">
									公司</a>
							</li>
							<li class="dropdown">
								<a href="#" id="dep" class="dropdown-toggle" data-toggle="dropdown">部门 <b class="caret"></b></a>
								<ul class="dropdown-menu " role="menu" style="overflow-y:scroll; height: 200px;" aria-labelledby="dep">
									<c:forEach var="list" items="${staffStrs }">
										<c:set value="${ fn:split(list.staffIdStr, '_') }" var="staffId" />
										<c:if test="${ staffId[0] eq '2' && fn:length(staffId) == 3  }">
											<li>
												<a href="#id_${list.staffIdStr }" tabindex="-1" data-toggle="tab">
												${list.staffName }</a>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" id="group" class="dropdown-toggle" data-toggle="dropdown">自定义组 <b class="caret"></b></a>
								<ul class="dropdown-menu " role="menu" style="overflow-y:scroll; height: 200px;" aria-labelledby="group">
									<c:forEach var="list" items="${staffStrs }">
										<c:set value="${ fn:split(list.staffIdStr, '_') }" var="staffId" />
										<c:if test="${ staffId[0] eq '3' && fn:length(staffId) == 3  }">
											<li>
												<a href="#id_${list.staffIdStr }" tabindex="-1" data-toggle="tab">
												${list.staffName }</a>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
						</ul>
						
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" style="overflow-y: scroll; height: 350px; padding: 20px;" id="home">
								<p>
									<div class="checkbox">
										<c:forEach var="list" items="${staffStrs }">
											<c:if test="${ fn:split(list.staffIdStr, '_')[0] ==1 }">
												<label>
											    	<input type="checkbox" id="selectSingle_${list.staffIdStr }" value="${list.staffIdStr }" />${list.staffName }
											  	</label>
											</c:if>
										</c:forEach>
									</div>
									
									<br><br><br><br><br><br><br><br><br><br><br><br>
									<h4 style="color: red;" >
										选择公司表示选择了此公司的所有员工
										<!-- <br>
										选择部门或组全选后，不能选择后续人员 -->
									</h4>
								</p>
							</div>
							<c:forEach var="list" items="${staffStrs }">
								<c:set value="${ fn:split(list.staffIdStr, '_') }" var="staffId" />
								<c:if test="${ fn:length(staffId) == 3 && staffId[0] != 1}">
									<div class="tab-pane fade" style="overflow-y: scroll; height: 350px; padding: 20px;"  id="id_${list.staffIdStr }">
										<p>
											<div class="checkbox">
												<label>
													<input type="checkbox" id="selectAll_${list.staffIdStr }" value="${list.staffIdStr }" onclick="jQuery.learn.selectAll('selectAll_${list.staffIdStr }')" />全选/全不选
													<input type="hidden" value="${list.staffName }">
												</label><br><br>
												<c:forEach var="listUser" items="${staffStrs }">
													<c:set value="${ fn:split(listUser.staffIdStr, '_') }" var="staffUserId" />
													<c:if test="${ fn:length(staffUserId) == 4  }">
														<c:if test="${ (staffId[1] eq staffUserId[1])&&(staffId[2] eq staffUserId[3]) }">
															<label>
														    	<input type="checkbox" id="selectSingle_${listUser.staffIdStr }" value="4_${staffUserId[2] }" />${listUser.staffName }
														  	</label>
														</c:if>
													</c:if>
												</c:forEach>
											  
											</div>
										</p>
									</div>
								</c:if>
							</c:forEach>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<c:if test="${learnTask eq null }">
								<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="jQuery.learn.saveStaff(1)">保存</button>
							</c:if>
							<c:if test="${learnTask ne null }">
								<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="jQuery.learn.saveStaff(2)">保存</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
	</body>
	
</html>
