<!--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
    
     Bootstrap CSS 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

     Navigation Bar 
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/students">Student Management</a>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>Update Student</h2>

         Bootstrap Form 
        <form action="update" method="post" class="row g-3">
            <input type="hidden" name="id" value="${student.id}">
            
            <div class="col-md-6">
                <label class="form-label">Name:</label>
                <input type="text" class="form-control" name="name" value="${student.name}" required>
            </div>
            
            <div class="col-md-6">
                <label class="form-label">Course:</label>
                <input type="text" class="form-control" name="course" value="${student.course}" required>
            </div>
            
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Update</button>
                <a href="/students" class="btn btn-secondary">Back to List</a>
            </div>
        </form>
    </div>

     Bootstrap JS 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
-->