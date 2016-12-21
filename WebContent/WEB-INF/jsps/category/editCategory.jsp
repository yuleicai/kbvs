<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsps/common/include.jsp"%>
<c:set var="class_type_1" value="<%=com.ghs.kbvs.constants.KbvsConstant.CLASS_TYPE_1 %>"/>
<c:set var="class_type_3" value="<%=com.ghs.kbvs.constants.KbvsConstant.CLASS_TYPE_3 %>"/>
<%@ taglib prefix="ghs" uri="/WEB-INF/page.tld"%>
<head>
<title>知识分类</title>
<%@ include file="/jsps/common/pageJs.jsp"%>
<script type="text/javascript"
	src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/category.js"></script>
</head>

<body>
	<c:import url="/jsps/common/title.jsp" />
	<div class="container">
		<h5 class="dangqwz">
			当前位置：系统管理 > 知识管理 > <span class="redspan">知识分类</span>
		</h5>
		<div class="syswhite yigebiao">
			<h4 class="biaoti">知识分类列表</h4>
			<hr class="clearFloat" />
			<form class="form-horizontal" role="form" id="categoryForm" method="post">
				<div class="form-group">
					<label class="col-sm-1 control-label">分类名称: </label>
					<div class="col-sm-3">
						 <input type="hidden" name="id" value="${id}"> 
						  <input type="text" name="name" id="name" class="form-control" placeholder="分类名称" value="${name }" />
					</div>
					<label class="col-sm-1 control-label">分类排序: </label>
					<div class="col-sm-2">
						<input type="text" name="sort" id="sort" class="form-control" placeholder="分类排序" value="${sort}"/>
					</div>
					<label class="col-sm-1 control-label">分类类别: </label>
					<div class="col-sm-2">
						<select class="form-control" name="type" id="type" value="${type }">
							<option value="1" <c:if test="${type eq class_type_1 }">selected="selected"</c:if>>目录</option>
							<option value="3" <c:if test="${type eq class_type_3 }">selected="selected"</c:if>>功能</option>
						</select>
					</div>
					<div class="col-sm-2">
						<button type="button"
							class="btn btn-default btn-width float-rightt"
							onclick="jQuery.category.update('categoryForm')">保存</button>
					</div>
				</div>
				<br />
				
			</form>
		</div>
	</div>
	<c:import url="/jsps/common/bottom.jsp" />
</body>

</html>