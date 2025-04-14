<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.23/jspdf.plugin.autotable.min.js"></script>
</head>
<body>

    <div class="container">
        <h2>Student List</h2>

        <button class="btn btn-excel" onclick="exportToExcel()">Download Excel</button>
        <button class="btn btn-pdf" onclick="exportToPDF()">Download PDF</button>

        <table border="1" width="100%" cellspacing="0" cellpadding="10" id="studentTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Course</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.name}</td>
                        <td>${student.course}</td>
                        <td>
                            <button onclick="openUpdateModal(${student.id}, '${student.name}', '${student.course}')" class="btn-update">Update</button>
                            <button onclick="deleteStudent(${student.id})" class="btn-delete">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Add Student Button -->
        <button class="btn-add" onclick="openAddStudentModal()">Add Student</button>

        <!-- Add Student Modal -->
        <div id="addStudentModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeAddStudentModal()">&times;</span>
                <h3>Add Student</h3>
                <label>Name:</label>
                <input type="text" id="studentName"><br><br>
                <label>Course:</label>
                <input type="text" id="studentCourse"><br><br>
                <button onclick="addStudent()">Save</button>
                <button onclick="closeAddStudentModal()">Cancel</button>
            </div>
        </div>

        <!-- Update Student Modal -->
        <div id="updateStudentModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeUpdateModal()">&times;</span>
                <h3>Update Student</h3>
                <input type="hidden" id="updateStudentId">
                <label>Name:</label>
                <input type="text" id="updateStudentName" required><br><br>
                <label>Course:</label>
                <input type="text" id="updateStudentCourse" reqiured><br><br>
                <button onclick="updateStudent()">Update</button>
                <button onclick="closeUpdateModal()">Cancel</button>
            </div>
        </div>

    </div>

    <!-- Include JavaScript -->
    <script src="/js/student.js"></script>

</body>
</html>
