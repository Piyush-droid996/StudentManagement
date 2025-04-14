<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Details</title>
</head>
<body>
    <div class="container">
        <h2>Student Details</h2>

        <c:if test="${student != null}">
            <table>
                <tr>
                    <th>ID</th>
                    <td>${student.id}</td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td>${student.name}</td>
                </tr>
                <tr>
                    <th>Course</th>
                    <td>${student.course}</td>
                </tr>
            </table>
        </c:if>

        <c:if test="${student == null}">
            <p style="color: red; text-align: center;">Student not found!</p>
        </c:if>

        <div class="back">
            <a href="/students" class="btn">Back to Student List</a>
        </div>
    </div>
</body>
</html>
