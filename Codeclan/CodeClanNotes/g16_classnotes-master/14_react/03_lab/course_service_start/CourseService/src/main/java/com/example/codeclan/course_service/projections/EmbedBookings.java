package com.example.codeclan.course_service.projections;

import com.example.codeclan.course_service.models.Booking;
import com.example.codeclan.course_service.models.Customer;
import org.springframework.data.rest.core.config.Projection;

import java.util.List;

@Projection(name= "embedBookings", types = Customer.class)
public interface EmbedBookings {
    long getId();
    String getName();
    String getTown();
    int getAge();
    List<Booking> getBookings();
}
