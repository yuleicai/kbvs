<!DOCTYPE html>
<html>
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>修改知识</title>

		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/xheditor/xheditor-1.2.2.min.js"></script>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/xheditor/xheditor_lang/zh-cn.js"></script>
		
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/knowledge.js"></script>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/upload.js"></script>
	</head>

	<body>
		<c:set var="upload_file_type" value="<%=com.ghs.kbvs.upload.constants.UploadFileConstance.UPLOAD_FILE_TYPE_KNOWLEDGE %>"/>
		<c:import url="/jsps/common/title.jsp" />
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理 > <a href="/admin/knowledge/list" >知识管理 </a>> <a href="/admin/knowledge/details?id=${id }" >知识详情</a>> <span class="redspan">修改知识</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">修改知识</h4>
				<hr class="clearFloat" />
				<form class="form-horizontal" role="form" id="saveForm">
					 <input type ="hidden" id ="id" name = "id" value = "${id }">
					<div class="form-group">
						<label class="col-sm-2 control-label">知识分类: </label>
						<div id="categoryId">
							<div class="col-sm-offset-2 col-sm-10">
							<c:forEach items = "${categoryList}" var = "categoryList0"  varStatus="status0">
								<input type="hidden" id="spanId" value="${fn:length(categoryList0)}" />
								<div class="form-group" id = "div0_span_${status0.index }">
									<span id='span_${status0.index }' >
										<input type="hidden" id="selectedId_span_${status0.index }" name="selectedId" value=${categoryList0['lastCategory']} /><!-- 每条分类下选中的最后一个id -->
									    <c:forEach items="${categoryList0['tempList']}" var = "categoryList1" varStatus="status1">
									   		<input type="hidden" id="hidId_span_${status0.index }" value="${fn:length(categoryList1)}"/>
									    	<div class="col-sm-2 " id = "div_span_${status0.index }_${status1.index }">
												<select class="form-control" id = "span_${status0.index }_${status1.index }" name="categoryName" onchange="jQuery.knowledge.addChangeCategory(this)">
													<option value="-1">全部</option>
													<c:forEach items="${categoryList1['category'] }" var = "categoryList2">
															<option value="${categoryList2.id}"
															   <c:if test="${categoryList2.id==categoryList1['categoryId'] }">selected="selected"</c:if>>
																	${categoryList2.name}</option>													
													</c:forEach>
												</select>
												
											</div>
											
									    </c:forEach>
									</span>
									<button type="button" class="btn btn-default btn-width float-rightt z-indexdiv" onclick = "jQuery.knowledge.deleteCategory('div0_span_${status0.index }')">删除分类</button>
								</div>
							</c:forEach>
							</div>
						</div>
							<button type="button" class="btn btn-default btn-width float-rightt z-indexdiv" onclick = "jQuery.knowledge.addCategory()">添加分类</button>
					 </div>
					 
					<div class="form-group">
						<label class="col-sm-2 control-label">知识名称: </label>
						<div class="col-sm-6">
							<input class="form-control" id = "title" name = "title" value = "${title }"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">知识类别: </label>
						<div class="col-sm-9">
							 <label class="radio-inline">
							  <input type="radio" name="fileType" id="fileType1" value="1" <c:if test="${fileType==1}">checked</c:if>> 文件
							</label>
							<label class="radio-inline">
							  <input type="radio" name="fileType" id="fileType2" value="2" <c:if test="${fileType==2}">checked</c:if>> 记录
							</label>
							<label class="radio-inline">
							  <input type="radio" name="fileType" id="fileType3" value="3" <c:if test="${fileType==3}">checked</c:if>> 资料
							</label>
							
						</div>
					</div>
					 <div class="form-group">
						<label class="col-sm-2 control-label">知识标签: </label>
						<div class="col-sm-8">
						    <c:forEach items="${labelList}" var="label">
						    	 <c:set var="flag" value="false"></c:set>
								 <c:forEach items="${labelId}" var="obj">
									 <c:if test="${obj==label.id}">
									 	<c:set var="flag" value="true"></c:set>   
									  </c:if>
								  </c:forEach>
			    				<input type="checkbox" name="labelId" value="${label.id}"  <c:if test="${flag==true}">checked</c:if>/>${label.name} &nbsp;&nbsp;
			    			</c:forEach>
			    			<input type = "hidden" id = "checked" name = "checked"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label ">描述 : </label>
						<div class="col-sm-10">
							<textarea name = "description" id="description" class="xheditor-simple" rows="20" cols="120">${description }
							</textarea>
						</div>
					</div>
					<c:forEach var="list" items="${attachmentList }" varStatus="i">
						<div id="input_fileItem_${list.id }" style="display: none;">
							<input type="hidden" name="attachmentList[${i.index }].id" value="${list.id }"/>
							<input type="hidden" name="attachmentList[${i.index }].path" value="${list.path }"/>
							<input type="hidden" name="attachmentList[${i.index }].name" value="${list.name }"/>
						</div>
					</c:forEach>
					<div class="form-group" id="showUploadFileDiv">
						<input type="hidden" id="uploadFileCount" value="${fn:length(attachmentList) }"/>
						<label class="col-sm-2 control-label">知识附件 : </label>
						<c:forEach var="list" items="${attachmentList }" varStatus="s">
							<c:if test="${s.count == 1 }">
<%-- 								<div id="fileItem_${list.id }"> --%>
									<div class="col-sm-6" id="fileItem_${list.id }">
										<p class="form-control-static">${list.name }</p>
									</div>
									<button class="btn btn-danger margin-bottom col-sm-offset-2 col-sm-1" type="button" onclick="jQuery.upload.delUploadFileDiv(this,'fileItem_${list.id }');">删除</button>
<!-- 								</div> -->
							</c:if>
							<c:if test="${s.count != 1 }">
<%-- 								<div id="fileItem_${list.id }" > --%>
									<div class="col-sm-6 col-sm-offset-2" id="fileItem_${list.id }">
										<p class="form-control-static">${list.name }</p>
									</div>
									<button class="btn btn-danger margin-bottom col-sm-offset-2 col-sm-1" type="button" onclick="jQuery.upload.delUploadFileDiv(this,'fileItem_${list.id }');">删除</button>
<!-- 								</div> -->
							</c:if>
						</c:forEach>
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
<!-- 				<div class="form-group"> -->
<!-- 					<div class=" col-sm-offset-2 col-sm-7"> -->
<!-- 						<div class="input-group"> -->
<!-- 							<form id="uploadForm" method="post" enctype="multipart/form-data" target="ifm"> -->
<!-- 								<input type="file" id="uploadFileId" class="form-control" name="fileName" /> -->
<!-- 								<span class="input-group-btn"> -->
<%-- 							        <button class="btn btn-default" type="button" onclick="jQuery.upload.getUploadStatus('uploadForm', '${upload_file_type}', 'uploadStatusTag', 'uploadFileId', 'showUploadFileDiv');">上 传</button> --%>
<!-- 							     </span> -->
<!-- 							</form> -->
<!-- 							<span id="uploadStatusTag"></span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
					
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-6">
						<button type="button" class="btn btn-default btn-width" onclick="jQuery.knowledge.getCheckLabel();jQuery.knowledge.editKnowledge(this)">保 存</button>
					</div>
				</div>
				
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
		<iframe id="ifm" name="ifm" style="display: none" ></iframe>
	</body>

</html>