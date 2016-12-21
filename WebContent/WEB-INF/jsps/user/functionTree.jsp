
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsps/common/include.jsp"%>

	<c:forEach var="cur" items="${childrenList}">
		<a class="suofang"
			onclick="jQuery.role.userRoleFunctionDiv(this, ${functionList.id}, ${children.id });">-</a>
		<label><input type="checkbox"
			id="function_id_${functionList.id }_${children.id }"
			name="functionIdList" value="${children.id}"
			onclick="jQuery.role.userRoleFunctionCheckbox(this, ${functionList.id}, ${children.id }, 0);" />${children.name}</label>
		<c:if test="${fn:length(cur.children) > 0}">
			<c:set var="childrenList" value="${cur.children}" scope="request" />
			<c:import url="functionTree.jsp" />
			<!-- 这就是递归 -->
		</c:if>
	</c:forEach>

