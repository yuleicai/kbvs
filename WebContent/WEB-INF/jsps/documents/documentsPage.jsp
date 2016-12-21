<!DOCTYPE html>
<html> 
	<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ include file="/jsps/common/include.jsp"%>
	<head>
		<title>文档详情</title>
		<%@ include file="/jsps/common/pageJs.jsp"%>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/js/documents.js"></script>
		<script type="text/javascript" src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/My97DatePicker/WdatePicker.js"></script>
		<link  type="text/css" rel="stylesheet"href="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN %>/My97DatePicker/skin/WdatePicker.css"/>
	</head>

	<body>
		<%@ include file="/jsps/common/title.jsp"%>
		<div class="container">
			<h5 class="dangqwz">当前位置：系统管理 > <a href="/admin/documents/list">文档中心管理 </a> > <span class="redspan">文档详情</span> </h5>
			<div class="syswhite yigebiao">
				<h4 class="biaoti">文档详情</h4>
				<hr class="clearFloat"/>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label">文档名称 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.name }</p>
						</div>
						<label class="col-sm-2 control-label">文档编码 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.code }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">所属公司 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.company.name }</p>
						</div>
						<label class="col-sm-2 control-label">所属部门 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.dept.name  }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">文档级别 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.docLevel.name  }</p>
						</div>
						<label class="col-sm-2 control-label">文档范围 :</label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.docScope.name  }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">文档类别 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.docType.name }</p>
						</div>
						<label class="col-sm-2 control-label">所属过程 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.subProcessP.name  } &nbsp; 》 &nbsp;${documents.subProcessC.name  }</p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">版本号 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.version }</p>
						</div>
						<label class="col-sm-2 control-label">阅读量 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.viewCount }</p>
						</div>
					</div>
				 
					
					 
					<div class="form-group">
						 <label class="col-sm-2 control-label">文档附件 : </label>
						<div class = "col-sm-offset-2">
							<c:forEach var="list" items="${documents.attachmentList }" varStatus="s">
								<c:if test="${s.count ne 1 }">
									<div class = "form-group col-sm-offset-2"></div>
								</c:if>
								<div class="col-sm-5">
									<p class="form-control-static">${list.name }</p>
								</div>
<!-- 								<div class="col-sm-2"> -->
<%-- 									<p class="form-control-static">${list.downloadCount }</p> --%>
<!-- 								</div> -->
								<label class="col-sm-2 control-label"><a href="/admin/file/download?businessId=${documents.id }&attachmentId=${list.id }" target="_blank">下载</a></label>
								<label class="col-sm-2 control-label"><a href="/admin/file/browse?businessId=${documents.id }&attachmentId=${list.id }" target="_blank">在线浏览</a></label>
								<label class=" col-sm-2 control-label">
<%-- 									<a onclick="jQuery.documents.createPreviewLink(this,${documents.id},${list.id })">生成预览连接</a> --%>
									<a onclick="jQuery.documents.click(this,${documents.id},${list.id })">生成预览连接</a>
								</label>
								<div class ="clearFloat" id="${list.id}">
									<c:if test="${list.previewUrl != null}">
										<div class='form-group'>
											<p class='col-sm-1  control-label'>预览链接 : </p>
											<div class='col-sm-5'>
												<p class='form-control-static'>${list.previewUrl }</p>
											</div>
											<p class='col-sm-1 control-label'>有效期截至 : </p>
											<div class='col-sm-3'>
												<p class='form-control-static'>
													<fmt:formatDate type='time' value='${list.disableTime }' pattern='yyyy-MM-dd HH:mm:ss' />
												</p>
											</div>
										</div>
									</c:if>
								</div>
							</c:forEach>
						
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">发布者 : </label>
						<div class="col-sm-4">
							<p class="form-control-static">${documents.createUser.name}(${documents.createUser.email})</p>
						</div>
						<label class="col-sm-2 control-label">发布时间 : </label>
						<div class="col-sm-4">
						  	<p class="form-control-static">
						  	<fmt:formatDate type='time' value='${documents.createTime }' pattern='yyyy-MM-dd HH:mm:ss' /></p>
						</div>
					</div>
					
				
				<div class="form-group">
						<div class="col-sm-offset-5 col-sm-6">
							<button type="button" class="btn btn-default btn-width" onclick="javascript:window.location.href='/admin/documents/edit?id=${documents.id}' ">修 改</button>
							<button type="button" class="col-sm-offset-1 btn btn-danger btn-width" 
							onclick="jQuery.documents.deleteDoc(${documents.id})">删 除</button>
						</div>
				</div>
				
				</form>
<!-- 				<div class="tanchuang" style="background-color: #64328E"> -->
<!-- 					<button  type="button" class="close closeWz" id="closeBtn">&times;</button> -->
<!-- 					<div style="margin-top: 20px;"> -->
<!-- 					<p class="h3 text-center"><span style="color: white;">请选择失效日期时间 </span></p> -->
<!-- 					</div> -->
<!-- 					<div id = "mone" class="divHidden activeDiv mone" style="background-color: white;"> -->
<!-- 						<form class="form-horizontal" role="form"> -->
<!-- 							<input type="hidden" value="" id="attId" name="attId"> -->
<!-- 							<input type="hidden" value="" id="docId" name="docId"> -->
<!-- 							<div class="form-group"> -->
<!-- 								<label class="col-sm-2 control-label">时间 : </label> -->
<!-- 								<div class="col-sm-4"> -->
<!-- 									<input type="datetime-local" class="Wdate" id="endTime" name="endTime" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/> -->
<!-- 								</div> -->
<!-- 								<div class ="col-sm-4"> -->
<!-- 									<span class="redspan">请选择合理的失效日期</span> -->
<!-- 								</div> -->
								 
<!-- 							</div> -->
<!-- 							<div class="form-group"> -->
<!-- 								<div class="col-sm-offset-4 col-sm-6"> -->
<!-- 									<button type="button" class="btn btn-default btn-width"  -->
<!-- 										onclick="jQuery.documents.createPreviewLink()"> -->
<!-- 										生成预览连接 -->
<!-- 									</button> -->
		
<!-- 								</div> -->
<!-- 							</div> -->
						 
<!-- 						</form> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="zhezhao"> -->
<!-- 				</div> -->
				
				
			</div>
		</div>
		<c:import url="/jsps/common/bottom.jsp" />
	</body>
	<!-- <script type="text/javascript">
		$(function(){
			$("#closeBtn").on('click',function(){
			 	$('.zhezhao').hide();
			 	$('.tanchuang').hide();
			 	var htmlE = document.getElementsByTagName('html')[0];
			 	htmlE.style.overflow = "visible";
			 
		});

			 
		});
	</script> -->
</html>