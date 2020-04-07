package com.example.codeclan.course_service.projections;

import com.example.codeclan.course_service.models.Booking;
import com.example.codeclan.course_service.models.Course;
import com.example.codeclan.course_service.models.Customer;
import org.springframework.data.rest.core.config.Projection;

import java.util.List;

@Projection(name= "embedBookings", types = Course.class)
public interface EmbedCourseBookings {
    long getId();
    String getName();
    String getTown();
    int getStarRating();
    List<Booking> getBookings();
}
