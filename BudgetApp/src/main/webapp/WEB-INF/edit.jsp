<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Expense</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container col-5 mx-aut border border-secondary  shadow-lg p-3 mb-5 rounded p-4 bg-light">

	<h1 class="text-center fw-bold text-success">Edit an expense:</h1>
	<form:form action = "/update/${expense.id }" method = "post" class="form" modelAttribute="expense">
		
		<div class = "form-group d-flex flex-column">
			<form:label path="name">Expense name:</form:label>
			<form:errors path="name" class="text-warning"/>
			<form:input path="name"/>
		</div>
		<input type="hidden" name="_method" value="put">
		<div class = "form-group d-flex flex-column">
			<form:label path="vendor">Vendor:</form:label>
			<form:errors class="text-warning" path="vendor"/>
			<form:input path="vendor"/>
		</div>
		
		<div class = "form-group d-flex flex-column">
			<form:label path="amount">Amount:</form:label>
			<form:errors class="text-warning" path="amount"/>
			<form:input path="amount" type="double"/>
		</div>
		
		<div class = "form-group d-flex flex-column">
			<form:label path="description">Description</form:label>
			<form:errors path="description" class="text-warning"/>
			<form:textarea path="description" rows="3" cols="5"/>
		</div>
		
		<div class = "form-group d-flex justify-content-end">
			<input type ="submit" class="btn my-4 mr-auto shadow-lg btn-primary" value ="Submit">
			</div>
	</form:form>

</div>


</body>
</html>