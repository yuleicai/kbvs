<!DOCTYPE html>
<html> 
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>发布文档</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/upload.js"></script>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/documents.js"></script>
	</head>
	<body>
		<c:set var="upload_file_type" value="<%=com.ghs.kbvs.upload.constants.UploadFileConstance.UPLOAD_FILE_TYPE_DOCUMENT %>"/>
		<%@ include file="/jsps/common/title.jsp"%>
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理 > <a href="/admin/documents/list">文档中心管理 </a> > <span class="redspan">发布文档</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">发布文档</h4>
				<hr class="clearFloat" />
				<form class="form-horizontal" role="form" id="saveForm" action="/admin/documents/save" method="post" >
					<div class="form-group">
						<label class="col-sm-2 control-label">文档名称: </label>
						<div class="col-sm-4">
							<input type="text" class="form-control" placeholder="最多输入32个字符" id="name" name="name"  required maxlength="32"  />
						</div>

						<label class="col-sm-2 control-label">文档类别: </label>
						<div class="col-sm-3 danxuan">
							
								<c:forEach items="${map.type}" var="entity" varStatus="s"> 
									<label>
										<input name="docTypeId" type="radio" value="${entity.id}"  
											 <c:if test="${s.count eq 1 }">checked="checked" </c:if>/>${ entity.name} 
									</label>
								</c:forEach>
							

						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">所属公司: </label>
						<div class="col-sm-4">
							<select class="form-control" id="companyId" name="companyId" onchange="jQuery.documents.changeCompany('save')">
								<option value="0">-- 请选择  --</option>
								<c:forEach items="${map.company}" var="entity"> 
									<option value="${ entity.id}">${ entity.name}</option>
								</c:forEach>
							</select>
						</div>
						<label class="col-sm-2 control-label">所属部门: </label>
						<div class="col-sm-4">
							<select class="form-control" id = "deptId" name="deptId">
								 <option value="0">-- 请选择  --</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">文档级别: </label>
						<div class="col-sm-4">
							<select class="form-control" name="docLevelId">
								<c:forEach items="${map.level}" var="entity"> 
									<option value="${ entity.id}" >${ entity.name}</option>
								</c:forEach>	
							</select>
						</div>
						<label class="col-sm-2 control-label">文档范围: </label>
						<div class="col-sm-4">
							<select class="form-control" name="docScopeId">
								<c:forEach items="${map.scope}" var="entity"> 
									<option value="${ entity.id}">${ entity.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">所属过程: </label>
						<div class="col-sm-2">
							<select class="form-control" name="subProcessPid" id="subProcessPid" onchange="jQuery.documents.changeSubProcess('save')">
								<option value="0">-- 请选择  --</option>
								<c:forEach items="${map.subProcessPid}" var="entity"> 
									<option value="${ entity.id}">${ entity.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-2">
							<select class="form-control" name="subProcessCid" id="subProcessCid">
								<option value="0">-- 请选择  --</option>
							</select>
						</div>

						<label class="col-sm-2 control-label">版本号: </label>
						<div class="col-sm-4">
							<input type="text" class=" form-control" placeholder="最多输入32个字符"  id="version" name="version" required maxlength="32"/>
						</div>

					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">文档编码: </label>
						<div class="col-sm-4">
<!-- 							<input type="text" class=" form-control" placeholder=""  id="code" name="code" onblur="jQuery.documents.checkCodeUniquness();" /> -->
							<input type="text" class=" form-control" placeholder="最多输入32个字符"  id="code" name="code" required="required" maxlength="32"/>
						</div>
<!-- 						<div class="col-sm-2 control-label" id="info"></div> -->
					</div>
					<div class="form-group"   id="showUploadFileDiv">
						<input type="hidden" value="0" id="uploadFileCount">
						<label class="col-sm-2   control-label">文档附件: </label>
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
					<div class="col-sm-offset-5 col-sm-6">
						<button type="button"  class="btn btn-default btn-width" onclick="jQuery.documents.checkAddSubmit(this,'saveForm')">发 布</button>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
		<iframe id="ifm" name="ifm" style="display: none" ></iframe>
	</body>
</html>