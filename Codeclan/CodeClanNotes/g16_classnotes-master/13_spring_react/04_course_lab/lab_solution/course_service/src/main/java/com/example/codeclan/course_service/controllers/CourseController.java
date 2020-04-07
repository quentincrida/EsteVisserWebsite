package com.example.codeclan.course_service.controllers;

import com.example.codeclan.course_service.models.Course;
import com.example.codeclan.course_service.models.Customer;
import com.example.codeclan.course_service.repositories.CourseRepository;
import com.example.codeclan.course_service.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/courses")
public class CourseController {

    @Autowired
    CourseRepository courseRepository;

    @Autowired
    CustomerRepository customerRepository;

    @GetMapping
    public ResponseEntity<List<Course>> getAllCourses(){

        return new ResponseEntity<>(courseRepository.findAll(), HttpStatus.OK);
    }

    @GetMapping(value="/{id}")
    public ResponseEntity<Course> getCourse(@PathVariable Long id) {
        return new ResponseEntity(courseRepository.findById(id), HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<Course> postCourse(@RequestBody Course course){
        courseRepository.save(course);
        return new ResponseEntity<>(course, HttpStatus.CREATED);
    }

    @PutMapping(value="/{id}")
    public ResponseEntity<Course> putCourse(@RequestBody Course course){
        courseRepository.save(course);
        return new ResponseEntity<>(course, HttpStatus.OK);
    }

    @DeleteMapping(value="/{id}")
    public ResponseEntity<Long> deleteCourse(@PathVariable Long id){
        courseRepository.deleteById(id);
        return new ResponseEntity<>(id, HttpStatus.OK);
    }

    @GetMapping(value="/{id}/customers")
    public ResponseEntity<List<Customer>> getCustomersForCourse(@PathVariable Long id) {
        return new ResponseEntity<>(customerRepository.findAllByBookingsCourseId(id), HttpStatus.OK);
    }

    @GetMapping(value = "/stars/{rating}")
    public ResponseEntity<List<Course>> coursesForStarRating(@PathVariable int rating){
        return new ResponseEntity(courseRepository.findCoursesByStarRating(rating), HttpStatus.OK);
    }

    @GetMapping(value = "/{id}/customers/town/{town}")
    public ResponseEntity<List<Customer>> customersForCourseInTown(@PathVariable Long id, @PathVariable String town){
        return new ResponseEntity<>(customerRepository.findAllByTownAndBookingsCourseId(town, id), HttpStatus.OK);
    }

    @GetMapping(value = "/{id}/customers/town/{town}/age/{age}")
    public ResponseEntity<List<Customer>> customersForCourseInTown(@PathVariable Long id, @PathVariable String town, @PathVariable int age){
        return new ResponseEntity<>(customerRepository.findAllByTownAndAgeGreaterThanAndBookingsCourseId(town, age, id), HttpStatus.OK);
    }
}
