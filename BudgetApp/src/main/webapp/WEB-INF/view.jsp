<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Expense</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container text-center">
	
		<h1 class="text-primary fw-bold">Expense Details</h1>
		
		 <div class="card col-10 mx-auto my-5 bg-light shadow shadow-lg rk border border-secondary">
                <div class="card-body">
                    <p class="card-text"><span class="fw-bold">Expense Name: </span><c:out value="${expense.name}"/></p>
                    <p class="card-text"><span class="fw-bold">Description: </span><c:out value="${expense.description}"/></p>
                    <p class="card-text"><span class="fw-bold">Vendor Name:</span> <c:out value="${expense.vendor}"/></p>
                    <p class="card-text"><span class="fw-bold">Amount Spent:</span> <c:out value="${expense.amount}"/>         </p>
            </div>
        </div>
		<a href="/" class = "btn btn-primary shadow">Home</a>
	</div>

</body>
</html>