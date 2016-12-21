<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsps/common/include.jsp"%>
<head>
<title>知识库地图</title>
<style type="text/css">
#jsmind_container {
	width: 1000px;
	height: 800px;
	overflow: auto;
}
</style>
<c:import url="/jsps/common/pageJs.jsp" />
<script type="text/javascript"
	src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/jsmind.js"></script>
<script type="text/javascript"
	src="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/js/jsmind.draggable.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/css/bootstrap-submenu.css" />
<link rel="stylesheet" type="text/css"
	href="<%=com.ghs.kbvs.constants.DomainConstant.HTML_DOMAIN%>/css/jsmind.css" />
</head>

<body>
	<c:import url="/jsps/common/title.jsp" />
	<div class="container">
		<h5 class="dangqwz">
			当前位置：首页 > <span class="redspan">知识库地图 </span>
		</h5>
		<div class="syswhite yigebiao">
			<h4 class="biaoti">知识库地图</h4>
			<hr class="clearFloat" />
			<div id="jsmind_container"></div>
		</div>
	</div>
	<c:import url="/jsps/common/bottom.jsp" />
</body>

<script type="text/javascript">
$(function(){
		var mind = {
		    "meta":{
		             "name":"demo",
		             "author":"hizzgdev@163.com",
		             "version":"0.2",
		            },
		            "format":"node_array",
		            "data": ${data}
		        };
		var options = {
			container: 'jsmind_container',
			//editable: true,
			theme: 'info'
		};

		var jm = new jsMind(options);
		// 让 jm 显示这个 mind 即可
		jm.show(mind);
		jm.expand_to_depth(1);
		
		$("jmnode").each(function(i){
			$(this).on('click',function(){
				var mid = $(this).attr("nodeid");
				var urls = mind.data;
				for (var  i in urls) {
					 
					if(urls[i].id == mid){
						window.location.href =urls[i].myurl;
					}
				}
				
			})
		})		
	})		
	</script>
</html>