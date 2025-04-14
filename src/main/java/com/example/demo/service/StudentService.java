package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.model.Student;

@Service
public class StudentService {
    
	private List<Student> students = new ArrayList<>();

    public StudentService() {
        students.add(new Student(1, "Amit", "Java"));
        students.add(new Student(2, "Neha", "Python"));
        students.add(new Student(3, "Rahul", "C++"));
        students.add(new Student(4, "Sonia", "JavaScript"));
        students.add(new Student(5, "Piyush", "Kotlin"));
    }
    public List<Student> getStudents() {
        return students;
    }

    public Student getStudentById(int id) {
        for (Student student : students) {
            if (student.getId() == id) {
                return student;
            }
        }
        return null; 
    }
    
    public void addStudent(Student addstudent) {
        students.add(addstudent);
    }



 
    public boolean deleteStudent(int id) {
        for (Student student : students) {
            if (student.getId() == id) {
                students.remove(student);
                return true;
            }
        }
        return false;
    }


    public void updateStudent(Student updatedStudent) {
        // looping find st. with same id
        for (Student student : students) {
            if (student.getId() == updatedStudent.getId()) {
      
                student.setName(updatedStudent.getName());
                student.setCourse(updatedStudent.getCourse());
                return; 
            }
        }
    }

}
