<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="es">

		<head>
			<meta charset="UTF-8">
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
				crossorigin="anonymous">
			<link href="css/styles.css" rel="stylesheet">
			<title>Agenda</title>
		</head>

		<body>
		    <c:if test="${empty requestScope.detail}">
                <jsp:include page="/components/contact-form.jsp" />
            </c:if>
 			<c:if test="${!empty requestScope.list}">
				<jsp:include page="/components/contact-list.jsp" />
 			</c:if>
			<c:if test="${!empty requestScope.detail}">
				<jsp:include page="/components/contact-detail.jsp" />
			</c:if>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
				crossorigin="anonymous"></script>
			 <script src="js/scripts.js" ></script> 
		</body>

		</html>