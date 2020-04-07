package com.example.codeclan.pirateservice.repository.ShipRepository;

import com.example.codeclan.pirateservice.models.Pirate;
import com.example.codeclan.pirateservice.models.Ship;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource
public interface ShipRepository extends JpaRepository<Ship, Long>, ShipRepositoryCustom  {
    List<Ship> findShipsThatHavePiratesNamed(String firstName);
}
