<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-default">
	<div class="panel-heading">
		<span class="glyphicon glyphicon-th-list"></span> 
		<strong>Chủng loại</strong>
	</div>

	<div class="list-group">
	<c:forEach var="c" items="${cates}">
		<a href="product/list-by-category/${c.id}.php" class="list-group-item">${c.name}</a>
	</c:forEach> 
	</div>
</div>