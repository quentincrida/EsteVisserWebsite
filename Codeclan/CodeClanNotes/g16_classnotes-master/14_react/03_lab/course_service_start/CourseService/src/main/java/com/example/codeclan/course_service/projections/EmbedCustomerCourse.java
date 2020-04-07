package com.example.codeclan.course_service.projections;

import com.example.codeclan.course_service.models.Booking;
import com.example.codeclan.course_service.models.Course;
import com.example.codeclan.course_service.models.Customer;
import org.springframework.data.rest.core.config.Projection;

import java.util.Date;

@Projection(name= "embedCustomerCourse", types = Booking.class)
public interface EmbedCustomerCourse {
    long getId();
    String getDate();
    Customer getCustomer();
    Course getCourse();
}
