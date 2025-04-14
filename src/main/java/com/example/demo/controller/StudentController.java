package com.example.demo.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.demo.exception.StudentNotFoundException;
import com.example.demo.model.Student;
import com.example.demo.service.StudentService;

@Controller
@RequestMapping("/students") 
public class StudentController {

    private static final Logger logger = LoggerFactory.getLogger(StudentController.class);

    @Autowired
    private StudentService studentService;

    @GetMapping
    public String showStudents(Model model) {
        logger.info("Fetching student list...");
        List<Student> students = studentService.getStudents();
        
        if (students.isEmpty()) {
            throw new StudentNotFoundException("No students found!");
        }
        
        model.addAttribute("students", students);
        return "students"; 
    }

    @PostMapping("/update")
    @ResponseBody 
    public ResponseEntity<String> updateStudent(@RequestParam int id, 
                                                @RequestParam String name, 
                                                @RequestParam String course) {
        logger.info("Updating student with ID={}", id);
        Student student = studentService.getStudentById(id);
        
        if (student == null) {
            throw new StudentNotFoundException("Student with ID " + id + " not found!");
        }

        Student updatedStudent = new Student(id, name, course);
        studentService.updateStudent(updatedStudent);
        logger.info("Student updated successfully: ID={}, Name={}, Course={}", id, name, course);
        
        return ResponseEntity.ok("Student updated successfully"); 
    }

    @GetMapping("/{id}")
    public String getStudentById(@PathVariable int id, Model model) {
        logger.info("Fetching student details for ID={}", id);
        Student student = studentService.getStudentById(id);

        if (student == null) {
            throw new StudentNotFoundException("Student with ID " + id + " not found!");
        }

        model.addAttribute("student", student);
        return "student-detail"; 
    }

    @PostMapping("/add")
    public String addStudent(@RequestParam String name, @RequestParam String course) {
        logger.info("Adding new student: Name={}, Course={}", name, course);

        List<Student> students = studentService.getStudents();
        int newId = students.isEmpty() ? 1 : students.get(students.size() - 1).getId() + 1;

        Student newStudent = new Student(newId, name, course);
        studentService.addStudent(newStudent);
        logger.info("Student added successfully: {}", newStudent);

        return "redirect:/students";
    }

  

    @PostMapping("/delete/{id}")
    public ResponseEntity<String> deleteStudent(@PathVariable int id) {
        logger.info("Attempting to delete student with ID={}", id);
        
        if (!studentService.deleteStudent(id)) {
            throw new StudentNotFoundException("Student with ID " + id + " not found!");
        }

        logger.info("Student deleted successfully: ID={}", id);
        return ResponseEntity.ok("Student deleted successfully!");
    }
}
