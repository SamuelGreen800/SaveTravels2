     

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>The budgetizer</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
<h1 class="text-center text-primary fw-bold">Budget app</h1>
	
	<div class="container col-6 my-4 mx-auto border border-secondary p-4 bg-light">
		<table class="table table-striped table-light  shadow-lg p-3 mb-5 rounded">
			<tr>
				<th>Expense</th>
				<th>Vendor</th>
				<th>Amount</th>
				<th>Actions</th>
			</tr>
			
			<c:forEach var="eachExpense" items="${expenses}">
			
				<tr>
					<td><a href="/expenses/${eachExpense.id}" class="text-dark"><c:out value="${eachExpense.name}"/></a></td>
					<td><c:out value="${eachExpense.vendor}"/></td>
					<td><c:out value="${eachExpense.amount}"/></td>
					<td><a href="/edit/<c:out value="${eachExpense.id}"/>" class="btn btn-sm btn-success">edit</a> 
					<form action="/delete/${eachExpense.id}" method="post">
					    <input type="hidden" name="_method" value="delete">
					    <input type="submit" value="Delete" class=" btn btn-sm btn-danger">
					</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	
	
	
	</div>

<div class="container col-5 mx-aut border border-secondary  shadow-lg p-3 mb-5 rounded p-4 bg-light">

	<h1 class="text-center fw-bold text-primary">Add an expense:</h1>
	<form:form action = "/submit" method = "post" class="form" modelAttribute="expense">
	
	<div class = "form-group d-flex flex-column">
		<form:label path="name">Expense name:</form:label>
		<form:errors path="name" class="text-warning"/>
		<form:input path="name"/>
	</div>
	
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