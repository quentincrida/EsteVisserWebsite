package com.example.codeclan.course_service.repositories.BookingRepository;

import com.example.codeclan.course_service.models.Booking;
import com.example.codeclan.course_service.projections.EmbedBookings;
import com.example.codeclan.course_service.projections.EmbedCustomerCourse;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

@RepositoryRestResource(excerptProjection = EmbedCustomerCourse.class)
public interface BookingRepository extends JpaRepository<Booking, Long>, BookingRepositoryCustom {
    List<Booking> getAllBookingsForDate(String date);
}
