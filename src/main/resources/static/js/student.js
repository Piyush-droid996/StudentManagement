$(document).ready(function () {
    $(".close").on("click", function () {
        $(".modal").hide();
    });
});

// Open Add Student Modal
function openAddStudentModal() {
    $("#addStudentModal").show();
}

// Close Add Student Modal
function closeAddStudentModal() {
    $("#addStudentModal").hide();
}

// Add Student (AJAX)
function addStudent() {
    let name = $("#studentName").val();
    let course = $("#studentCourse").val();

    if (name === "" || course === "") {
        alert("Name and Course cannot be empty!");
        return;
    }

    $.ajax({
        url: "/students/add",
        type: "POST",
        data: { name: name, course: course },
        success: function () {
            alert("Student added successfully!");
            location.reload();
        },
        error: function () {
            alert("Error adding student!");
        }
    });
}


// Open Update Student Modal (Without Pre-Filled Details)
function openUpdateModal(id) {
    $("#updateStudentId").val(id);
    $("#updateStudentName").val(""); // Empty input field
    $("#updateStudentCourse").val(""); // Empty input field
    $("#updateStudentModal").show();
}

// Close Update Student Modal
function closeUpdateModal() {
    $("#updateStudentModal").hide();
}

// Update Student (AJAX)
function updateStudent() {
    let id = $("#updateStudentId").val();
    let name = $("#updateStudentName").val().trim();
    let course = $("#updateStudentCourse").val().trim();

    if (name === "" || course === "") {
        alert("Name and Course cannot be empty!");
        return;
    }

    $.ajax({
        url: "/students/update",
        type: "POST",
        data: { id: id, name: name, course: course },
        success: function () {
            alert("Student updated successfully!");
            location.reload();
        },
        error: function () {
            alert("Error updating student!");
        }
    });
}


// Delete Student (AJAX)
function deleteStudent(studentId) {
    if (!confirm("Are you sure?")) return;

    $.ajax({
        url: `/students/delete/${studentId}`,
        type: "POST",
        success: function () {
            alert("Student deleted successfully!");
            location.reload();
        },
        error: function () {
            alert("Error deleting student!");
        }
    });
}

// Export to PDF
function exportToPDF() {
    let { jsPDF } = window.jspdf;
    let doc = new jsPDF();

    doc.text("Student List", 14, 10);

    let table = document.getElementById("studentTable");
    let rows = [];

    for (let i = 0; i < table.rows.length; i++) {
        let rowData = [];
        let cells = table.rows[i].cells;

        // Get total columns & exclude last column dynamically
        let totalColumns = cells.length - 1;

        for (let j = 0; j < totalColumns; j++) {
            rowData.push(cells[j].innerText);
        }

        rows.push(rowData);
    }

    let headers = rows[0];
    let body = rows.slice(1);

    doc.autoTable({
        head: [headers],
        body: body,
        startY: 20
    });

    doc.save("Student_List.pdf");
}

// Export to Excel
function exportToExcel() {
    let table = document.getElementById("studentTable");
    let rows = [];

    for (let i = 0; i < table.rows.length; i++) {
        let rowData = [];
        let cells = table.rows[i].cells;

        // Get total columns & exclude last column dynamically
        let totalColumns = cells.length - 1;

        for (let j = 0; j < totalColumns; j++) {
            rowData.push(cells[j].innerText);
        }

        rows.push(rowData);
    }

    let excelContent = "<table border='1'>";
    rows.forEach((row) => {
        excelContent += "<tr>";
        row.forEach((cell) => {
            excelContent += `<td>${cell}</td>`;
        });
        excelContent += "</tr>";
    });
    excelContent += "</table>";

    let blob = new Blob([excelContent], { type: "application/vnd.ms-excel" });
    let link = document.createElement("a");
    link.href = URL.createObjectURL(blob);
    link.download = "students.xls";
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}
